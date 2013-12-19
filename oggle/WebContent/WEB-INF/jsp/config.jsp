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
    <jsp:include page="header.jsp"></jsp:include>
 <!-- 
	<div class = "margin_50px padding_20px">	
		<div class="col-md-2">
			<nav class="navbar navbar-default" role ="navigation">

				<div class="collapse navbar-collapse">
					<div class="panel-heading sidemenu_header">User_config</div>
					<ul class="nav nav-stacked sidemenu_list">
						<li><a href="#" id = "modify_profile">modify_profile</a></li>
						<li><a href="#" id = "keyword_setting">keyword_setting</a></li>
					</ul>
				</div><!-- /.navbar-collapse --
			</nav>
		</div>/end left column
                                                                                                                  
		<div class="col-md-10  ">
			<div id = "Config_subContents"></div>
		</div>
	</div>
	 	 -->
	 	 <div class = "margin_50px">
		 	 <div class = "col-md-3 backGround_2" style =  "overflow : hidden;" id = "config_menu">
		 	 <p style = "margin-top : 20px; font-size : 60px; font-weight : bold; color:white;">CONFIG</p>
		 		 <div class = "pull-right" style = "margin-top : 30px; margin-bottom : 30px;">
		 	 		<a href = "#" id = "modify_profile" style = "color:white;"><h3><span class="glyphicon glyphicon-user"></span>  USER-CONFIG</h3></a>
		 	 		<a href = "#" id = "keyword_setting" style = "color:white;"><h3><span class="glyphicon glyphicon-pencil"></span>  Keyword-setting</h3></a>
		 		 </div>
		 	 </div>
		 	 <div class = "col-md-9" style = "padding:0px;" id = "Config_subContents">
		 	 </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	 	 </div>
	 	 
	<script>
	$(document).ready(function(){
	    $("#config_menu").height(($(window).height() - 50) );
	    $("#Config_subContents").load("configSub1.do", function(){
	        $("#Config_subContents").fadeIn('slow');
	    });
	});
	
	 $(window).resize(function(){
		 $("#config_menu").height(($(window).height() - 50) );
	 });
		$("#modify_profile").click(function(){
			$('#Config_subContents').fadeOut('slow', function(){
				$("#Config_subContents").load("configSub1.do", function(){
			        $("#Config_subContents").fadeIn('slow');
			    });
			});
		});
		
		$("#keyword_setting").click(function(){
			$('#Config_subContents').fadeOut('slow', function(){
				$("#Config_subContents").load("configSub2.do", function(){
			        $("#Config_subContents").fadeIn('slow');
			    });
			});
		});

	</script>
  </body>
</html>
