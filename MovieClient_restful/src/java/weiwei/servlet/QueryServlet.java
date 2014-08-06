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
import weiwei.entity.YoutubeVideo;
import weiwei.flicker.Flickr;
import weiwei.google.SearchGoogle;
import weiwei.google.SearchYoutube;

/**
 *
 * @author Weiwei
 */
@WebServlet(name = "QueryServlet", urlPatterns = {"/QueryServlet"})
public class QueryServlet extends HttpServlet {

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

        this.query(request, response);
    }

    private JSONObject initJSON(String movieName) throws Exception {
        NewJerseyClient movieClient = new NewJerseyClient();
        JSONObject jo = JSONObject.fromObject(movieClient.find_JSON(String.class, movieName));
        return jo;
    }

    private void query(HttpServletRequest request, HttpServletResponse response) {
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
            
            List<String> flickrImgList = this.queryFlickr(movieName);
            List<YoutubeVideo> youtubeVideoIdList = this.queryYoutube(movieName);
            
            
            
            request.setAttribute("mtitle", movieName);
            request.setAttribute("message", message);
            
            request.setAttribute("flickrimglist", flickrImgList);
            request.setAttribute("youtubeVideoIdList", youtubeVideoIdList);
            
            newPage = "/other.jsp";

        } else {
            String mtitle = jo.getString("title");
            String mtype = jo.getString("type");
            double mrating = jo.getDouble("rating");
            String mdescription = jo.getString("description");
            String mdirector = jo.getString("director");
            String mstars = jo.getString("stars");
            String mcoverpath = jo.getString("coverpath");

            List<String> flickrImgList = this.queryFlickr(movieName + " " + mdirector);
            List<YoutubeVideo> youtubeVideoIdList = this.queryYoutube(movieName + " " + "trailer");  
            List<GoogleSearchResult> googleList = this.queryGoogle(movieName);

            request.setAttribute("mtitle", mtitle);
            request.setAttribute("mtype", mtype);
            request.setAttribute("mrating", mrating);
            request.setAttribute("mdescription", mdescription);
            request.setAttribute("mdirector", mdirector);
            request.setAttribute("mstars", mstars);
            request.setAttribute("mcoverpath", mcoverpath);

            request.setAttribute("flickrimglist", flickrImgList);
            request.setAttribute("youtubeVideoIdList", youtubeVideoIdList);
            request.setAttribute("googleList", googleList);
            
            newPage = "/detail.jsp";
        }

        try {
            request.getRequestDispatcher(newPage).forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(QueryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    private List<GoogleSearchResult> queryGoogle(String keyword){       
        return  SearchGoogle.getInstance().search(keyword);
    }

    private List<String> queryFlickr(String keyword) {
        List<URL> imgList = Flickr.getInstance().search(keyword + " movie");
        List<String> list = new ArrayList<>();
        for (URL url : imgList) {
            list.add(url.toString());
        }
        return list;
    }

    private List<YoutubeVideo> queryYoutube(String keyword) {
        List<YoutubeVideo> videoList = SearchYoutube.getInstance().searchFromYoutube(keyword);
        return videoList;
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
