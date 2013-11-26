<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>OGGLE_oggleoggle</title>
	<meta charset = "utf-8">
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
  
  <div id = "result" class = "row" style = "margin : 50px 0px 0px 0px">
	  <div id = "result1" class = "col-md-4" style = "background-color:#FFE766;">
	  	<div style = "text-align: center;"><h1>${user.tag1}</h1></div>
		<div id = "result_content1" class = "result_content">
		<div><b>title :${docList[0].title}</b><br/>content : ${docList[0].content}</div>
		</div>
	  </div>
	  <div id = "result2" class = "col-md-4" style = "background-color:#FFCF66;  box-shadow: 1px 1px 10px 1px;">
	 	<div style = "text-align: center;"><h1>${user.tag2}</h1></div>
	 	<div id = "result_content2" class = "result_content">
	 	<div><b>title :${docList[1].title}</b><br/>content : ${docList[1].content}</div>
	 	</div>
	  </div>
	  <div id = "result3" class = "col-md-4" style = "background-color:#F7FD65;  box-shadow: 0px 1px 10px 1px;">
	  	<div style = "text-align: center;"><h1>${user.tag3}</h1></div>
	  	<div id = "result_content3" class = "result_content">
	  	<div><b>title :${docList[2].title}</b><br/>content : ${docList[2].content}</div>
	  	</div>
	  </div>
  </div>
 
	<script>
	$(document).ready(function(){
	    $("#result1").height(($(window).height() - 50) );
	    $("#result2").height(($(window).height() - 50) );
	    $("#result3").height(($(window).height() - 50) );
	    $("#result3").height(($(window).height() - 50) );
	    $("#result_content1").height(($(window).height() - 190) );
	    $("#result_content2").height(($(window).height() - 190) );
	    $("#result_content3").height(($(window).height() - 190) );
		});
		$(window).resize(function() {
			$("#result1").height(($(window).height() - 50));
			$("#result2").height(($(window).height() - 50));
			$("#result3").height(($(window).height() - 50));
		    $("#result_content1").height(($(window).height() - 190) );
		    $("#result_content2").height(($(window).height() - 190) );
		    $("#result_content3").height(($(window).height() - 190) );
		});
	</script>
  </body>
</html>




