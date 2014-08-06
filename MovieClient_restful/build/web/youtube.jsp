<%-- 
    Document   : flickr.jsp
    Created on : Aug 5, 2014, 9:48:10 AM
    Author     : Weiwei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link href="css/weiwei.style.css" rel="stylesheet" type="text/css"/>
        
        <!--YUI-AutoComplete Plugin-->
        <script src="http://yui.yahooapis.com/3.17.2/build/yui/yui-min.js"></script>
        <script src="js/bootstrap3-typeahead.min.js" type="text/javascript"></script>
        <script src="js/yui.ac.js" type="text/javascript"></script>
        
        <script src="js/photoSizeControl.js" type="text/javascript"></script>
        <title>MSearch: Video search</title>

    </head>
    <body>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="./index.jsp">MSearch</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
                    <ul class="nav navbar-nav">
                        <li><a href="./index.jsp">ALL</a></li>
                        <li><a href="./local.jsp">LOCAL</a></li>
                        <li><a href="./flickr.jsp">FLICKR</a></li>
                        <li class="active"><a href="./youtube.jsp">YOUTUBE</a></li>
                        <li><a href="./google.jsp">GOOGLE</a></li>
                        <li><a href="#">TREND</a></li>
                        <li><a href="./addmovie.html">ADD</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>        

        <div class="container">
            <div class="row">
                <br>
                <form role="form" class="form-horizontal" method="post" action="QueryInfoServlet?method=youtube">
                    <div class="form-group">
                        <div class="col-md-2">
                            <img src="./pic/video-search.png" width="160px" height="70px">
                        </div>
                        <div class="col-md-6">
                            <br>
                            <div class="yui3-skin-sam input-group">
                                <div id="the-basics">
                                    <input type="text" id="yui-ac" name="moviename" class="typeahead form-control" placeholder="Movie name you want to search">
                                </div>

                                <span class="input-group-btn">
                                    <button class="btn btn-success btn" type="submit">Search!</button>
                                </span>
                            </div><!-- /input-group -->
                        </div><!-- /.col-md-8 -->
                    </div><!--/from-group -->
                </form>
            </div><!--First row: search input -->


            <hr>
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">Trailer from Youtube</h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-5">
                        <div class="media">
                            <a class="pull-left" href="https://www.youtube.com/watch?v=${youtubeVideoIdList[0].videoNum}" target="_Blank">
                                <img class="media-object" src="${youtubeVideoIdList[0].thumbnail}" >
                            </a>
                            <div class="media-body">
                                <!--<strong class="media-heading">${youtubeVideoIdList[0].videoTitle}</strong>-->
                                <p>${youtubeVideoIdList[0].description}</p>
                            </div>
                        </div>
                        <div class="media">
                            <a class="pull-left" href="https://www.youtube.com/watch?v=${youtubeVideoIdList[1].videoNum}" target="_Blank">
                                <img class="media-object" src="${youtubeVideoIdList[1].thumbnail}" >
                            </a>
                            <div class="media-body">
                                <!--<p class="media-heading">${youtubeVideoIdList[1].videoTitle}</p>-->
                                <p>${youtubeVideoIdList[1].description}</p>
                            </div>
                        </div>
                        <div class="media">
                            <a class="pull-left" href="https://www.youtube.com/watch?v=${youtubeVideoIdList[2].videoNum}" target="_Blank">
                                <img class="media-object" src="${youtubeVideoIdList[2].thumbnail}" >
                            </a>
                            <div class="media-body">
                                <!--<p class="media-heading3">${youtubeVideoIdList[2].videoTitle}</p>-->
                                <p>${youtubeVideoIdList[2].description}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe id="ytplayer" type="text/html" class="embed-responsive-item"
                                    src="http://www.youtube.com/embed/${youtubeVideoIdList[0].videoNum}"
                                    frameborder="0"/>
                        </div>
                    </div><!--media/video -->
                </div>

            </div><!-- panel -->
        </div>
                                    
        <%@include file="./public/footer.html" %>
    </div><!--.container body -->
</body>
</html>

