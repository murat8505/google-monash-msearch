<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
        
        <!--YUI-AutoComplete Plugin-->
        <script src="http://yui.yahooapis.com/3.17.2/build/yui/yui-min.js"></script>
        <script src="js/bootstrap3-typeahead.min.js" type="text/javascript"></script>

        <script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
        <script src="js/jquery.bxslider.js" type="text/javascript"></script>
        <link href="css/jquery.bxslider.css" rel="stylesheet" type="text/css"/>
        
        <title>MSearch: Find your interest</title>
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
                        <li class="active"><a href="./index.jsp">HOME</a></li>
                        <li><a href="./local.jsp">LOCAL</a></li>
                        <li><a href="./flickr.jsp">FLICKR</a></li>
                        <li><a href="./youtube.jsp">YOUTUBE</a></li>
                        <li><a href="./google.jsp">GOOGLE</a></li>
                        <li><a href="./addmovie.jsp">ADD</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>


        <div class="container">            
            <!-- header-->
            <div class="row">
                <br>
                <br>
                <br>
                <h3 class="text-center"><img height="115" width="300" src="./pic/logo.png"></h3>

            </div><!--header -->


            <div class="row">
                <form role="form" class="form-horizontal" method="post" action="QueryInfoServlet?method=local">
                    <div class="form-group-lg">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="yui3-skin-sam input-group">
                                <div id="the-basics">
                                    <input type="text" id="yui-ac" name="moviename" class="typeahead form-control" placeholder="Movie name you want to search">
                                </div>

                                <span class="input-group-btn">
                                    <button class="btn btn-success btn-lg" type="submit">Search!</button>
                                </span>
                            </div><!-- /input-group -->
                        </div><!-- /.col-md-8 -->
                    </div><!--/from-group -->

                </form>
            </div>

            <script type="text/javascript">
                YUI().use('autocomplete', 'autocomplete-highlighters', function(Y) {
                    Y.one('#yui-ac').plug(Y.Plugin.AutoComplete, {
                        resultHighlighter: 'phraseMatch',
                        source: 'select * from search.suggest where query="{query}"',
                        yqlEnv: 'http://pieisgood.org/yql/tables.env'
                    });
                });
            </script>

            <div class="row">
                <br>
                <br>
            </div>

            <div class="panel panel-success">
                <div class="panel-heading">Recommended Movies</div>
                <div class="panel-body">
                    <div class="slider4">
                        <div class="slide"><a href="QueryInfoServlet?method=local&moviename=the%20godfather"><img height="300" width="210" src="./img/tt0068646.jpg"></a></div>
                        <div class="slide"><a href="QueryInfoServlet?method=local&moviename=star%20wars"><img height="300" width="210" src="./img/tt0076759.jpg"></a></div>
                        <div class="slide"><a href="QueryInfoServlet?method=local&moviename=the%20shawshank%20redemption"><img height="300" width="210" src="./img/tt0111161.jpg"></a></div>
                        <div class="slide"><a href="QueryInfoServlet?method=local&moviename=2012"><img height="300" width="210" src="./img/tt1190080.jpg"></a></div>
                        <div class="slide"><a href="QueryInfoServlet?method=local&moviename=inception"><img height="300" width="210" src="./img/tt1375666.jpg"></a></div>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                $(document).ready(function() {
                    $('.slider4').bxSlider({
                        slideWidth: 210,
                        minSlides: 2,
                        maxSlides: 5,
                        moveSlides: 1,
                        slideMargin: 10,
                    });
                });

            </script>

            <%@include file="./public/footer.html" %>

        </div><!--container main-body-->

    </body>
</html>