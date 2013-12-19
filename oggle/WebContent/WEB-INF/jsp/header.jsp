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
	 
	 <div class="navbar navbar-inverse navbar-fixed-top row" role="navigation">
		<div class="navbar-header col-md-4">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style = "width : 300px;"href="#"><strong class="margin_left_30"><img src = "resources/image/small_icon.png" align="bottom">OGGLE</strong></a>
		</div>
		<div class = "col-md-4"  style = "text-align:center;">
			<div class="collapse navbar-collapse col-md-5 col-md-offset-3">
				<ul class="nav navbar-nav .menu_btn">
					<li id="MyContents_btn"><a href="#"><img src = "resources/image/icon_selected.png"/></a></li>
					<li id="History_btn"><a href="history.do"><img src = "resources/image/icon.png"/></a></li>
					<li id="Config_btn"><a href="config.do"><img src = "resources/image/icon.png"/></a></li>
				</ul>
			</div>
		</div>
		<div class = "col-md-4">
			<p class="navbar-text pull-right">
				<b> ${user.name} </b> <a href="logout.do" class="navbar-link">Logout</a>
			</p>
		</div>
	</div>
	
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
	<script>
		
		var pageNum = "${pageNum}";
		
		if(pageNum == 1){
			$("#MyContents_btn img").attr("src", "resources/image/icon_selected.png");
			$("#History_btn img").attr("src", "resources/image/icon.png"); 
			$("#Config_btn img").attr("src", "resources/image/icon.png"); 
		}
		else if(pageNum == 2){
			$("#History_btn img").attr("src", "resources/image/icon_selected.png"); 
			$("#MyContents_btn img").attr("src", "resources/image/icon.png"); 
			$("#Config_btn img").attr("src", "resources/image/icon.png"); 
		}
		else if(pageNum == 3){
			$("#Config_btn  img").attr("src", "resources/image/icon_selected.png"); 
			$("#MyContents_btn img").attr("src", "resources/image/icon.png"); 
			$("#History_btn img").attr("src", "resources/image/icon.png"); 
		}
		
		$("#MyContents_btn").click(function() {
			location.replace("/Oggle/contents.do?content=1"); 
			/*
			$('#Contents').fadeOut('slow', function() {
				$("#Contents").load("contents.do", function() {
					$("#Contents").fadeIn('slow');
				});
			});
			*/
		});

		$("#History_btn").click(function() {
			location.replace("/Oggle/history.do"); 
			/*
			$('#Contents').fadeOut('slow', function() {
				$("#Contents").load("history.do", function() {
					$("#Contents").fadeIn('slow');
				});
			});
			*/
		});

		$("#Config_btn").click(function() {
			location.replace("/Oggle/config.do");
			/*
			$('#Contents').fadeOut('slow', function() {
				$("#Contents").load("config.do", function() {
					$("#Contents").fadeIn('slow');
				});
			});
			*/
		});
		
		//hover
		
		$("#MyContents_btn img").mouseover(function() {
			if(pageNum != 1){
				$(this).attr("src", "resources/image/icon_selected.png");
			}
		});
		$("#MyContents_btn img").mouseout(function(){
			if(pageNum != 1){
				$(this).attr("src", "resources/image/icon.png");
			}
		});
		$("#History_btn img").mouseover(function() {
			if(pageNum != 2){
				$(this).attr("src", "resources/image/icon_selected.png");
			}
		});
		$("#History_btn img").mouseout(function(){
			if(pageNum != 2){
				$(this).attr("src", "resources/image/icon.png");
			}
		});
		
		$("#Config_btn img").mouseover(function() {
			if(pageNum !=3){
				$(this).attr("src", "resources/image/icon_selected.png");
			}
		});
		$("#Config_btn img").mouseout(function(){
			if(pageNum !=3){
				$(this).attr("src", "resources/image/icon.png");
			}
		});

	</script>
  </body>
</html>
