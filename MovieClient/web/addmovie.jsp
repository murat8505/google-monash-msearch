<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/photoSizeControl.js" type="text/javascript"></script>
        
        <title>MSearch: Add a new movie</title>
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
                        <li><a href="./google.jsp">GOOGLE</a></li>
                        <li class="active"><a href="./addmovie.jsp">ADD</a></li>

                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav> 


        <div class="container">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">Add a new movie</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="post" action="CreateServlet">
                        <div class="form-group">
                            <label for="imdbnum" class="col-sm-2 control-label">IMDB NUM</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="imdbnum" name="imdbnum" placeholder="Find it from imdb, e.g. tt2872732" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">TITLE</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="title" name="title" placeholder="Title of movie, e.g. Lucy" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="director" class="col-sm-2 control-label">DIRECTOR</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="director" name="director" placeholder="Director of movie, e.g. Wen Jiang" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="type" class="col-sm-2 control-label">TYPE</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="type" name="type" placeholder="Type of movie, e.g. Action, Drama" required>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="description" class="col-sm-2 control-label">DESCRIPTION</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="description" name="description" placeholder="Description of movie" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="stars" class="col-sm-2 control-label">STARS</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="stars" name="stars" placeholder="e.g. Name1, Name2, Name3">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="coverpath" class="col-sm-2 control-label">COVER PATH</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="coverpath" name="coverpath" placeholder="URL of the title photo">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">SUBMIT</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div><!-- panel-->

            <%@include file="./public/footer.html" %>

        </div><!--.container -->
    </body>
</html>

