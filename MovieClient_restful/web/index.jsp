<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <title>MSearch: Find your interest</title>
        <script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
        <script src="js/jquery.bxslider.js" type="text/javascript"></script>
        <link href="css/jquery.bxslider.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            
            <!-- header-->
            
            
            <div class="row">
                <br>
                <br>
                <br>
                <h3 class="text-center"><img height="115" width="300" src="./pic/logo.png"></h3>

            </div>


            <div class="row">
                <form role="form" class="form-horizontal" method="get" action="QueryServlet">
                    <div class="form-group-lg">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="input-group">
                                <input type="text" name="moviename" class="form-control">
                                <span class="input-group-btn">
                                    <button class="btn btn-success btn-lg" type="submit">Search!</button>
                                </span>
                            </div><!-- /input-group -->
                        </div><!-- /.col-md-8 -->
                    </div><!--/from-group -->

                </form>
            </div>

            <div class="row">
                <br>
                <br>
            </div>

            <div class="panel panel-success">
                <div class="panel-heading">Recommended Movies</div>
                <div class="panel-body">
                    <div class="slider4">
                        <div class="slide"><img height="300" width="210" src="./pic/01.jpg"></div>
                        <div class="slide"><img height="300" width="210" src="./pic/02.jpg"></div>
                        <div class="slide"><img height="300" width="210" src="./pic/03.jpg"></div>
                        <div class="slide"><img height="300" width="210" src="./pic/05.jpg"></div>
                        <div class="slide"><img height="300" width="210" src="./pic/06.jpg"></div>
                        <div class="slide"><img height="300" width="210" src="./pic/07.jpg"></div>
                        <div class="slide"><img height="300" width="210" src="./pic/08.jpg"></div>
                        <div class="slide"><img height="300" width="210" src="./pic/09.jpg"></div>
                        <div class="slide"><img height="300" width="210" src="./pic/10.jpg"></div>
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

        </div><!--container-->

    </body>
</html>