<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">Movie Detail</h3>
                </div>
                <div class="panel-body">
                    <h1><small>Moive Name </small> ${mtitle}</h1>
                    <hr>
                    <div class="row">
                        <div class="col-md-3"><img src="${mcoverpath}" width="205px" height="315px" class="img-rounded"></div>
                        <div class="col-md-6">
                            <ul class="list-group">
                                <li class="list-group-item">

                                    <h5><span class="label label-primary">Type</span> ${mtype}</h5>
                                </li>
                                <li class="list-group-item">

                                    <h5><span class="label label-primary">IMDB Rating</span> ${mrating}</h5>
                                </li>
                                <li class="list-group-item">                                  
                                    <span class="label label-primary">Description</span><h5> ${mdescription}</h5>
                                </li>
                                <li class="list-group-item">

                                    <h5><span class="label label-primary">Director</span> ${mdirector}</h5>
                                </li>
                                <li class="list-group-item">

                                    <h5><span class="label label-primary">Stars</span> ${mstars}</h5>
                                </li>
                            </ul>

                        </div>

                    </div>

                </div><!--panel-body -->
            </div><!--panel -->

            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Photos from Flickr</h3>
                </div>
                <div class="panel-body">
                    <!--for-each -->
                    <p class="text-center">
                        <c:forEach var="img" items="${flickrimglist}">
                            <img src="${img}" class="img-rounded" onload="AutoResizeImage(0, 300, this)">
                        </c:forEach>
                    </p>
                    <br>

                    <div class="btn-group btn-group-right col-md-offset-5">
                        <div class="btn-group">
                            <a href="https://www.flickr.com/search/?q=${mtitle}" target="_Blank"><button type="button" class="btn btn-default">Search ${mtitle}</button></a>
                        </div>
                        <div class="btn-group">
                            <a href="https://www.flickr.com/search/?q=${mdirector}" target="_Blank"> <button type="button" class="btn btn-default">Search ${mdirector}</button></a>
                        </div>
                    </div>
                </div>
            </div><!--panel-->

            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">Trailer from Youtube</h3>
                </div>
                <div class="panel-body">
                    <div class="row">

                        <div class="col-md-5">
                            <div class="media">
                                <a class="pull-left" href="https://www.youtube.com/watch?v=${youtubeVideoIdList[0].videoNum}" target="_Blank">
                                    <img class="media-object" src="${youtubeVideoIdList[0].thumbnail}" alt="thumbnail">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading">${youtubeVideoIdList[0].videoTitle}</h4>
                                    <p>${youtubeVideoIdList[0].description}</p>
                                </div>
                            </div>
                            <div class="media">
                                <a class="pull-left" href="https://www.youtube.com/watch?v=${youtubeVideoIdList[1].videoNum}" target="_Blank">
                                    <img class="media-object" src="${youtubeVideoIdList[1].thumbnail}" alt="thumbnail">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading">${youtubeVideoIdList[1].videoTitle}</h4>
                                    <p>${youtubeVideoIdList[1].description}</p>
                                </div>
                            </div>
                            <div class="media">
                                <a class="pull-left" href="https://www.youtube.com/watch?v=${youtubeVideoIdList[2].videoNum}" target="_Blank">
                                    <img class="media-object" src="${youtubeVideoIdList[2].thumbnail}" alt="thumbnail">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading">${youtubeVideoIdList[2].videoTitle}</h4>
                                    <p>${youtubeVideoIdList[2].description}</p>
                                </div>
                            </div>
                            <br>
                            <div class="well well-sm">You also can click the <strong>video thumbnail</strong> to play in the Youtube.</div>
                        </div>

                        <div class="col-md-7">
                            <iframe id="ytplayer" type="text/html" width="600" height="360"
                                    src="http://www.youtube.com/embed/${youtubeVideoIdList[0].videoNum}"
                                    frameborder="0"/>
                        </div>
                    </div>
                </div>
            </div><!-- panel-->

            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Searching Results from Google</h3>
                </div>
                <div class="panel-body">
                    <!--for-each -->
                    <p class="text-center">
                    <ul class="list-group">
                        <c:forEach var="item" items="${googleList}">
                            <li class="list-group-item">
                                <a href="${item.link}" target="_Blank"><h3>${item.title}</h3></a>
                                <p>${item.snippet}</p>
                            </li>
                        </c:forEach>
                    </ul>
                    </p>
                </div>
            </div><!--panel-->

            <%@include file="./public/footer.html" %>

        </div><!--.container -->
    </body>
</html>

