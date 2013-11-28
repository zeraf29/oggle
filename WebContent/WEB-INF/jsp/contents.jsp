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

	<div style="background-color: #ffe766;">
		<jsp:include page="header.jsp"></jsp:include>
		<div id="Keyword_list" class="row"
			style="margin: 50px 0px 0px 0px; text-align: center;">
			<div class="col-md-4">
				<div style="text-align: center;">
					<h1>${user.tag1}</h1>
				</div>
				<button class="btn btn-primary btn-sm" data-toggle="tab"
					data-target="#first" id="firstBtn">show more>></button>
			</div>
			<div class="col-md-4">
				<div style="text-align: center;">
					<h1>${user.tag2}</h1>
				</div>
				<button class="btn btn-primary btn-sm" data-toggle="tab"
					data-target="#second" id="secondBtn">show more>></button>
			</div>
			<div class="col-md-4">
				<div style="text-align: center;">
					<h1>${user.tag3}</h1>
				</div>
				<button class="btn btn-primary btn-sm" data-toggle="tab"
					data-target="#third" id="thirdBtn">show more>></button>
			</div>
		</div>

		<div class="page-header">
			<div class="title_box">
				<div style="text-align: left;">
					<h3>${doc.title}</h3>
					<h3>
						<small>${doc.url}</small>
					</h3>
				</div>
				<div style="text-align: right;">
					<a id="move" href="#"><img src="resources/image/move_icon.png" /></a>
					<a id="next" href="#"><img src="resources/image/move_icon.png" /></a>
					<a id="like" href="#"><img src="resources/image/move_icon.png" /></a>
				</div>
			</div>
		</div>
	</div>
		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane fade in active" id="first">
				<div id="article_c_1" class="article_contents"
					style="overflow: scroll; margin-left: 30px; margin-top: 40px;">
				</div>

			</div>
			<div class="tab-pane fade" id="second">
				<div id="article_c_2" class="article_contents"
					style="overflow: scroll; margin-left: 30px; margin-top: 40px;"></div>
			</div>
			<div class="tab-pane fade" id="third">
				<div id="article_c_3" class="article_contents"
					style="overflow: scroll; margin-left: 30px; margin-top: 40px;"></div>
			</div>
		</div>

		<script>
	
		$(document).ready(function(){
			getHTML("${doc.url}","article_c_1");
		});
	
		$(window).resize(function() {
		});
		
		
		$("#move").click(function(){
			window.open("${docList[0].url}", 'window name', 'window settings');
		});
		$("#next").click(function(){
		//	window.open("${docList[1].url}", 'window name', 'window settings');
		});
		$("#like").click(function(){
			//window.open("${docList[2].url}", 'window name', 'window settings');
		});
		
		$("#firstBtn").click(function(){
			location.replace("/Oggle/contents.do?content=1");
		});
		$("#secondBtn").click(function(){
			location.replace("/Oggle/contents.do?content=2");
		});
		$("#thirdBtn").click(function(){
			location.replace("/Oggle/contents.do?content=3");
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




