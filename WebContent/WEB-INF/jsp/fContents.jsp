<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>OGGLE_oggleoggle</title>
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

		<div class = "margin_200px">
			<div class="col-md-2">
				<nav class="navbar navbar-default" role ="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>

					<div class="collapse navbar-collapse">
						<div class="panel-heading sidemenu_header">Friend's Keyword</div>
						<ul class="nav nav-stacked sidemenu_list">
							<li class = "friend_email"><a href="#">abcd@naver.com</a></li>
							<li class = "friend_email"><a href="#">abcd2424@naver.com</a></li>
							<li class = "friend_email"><a href="#">abcd2323@naver.com</a></li>
							<li class = "friend_email"><a href="#">abcd2424@naver.com</a></li>              
						</ul>
						
						<div class="panel-heading sidemenu_header">Popular Keyword</div>
						<ul class="nav nav-stacked sidemenu_list">
							<li><a href="#">Popular Keyword</a></li>         
						</ul>
					</div><!-- /.navbar-collapse -->
				</nav>
			</div><!--/end left column-->

			<div class="col-md-10">
				<div id = "F_contents"></div>
			</div>
		</div>
	<script>
		$(".friend_email").click(function(){
			$('#F_contents').fadeOut('slow', function(){
				$("#F_contents").load("fContentsSub.do", function(){
			        $("#F_contents").fadeIn('slow');
			    });
			});
		});
	</script>
  </body>
  
</html>
