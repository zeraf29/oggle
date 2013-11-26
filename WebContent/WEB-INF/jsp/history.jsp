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
		<div class="backGround_4" id="history_background">
			<div class="row">
				<div class="col-md-3" id="history_menu">
						<div class="like_list container"">
							<h3><strong>네이버 뉴스 : 다들 고생고생</strong></h3>
							<h5 style = "color : gray;">www.naver.com</h5>
						</div>
				</div>
				<!-- 페이지 본문 -->
				<div class="col-md-9 backGround_2" style="box-shadow: 3px 3px 50px 3px" id="history_content">
				<div class = "like_content" id = "article">
					<div class = "title" style = "margin :15px;"><h3><strong>네이버 뉴스 : 다들 고생고생</strong></h3></div>
					<div class = "adress"  style = "margin-left : 30px;"><h5 style = "color : gray;">www.naver.com</h5></div>
					<div class = "article_contents" style = "margin-left :30px; margin-top : 40px;">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit,
					  sed do eiusmod tempor incididunt ut labore et dolore magna
					  aliqua. Ut enim ad minim veniam, quis nostrud exercitation
					  ullamco laboris nisi ut aliquip ex ea commodo consequat.
					  Duis aute irure dolor in reprehenderit in voluptate velit
					  esse cillum dolore eu fugiat nulla pariatur. Excepteur
					  sint occaecat cupidatat non proident, sunt in culpa qui
					  officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit,
				  </div>
				</div>
				<!-- ./페이지 본문 -->
				</div>
				
			</div>
		</div>
	</div>
	
	
	<script>
		$(document).ready(function(){
		    $("#history_background").height(($(window).height() - 50) );
		    $("#history_menu").height(($(window).height() - 50) );
		    $("#history_content").height(($(window).height() - 50) );
		    $("#article").height(($(window).height() - 80) );
		});
		 $(window).resize(function(){
			 $("#history_background").height(($(window).height() - 50) );
			 $("#history_menu").height(($(window).height() - 50) );
			 $("#history_content").height(($(window).height() - 50) );
			 $("#article").height(($(window).height() - 80) );
		});
		 
	</script>
  </body>
</html>
