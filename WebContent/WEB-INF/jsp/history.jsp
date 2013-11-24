<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>OGGLE_oggleoggle</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
   <link href="resources/css/bootstrap-responsive.css" rel="stylesheet">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<div class="margin_50px">
		<div class = "backGround_4" id = "history_background">
			<div class="row">
				<div class="col-md-3" id = "history_menu">sisisisisifif</div>
				<div class="col-md-9 backGround_2" style = "box-shadow : 3px 3px 50px 3px"id = "history_content">history</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
		    $("#history_background").height(($(window).height() - 50) );
		    $("#history_menu").height(($(window).height() - 50) )
		    $("#history_content").height(($(window).height() - 50) )
		});
		 $(window).resize(function(){
			 $("#history_background").height(($(window).height() - 50) );
			 $("#history_menu").height(($(window).height() - 50) )
			 $("#history_content").height(($(window).height() - 50) )
		});
	</script>
  </body>
</html>
