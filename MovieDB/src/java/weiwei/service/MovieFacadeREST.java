/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package weiwei.service;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import weiwei.entity.Movie;

/**
 *
 * @author Weiwei
 */
@Stateless
@Path("weiwei.entity.movie")
public class MovieFacadeREST extends AbstractFacade<Movie> {
    @PersistenceContext(unitName = "MovieDBPU")
    private EntityManager em;

    public MovieFacadeREST() {
        super(Movie.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Movie entity) {
        super.create(entity);
    }


    @GET
    @Path("{title}")
    @Produces({"application/json"})
    public Movie find(@PathParam("title") String title) {
        String id = "";
        for (Movie m : super.findAll()) {
            if (m.getTitle().equalsIgnoreCase(title.trim())) {
                id = m.getImdbnum();
            }
        }
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Movie> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Movie> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
