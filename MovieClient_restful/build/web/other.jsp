<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/photoSizeControl.js" type="text/javascript"></script>
        <title>Detail of ${mtitle}</title>
    </head>
    <body>
        <div class="container">

            <div class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="http://localhost:8080/MovieClient/">MSearch</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">LOCAL</a></li>
                            <li><a href="#">TUDOU</a></li>
                            <li><a href="#">FLICKER</a></li>
                            <li><a href="#">YOUTUBE</a></li>
                        </ul>

                        <form class="navbar-form navbar-right" role="search" method="get" action="QueryServlet">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search" name="moviename">
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                    </div><!--/.nav-collapse -->



                </div><!--/.container-fluid -->
            </div>

            <div class="alert alert-danger" role="alert">
                <p><strong>Sorry,</strong> your request item is not found in the local database. However, the Flickr and Youtube is available for you.
                <a href="addmovie.html"><button class="btn btn-info">Add this moive!</button></a></p>
            </div>

            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Flickr</h3>
                </div>
                <div class="panel-body">
                    <!--for-each -->

                    <c:forEach var="img" items="${flickrimglist}">
                        <img src="${img}" class="img-rounded" onload="AutoResizeImage(0, 300, this)">
                    </c:forEach>

                    <br><br>
                        
                    <div class="btn-group btn-group-right">
                        <div class="btn-group">
                            <a href="https://www.flickr.com/search/?q=${mtitle}" target="_Blank"><button type="button" class="btn btn-default">Search ${mtitle}</button></a>
                        </div>
                        <div class="btn-group">
                            <a href="https://www.flickr.com/search/?q=${mdirector}" target="_Blank"><button type="button" class="btn btn-default">Search ${mdirector}</button></a>
                        </div>
                        <div class="btn-group">
                            <a href="https://www.flickr.com/search/?q=${mtitle}+${mdirector}" target="_Blank"><button type="button" class="btn btn-info">Search others</button></a>
                        </div>
                      </div>
                   

                </div>
            </div><!--panel-->

            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">Youtube</h3>
                </div>
                <div class="panel-body">
                    <c:forEach var="videoId" items="${youtubeVideoIdList}">
                        <iframe id="ytplayer" type="text/html" width="480" height="270"
                                src="http://www.youtube.com/embed/${videoId}"
                                frameborder="0"/>                                      
                    </c:forEach>
                </div>
            </div><!-- panel-->

            <%@include file="./public/footer.html" %>

        </div><!--.container -->
    </body>
</html>

