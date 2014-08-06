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
        <title>MSearch: Image search</title>

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
                        <li class="active"><a href="./flickr.jsp">FLICKR</a></li>
                        <li><a href="./youtube.jsp">YOUTUBE</a></li>
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
                <form role="form" class="form-horizontal" method="post" action="QueryInfoServlet?method=flickr">
                    <div class="form-group">
                        <div class="col-md-2">
                            <img src="./pic/image-search.png" width="160px" height="70px">
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

            <div>
                <hr>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Photos from Flickr</h3>
                    </div>
                    <div class="panel-body">
                        <!--for-each -->
                        <p class="text-justify">
                        <c:forEach var="img" items="${flickrimglist}">
                            <img src="${img}" class="img-rounded img-margin" onload="AutoResizeImage(0, 200, this)">
                        </c:forEach>
                        </p>
                        <br>
                        <h1>${message}</h1>
                        <!--
                        <div class="btn-group btn-group-right col-md-offset-5">
                            <div class="btn-group">
                                <a href="https://www.flickr.com/search/?q=${mtitle}" target="_Blank"><button type="button" class="btn btn-default">Search ${mtitle}</button></a>
                            </div>
                            <div class="btn-group">
                                <a href="https://www.flickr.com/search/?q=${mdirector}" target="_Blank"> <button type="button" class="btn btn-default">Search ${mdirector}</button></a>
                            </div>
                        </div>
                        -->
                    </div>
                </div><!--panel-->
            </div>

        </div><!--.container body -->
    </body>
</html>

