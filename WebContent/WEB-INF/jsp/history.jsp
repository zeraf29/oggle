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
    <jsp:include page="header.jsp"></jsp:include>
	<div class="margin_50px">
		<div class="backGround_4" id="history_background">
			<div class="row">
				<div class="col-md-3" id="history_menu">
					<c:forEach var="doc" items="${docList}">
						<div class="like_list container">
							<h4><strong><a href="history.do?id=${doc.id}">${doc.title}</a></strong></h4>
							<h5 style = "color : gray;">${doc.url}</h5>
						</div>
					</c:forEach>
				</div>
				<!-- 페이지 본문 -->
				<div class="col-md-9 backGround_2" style="box-shadow: 3px 3px 50px 3px" id="history_content">
					<iframe src = "${doc.url}"></iframe>				
				<!-- <div class = "like_content" id = "article"> -->
				
				
					<!-- <div class = "article_contents" style = "margin-left :30px; margin-top : 40px;">
						<!-- ${selectedDoc.content} -->
				  	</div> 
				</div>
				<!-- ./페이지 본문 -->
				</div>
				
			</div>
	
	<script>
		$(document).ready(function(){
		    $("#history_background").height(($(window).height() - 50) );
		    $("#history_menu").height(($(window).height() - 50) );
		    $("#history_content").height(($(window).height() - 50) );
		    $("#article").height(($(window).height() - 80) );
		    
		    var selectedID = "${selectedDoc.id}";
		    if(selectedID =="" || selectedID == null){
		    	selectedID = "${docList[0].id}";
				location.replace("/Oggle/history.do?id="+selectedID);
		    }
		    
		    var selectedURL = "${selectedDoc.url}";
		    getHTML(selectedURL,"article");
		});
		
		 $(window).resize(function(){
			 $("#history_background").height(($(window).height() - 50) );
			 $("#history_menu").height(($(window).height() - 50) );
			 $("#history_content").height(($(window).height() - 50) );
			 $("#article").height(($(window).height() - 80) );
		});
		 
		 
		 function getHTML(url,id){
				var params = "url="+url;
				$.ajax({      
			        type:"GET",
			        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			        url:"/Oggle/getHtml.do",
			        data:params,
			        beforeSend: function( xhr ) {
			            xhr.overrideMimeType( "text/plain; charset=utf-8" );
					},
			        success:function(args){   
			            $("#"+id).html(args);
			        }
			    });  
			}
	</script>
  </body>
</html>
