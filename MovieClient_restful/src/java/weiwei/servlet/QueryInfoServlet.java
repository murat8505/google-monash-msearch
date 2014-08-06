/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package weiwei.servlet;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import weiwei.client.NewJerseyClient;
import weiwei.entity.GoogleSearchResult;
import weiwei.entity.Movie;
import weiwei.entity.SentimentData;
import weiwei.entity.YoutubeVideo;
import weiwei.flicker.Flickr;
import weiwei.google.SearchGoogle;
import weiwei.google.SearchYoutube;
import weiwei.twitter.SentimentAnalysis;

/**
 *
 * @author Weiwei
 */
@WebServlet(name = "QueryInfoServlet", urlPatterns = {"/QueryInfoServlet"})
public class QueryInfoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String method = request.getParameter("method");
        System.out.println(method);

        if (method != null) {
            if ("local".equals(method)) {
                this.queryLocal(request, response);
            } else if ("flickr".equals(method)) {
                this.queryFlickr(request, response);
            } else if ("youtube".equals(method)) {
                this.queryYoutube(request, response);
            } else if ("google".equals(method)) {
                this.queryGoogle(request, response);
            } else {
                //TODO: search all
            }
        }
    }
    
    private SentimentData getSentimentAnalysis(String keyword){
        //String keyword = request.getParameter("moviename");
        SentimentAnalysis sa  = SentimentAnalysis.getInstance();
        String json = sa.getSentiment(keyword);
        SentimentData sd = sa.parseString(json);
        return sd;
    }
    
    private void queryGoogle(HttpServletRequest request, HttpServletResponse response) {
        String keyword = request.getParameter("moviename");
        List<GoogleSearchResult> googleList = SearchGoogle.getInstance().search(keyword);
        request.setAttribute("googleList", googleList);

        try {
            request.getRequestDispatcher("./google.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(QueryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void queryYoutube(HttpServletRequest request, HttpServletResponse response) {
        String keyword = request.getParameter("moviename");
        List<YoutubeVideo> videoList = SearchYoutube.getInstance().searchFromYoutube(keyword);

        request.setAttribute("youtubeVideoIdList", videoList);

        try {
            request.getRequestDispatcher("./youtube.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(QueryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void queryFlickr(HttpServletRequest request, HttpServletResponse response) {
        String movieName = request.getParameter("moviename");

        List<URL> imgList = Flickr.getInstance().search(movieName);
        List<String> list = new ArrayList<>();

        if (imgList != null) {
            for (URL url : imgList) {
                list.add(url.toString());
            }          
            request.setAttribute("flickrimglist", list);
        } else {
            request.setAttribute("message", "no matched items!");
        }

        

        try {
            request.getRequestDispatcher("./flickr.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(QueryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void queryLocal(HttpServletRequest request, HttpServletResponse response) {
        String movieName = request.getParameter("moviename");
        String newPage = "";
        JSONObject jo = null;
        try {
            jo = initJSON(movieName);
            
            
        } catch (Exception ex) {
            //Logger.getLogger(QueryServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("NO MATCHED ITEM");
        }

        if (jo == null) {
            String message = "NOT FOUND";

            request.setAttribute("mtitle", movieName);
            request.setAttribute("message", message);

            newPage = "/other.jsp";

        } else {
            
            SentimentData sd = getSentimentAnalysis(movieName);//get sentiment analysis ot the specific movie
            
            Movie movie = new Movie();
            movie.setImdbnum(jo.getString("imdbnum"));
            movie.setTitle(jo.getString("title"));
            movie.setRating(jo.getDouble("rating"));
            movie.setType(jo.getString("type"));
            movie.setDescription(jo.getString("description"));
            movie.setStars(jo.getString("stars"));
            movie.setDirector(jo.getString("director"));
            movie.setCoverpath(jo.getString("coverpath"));

            request.setAttribute("movie", movie);
            request.setAttribute("sentimentdata", sd);
            
            newPage = "/local.jsp";
        }

        try {
            request.getRequestDispatcher(newPage).forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(QueryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private JSONObject initJSON(String movieName) throws Exception {
        NewJerseyClient movieClient = new NewJerseyClient();
        JSONObject jo = JSONObject.fromObject(movieClient.find_JSON(String.class, movieName));
        return jo;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
