<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
  <c:if test="${!empty user}">
  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">OGGLE</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active" id = "MyContents_btn"><a href="#">My Contents</a></li>
            <li id = "FriendContents_btn"><a href="#">Friend's Contents</a></li>
			<li id = "History_btn"><a href="#">Search History</a></li>
			<li id = "Config_btn"><a href="#">Config</a></li>
          </ul>
		  	<p class="navbar-text pull-right">
				<b> ${user.name} </b>
				<a href="logout.do" class="navbar-link">Logout</a>
			</p>
        </div><!--/.nav-collapse -->
      </div>
    </div>
   </c:if>
<div id = "Contents">
	
</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
     <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#Contents').fadeOut('slow', function(){
				$("#Contents").load("mContents.do", function(){
			        $("#Contents").fadeIn('slow');
			    });
			});

		});
		
		$("#MyContents_btn").click(function(){
			$('#Contents').fadeOut('slow', function(){
				$("#Contents").load("mContents.do", function(){
			        $("#Contents").fadeIn('slow');
			    });
			});
		});
		$("#FriendContents_btn").click(function(){
			$('#Contents').fadeOut('slow', function(){
				$("#Contents").load("fContents.do", function(){
			        $("#Contents").fadeIn('slow');
			    });
			});
		});
		
		$("#History_btn").click(function(){
			$('#Contents').fadeOut('slow', function(){
				$("#Contents").load("history.do", function(){
			        $("#Contents").fadeIn('slow');
			    });
			});
		});
		
		$("#Config_btn").click(function(){
			$('#Contents').fadeOut('slow', function(){
				$("#Contents").load("config.do", function(){
			        $("#Contents").fadeIn('slow');
			    });
			});
		});
	</script>
  </body>
</html>
