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
			<div class = "title" style = "margin :15px;"><h3><strong>${docList[0].title}</strong></h3></div>
			<div class = "adress"  style = "margin-left : 30px;"><h5 style = "color : gray;">${docList[0].url}</h5></div>
			<div class = "link_group">
				<a id = "move_src_docList0" href = "#"><img src = "resources/image/move_icon.png"/></a>
				<a id = "like_docList0" href = "#"><img src = "resources/image/like_icon.png"/></a>
			</div>
			<div id="article_c_1" class = "article_contents" style = "overflow:scroll;margin-left :30px; margin-top : 40px;"></div>
			<!-- 
			<div class = "article_contents" style = "margin-left :30px; margin-top : 40px;">${docList[0].content}</div>
			-->
		</div>
	  </div>
	  <div id = "result2" class = "col-md-4" style = "background-color:#FFCF66;  box-shadow: 1px 1px 10px 1px;">
	 	<div style = "text-align: center;"><h1>${user.tag2}</h1></div>
	 	<div id = "result_content2" class = "result_content">
	 	<div>
		 	<div class = "title" style = "margin :15px;"><h3><strong>${docList[1].title}</strong></h3></div>
			<div class = "adress"  style = "margin-left : 30px;"><h5 style = "color : gray;">${docList[1].url}</h5></div>
			<div class = "link_group">
				<a id = "move_src_docList1" href = "#"><img src = "resources/image/move_icon.png"/></a>
				<a id = "like_docList1" href = "#"><img src = "resources/image/like_icon.png"/></a>
			</div>
			<div id="article_c_2" class = "article_contents" style = "overflow:scroll;margin-left :30px; margin-top : 40px;"></div>
			<!-- 
			<div class = "article_contents" style = "margin-left :30px; margin-top : 40px;">${docList[1].content}</div>
	 		-->
	 	</div>
	 	</div>
	  </div>
	  <div id = "result3" class = "col-md-4" style = "background-color:#F7FD65;  box-shadow: 0px 1px 10px 1px;">
	  	<div style = "text-align: center;"><h1>${user.tag3}</h1></div>
	  	<div id = "result_content3" class = "result_content">
	  	<div>
		  	<div class = "title" style = "margin :15px;"><h3><strong>${docList[2].title}</strong></h3></div>
			<div class = "adress"  style = "margin-left : 30px;"><h5 style = "color : gray;">${docList[2].url}</h5></div>
				<div class = "link_group">
				<a id = "move_src_docList2" href = "#"><img src = "resources/image/move_icon.png"/></a>
				<a id = "like_docList2" href = "#"><img src = "resources/image/like_icon.png"/></a>
			</div>
			<div id="article_c_3" class = "article_contents" style = "overflow:scroll;margin-left :30px; margin-top : 40px;"></div>
			<!--<div class = "article_contents" style = "margin-left :30px; margin-top : 40px;">${docList[2].content}</div>
	  		-->
	  	</div>
	  	</div>
	  </div>
  </div>
 
	<script>
	$(document).ready(function(){
		
		getHTML("${docList[0].url}","article_c_1");
		getHTML("${docList[1].url}","article_c_2");
		getHTML("${docList[2].url}","article_c_3");
	    
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
		
		$("#move_src_docList0").click(function(){
			window.open("${docList[0].url}", 'window name', 'window settings');
		});
		$("#move_src_docList1").click(function(){
			window.open("${docList[1].url}", 'window name', 'window settings');
		});
		$("#move_src_docList2").click(function(){
			window.open("${docList[2].url}", 'window name', 'window settings');
		});
		
		$("#like_docList0").click(function(){
			alert("kkdd");
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




