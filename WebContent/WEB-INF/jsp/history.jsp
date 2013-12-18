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
				<div class="col-md-3 backGround_4" id="history_menu" style = "overflow-y:auto; overflow-x : hidden; padding-left : 50px;">
					<c:forEach var="doc" items="${docList}">
						<div class="like_list">
							<h5><strong><a href="history.do?id=${doc.id}">${doc.title}</a></strong></h5>
							<h6 style = "color : gray; overflow : hidden">${doc.url}</h6>
						</div>
					</c:forEach>
				</div>

				<div class="col-md-9 backGround_2" style="box-shadow: 3px 3px 50px 3px; padding:30px 0px 0px 30px;" id="history_content">
					<iframe name="iframe" frameborder = "0" id = "contents_frame" height = 95% width=98%>
					</iframe>
				</div> 
			</div>

	
	<script>
		$(document).ready(function(){
		    $("#history_background").height(($(window).height() - 50) );
		    $("#history_menu").height(($(window).height() - 50) );
		    $("#history_content").height(($(window).height() - 80) );
		    $("#article").height(($(window).height() - 80) );
		    
		    var selectedID = "${selectedDoc.id}";
		    if(selectedID =="" || selectedID == null){
		    	selectedID = "${docList[0].id}";
				location.replace("/Oggle/history.do?id="+selectedID);
		    }
		    
		    var selectedURL = "${selectedDoc.url}";
		    
		    document.getElementById('contents_frame').src = selectedURL;
		    
		   // getHTML(selectedURL,"article");
		});
		
		 $(window).resize(function(){
			 $("#history_background").height(($(window).height() - 50) );
			 $("#history_menu").height(($(window).height() - 50) );
			 $("#history_content").height(($(window).height() - 80) );
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
