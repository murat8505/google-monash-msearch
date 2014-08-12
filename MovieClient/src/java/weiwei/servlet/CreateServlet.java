/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package weiwei.servlet;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import weiwei.client.JerseyTweetSentimentAnalysisClient;
import weiwei.client.NewJerseyClient;
import weiwei.entity.Movie;

/**
 *
 * @author Weiwei
 */
@WebServlet(name = "CreateServlet", urlPatterns = {"/CreateServlet"})
public class CreateServlet extends HttpServlet {

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
        this.createMovie(request, response);
    }

    public void createMovie(HttpServletRequest request, HttpServletResponse response) {
        String imdbnum = request.getParameter("imdbnum");
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String stars = request.getParameter("stars");
        String coverpath = request.getParameter("coverpath");

        NewJerseyClient movieClient = new NewJerseyClient();
        JSONObject jo = new JSONObject();
        jo.put("imdbnum", imdbnum);
        jo.put("title", title);
        jo.put("type", type);
        jo.put("description", description);
        jo.put("director", director);
        jo.put("stars", stars);
        jo.put("coverpath", coverpath);
        movieClient.create_JSON(jo.toString());
        queryLocal(request, response, title);//if add success
        
        //if add faild:
        //TODO: go to the error page

        /**
         * try { request.getRequestDispatcher("local.jsp").forward(request,
         * response); } catch (ServletException | IOException ex) {
         * Logger.getLogger(QueryServlet.class.getName()).log(Level.SEVERE,
         * null, ex);
        }*
         */
    }
    
    private void queryLocal(HttpServletRequest request, HttpServletResponse response, String title) {
        String movieName = title;
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

            Double saScore = getTweetSentimentAnalysis(movieName);

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
            request.setAttribute("sascore", saScore);

            newPage = "/local.jsp";
        }

        try {
            request.getRequestDispatcher(newPage).forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private JSONObject initJSON(String movieName) throws Exception {
        NewJerseyClient movieClient = new NewJerseyClient();
        JSONObject jo = JSONObject.fromObject(movieClient.find_JSON(String.class, movieName));
        return jo;
    }

    private double getTweetSentimentAnalysis(String text){
        JerseyTweetSentimentAnalysisClient tweetSAClient = new JerseyTweetSentimentAnalysisClient();
        //concatenation with "%20movie" is for the purpose of improving the analysis accuracy
        JSONObject jo = JSONObject.fromObject(tweetSAClient.getTweetSentimentAnalysis(String.class, text+"%20movie"));
        double score = jo.getDouble("score"); //the returned score is between -1 and 1
        return (score+1)/2; //normalized the data into interval 0 and 1
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
