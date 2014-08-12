/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package weiwei.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Weiwei
 */
@Entity
@Table(name = "movie")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Movie.findAll", query = "SELECT m FROM Movie m"),
    @NamedQuery(name = "Movie.findByImdbnum", query = "SELECT m FROM Movie m WHERE m.imdbnum = :imdbnum"),
    @NamedQuery(name = "Movie.findByTitle", query = "SELECT m FROM Movie m WHERE m.title = :title"),
    @NamedQuery(name = "Movie.findByType", query = "SELECT m FROM Movie m WHERE m.type = :type"),
    @NamedQuery(name = "Movie.findByRating", query = "SELECT m FROM Movie m WHERE m.rating = :rating"),
    @NamedQuery(name = "Movie.findByDescription", query = "SELECT m FROM Movie m WHERE m.description = :description"),
    @NamedQuery(name = "Movie.findByDirector", query = "SELECT m FROM Movie m WHERE m.director = :director"),
    @NamedQuery(name = "Movie.findByStars", query = "SELECT m FROM Movie m WHERE m.stars = :stars"),
    @NamedQuery(name = "Movie.findByCoverpath", query = "SELECT m FROM Movie m WHERE m.coverpath = :coverpath")})
public class Movie implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "imdbnum")
    private String imdbnum;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "title")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "type")
    private String type;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "rating")
    private Double rating;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 400)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "director")
    private String director;
    @Size(max = 100)
    @Column(name = "stars")
    private String stars;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "coverpath")
    private String coverpath;

    public Movie() {
    }

    public Movie(String imdbnum) {
        this.imdbnum = imdbnum;
    }

    public Movie(String imdbnum, String title, String type, String description, String director, String coverpath) {
        this.imdbnum = imdbnum;
        this.title = title;
        this.type = type;
        this.description = description;
        this.director = director;
        this.coverpath = coverpath;
    }

    public String getImdbnum() {
        return imdbnum;
    }

    public void setImdbnum(String imdbnum) {
        this.imdbnum = imdbnum;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getStars() {
        return stars;
    }

    public void setStars(String stars) {
        this.stars = stars;
    }

    public String getCoverpath() {
        return coverpath;
    }

    public void setCoverpath(String coverpath) {
        this.coverpath = coverpath;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (imdbnum != null ? imdbnum.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Movie)) {
            return false;
        }
        Movie other = (Movie) object;
        if ((this.imdbnum == null && other.imdbnum != null) || (this.imdbnum != null && !this.imdbnum.equals(other.imdbnum))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "weiwei.entity.Movie[ imdbnum=" + imdbnum + " ]";
    }
    
}
