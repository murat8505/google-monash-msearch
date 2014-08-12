<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/photoSizeControl.js" type="text/javascript"></script>
        <!--Bootstrap with its dependencies-->
        <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
        
        <title>Sorry, not found this item.</title>
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
                        <li class="active"><a href="./local.jsp">LOCAL</a></li>
                        <li><a href="./flickr.jsp">FLICKR</a></li>
                        <li><a href="./youtube.jsp">YOUTUBE</a></li>
                        <li><a href="./google.jsp">GOOGLE</a></li>
                        <li><a href="./addmovie.jsp">ADD</a></li>

                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <div class="container">

            <div class="row">
                <br>
                <form role="form" class="form-horizontal" method="post" action="QueryInfoServlet?method=local">
                    <div class="form-group">
                        <div class="col-md-2">
                            <img src="./pic/local-search.png" width="160px" height="70px">
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

            <div class="row">
                <br>
                <br>
            </div>

            <div class="row"><!--Second row-->
                <div class="alert alert-danger" role="alert">
                    <p><strong>Sorry,</strong> your request item <strong>"${mtitle}"</strong> is not found in our local database. We sincerely invite you to help us to perfect the local search service.
                    <p>You can choose from the following options:</p>
                </div>
            </div>

            <div class="btn-group btn-group-justified">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addMovie">ADD MOVIE</button>
                </div>
                <div class="btn-group">
                    <a href="QueryInfoServlet?method=flickr&moviename=${mtitle}"><button type="button" class="btn btn-default">SEARCH IMAGES</button></a>
                </div>
                <div class="btn-group">
                    <a href="QueryInfoServlet?method=youtube&moviename=${mtitle}"><button type="button" class="btn btn-default">SEARCH TRAILERS</button></a>
                </div>
                <div class="btn-group">
                    <a href="QueryInfoServlet?method=google&moviename=${mtitle}"><button type="button" class="btn btn-default">SEARCH CONTENTS</button></a>
                </div>
            </div>

            <div class="row">
                <br>
                <br>
                <br>
                <br>
                <br>
                <!-- Modal -->
                <div class="modal fade" id="addMovie" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">Add this new movie</h4>
                            </div>
                            <form class="form-horizontal" role="form" method="post" action="CreateServlet">
                                <div class="modal-body">

                                    <div class="form-group">
                                        <label for="imdbnum" class="col-sm-4 control-label">IMDB NUM</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="imdbnum" name="imdbnum" placeholder="Find it from imdb, e.g. tt2872732" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="title" class="col-sm-4 control-label">TITLE</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="title" name="title" placeholder="Title of movie, e.g. Lucy" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="director" class="col-sm-4 control-label">DIRECTOR</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="director" name="director" placeholder="Director of movie, e.g. Wen Jiang" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="type" class="col-sm-4 control-label">TYPE</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="type" name="type" placeholder="Type of movie, e.g. Action, Drama" required>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label for="description" class="col-sm-4 control-label">DESCRIPTION</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="description" name="description" placeholder="Description of movie" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="stars" class="col-sm-4 control-label">STARS</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="stars" name="stars" placeholder="e.g. Name1, Name2, Name3">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="coverpath" class="col-sm-4 control-label">COVER PATH</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="coverpath" name="coverpath" placeholder="URL of the title photo">
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%@include file="./public/footer.html" %>

        </div><!--.container -->
    </body>
</html>

