<%-- 
    Document   : google.jsp
    Created on : Aug 5, 2014, 2:26:06 PM
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
        <title>MSearch: Content search</title>

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
                        <li><a href="./index.jsp">HOME</a></li>
                        <li><a href="./local.jsp">LOCAL</a></li>
                        <li><a href="./flickr.jsp">FLICKR</a></li>
                        <li><a href="./youtube.jsp">YOUTUBE</a></li>
                        <li class="active"><a href="./google.jsp">GOOGLE</a></li>
                        <li><a href="./addmovie.jsp">ADD</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>  

        <div class="container">

            <div class="row">
                <br>
                <form role="form" class="form-horizontal" method="post" action="QueryInfoServlet?method=google">
                    <div class="form-group">
                        <div class="col-md-2">
                            <img src="./pic/content-search.png" width="160px" height="70px">
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

            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Search results from Google</h3>
                </div>
                <div class="panel-body">
                    <!--for-each -->

                    <ul class="list-group">
                        <c:forEach var="item" items="${googleList}">
                            <li class="list-group-item">
                                <a href="${item.link}" target="_Blank"><strong>${item.title}</strong></a>
                                <p>${item.snippet}</p>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div><!--panel-->
            <%@include file="./public/footer.html" %>
        </div><!--container-->
    </body>
</html>
