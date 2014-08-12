<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <!--YUI-AutoComplete Plugin-->
        <script src="http://yui.yahooapis.com/3.17.2/build/yui/yui-min.js"></script>
        <script src="js/bootstrap3-typeahead.min.js" type="text/javascript"></script>
        <script src="js/yui.ac.js" type="text/javascript"></script>

        <script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
        <script src="js/highcharts.js" type="text/javascript"></script>
        <script src="js/standalone-framework.js" type="text/javascript"></script>

        <title>MSearch: Local search</title>

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

            <div>
                <hr>
                <div class="panel panel-info" id="queryresult">
                    <div class="panel-heading">
                        <h3 class="panel-title">Movie Detail</h3>
                    </div>
                    <div class="panel-body">
                        <h1><small>Moive Name </small> <a href="http://www.imdb.com/title/${movie.imdbnum}" target="_Blank">${movie.title}</a></h1>
                        <hr>
                        <div class="row">
                            <div class="col-md-3"><img src="${movie.coverpath}" width="205px" height="315px" class="img-rounded"></div>
                            <div class="col-md-5">
                                <ul class="list-group">
                                    <li class="list-group-item">

                                        <h5><span class="label label-primary">Type</span> ${movie.type}</h5>
                                    </li>
                                    <li class="list-group-item">

                                        <h5><span class="label label-primary">IMDB Rating</span> ${movie.rating}</h5>
                                    </li>
                                    <li class="list-group-item">                                  
                                        <span class="label label-primary">Description</span><h5> ${movie.description}</h5>
                                    </li>
                                    <li class="list-group-item">

                                        <h5><span class="label label-primary">Director</span> ${movie.director}</h5>
                                    </li>
                                    <li class="list-group-item">

                                        <h5><span class="label label-primary">Stars</span> ${movie.stars}</h5>
                                    </li>
                                </ul>

                            </div>

                            <div class="col-md-4">
                                <br>
                                <br>
                                <br>
                                <div id="container" style="min-width:300px;height:300px"></div>
                                <script type="text/javascript">
                                    $(function() {
                                        var chart = new Highcharts.Chart({
                                            colors: ['#5cb85c', '#d9534f'],
                                            chart: {
                                                renderTo: 'container',
                                                type: 'pie'
                                            },
                                            title: {
                                                text: 'Sentiment Analysis'
                                            },
                                            credits: {
                                                enabled: false
                                            },
                                            plotOptions: {
                                                pie: {
                                                    startAngle: -90,
                                                    endAngle: 90,
                                                    center: ['50%', '70%']
                                                }
                                            },
                                            series: [{
                                                    data: [
                                                        ['Positive', ${sascore}],
                                                        ['Negative', 1-${sascore}],
                                                    ]
                                                }]
                                        });
                                    });
                                </script>
                            </div><!--Sentiment Analysis-->
                        </div>

                    </div><!--panel-body -->
                </div><!--panel -->

                <div><!--btn-group-wrapper-->
                    <div class="btn-group">
                        <a href="QueryInfoServlet?method=flickr&moviename=${movie.title}"><button type="button" class="btn btn-default">Images</button></a>
                        <a href="QueryInfoServlet?method=youtube&moviename=${movie.title}"><button type="button" class="btn btn-default">Videos</button></a>
                        <a href="QueryInfoServlet?method=google&moviename=${movie.title}"><button type="button" class="btn btn-default">Contents</button></a>
                    </div>
                    <br>
                    <br></div><!--btn-group-wrapper-->

            </div>
                    
            <%@include file="./public/footer.html" %>
        </div><!--.container body -->
    </body>
</html>
