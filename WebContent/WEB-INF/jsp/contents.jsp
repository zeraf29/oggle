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

<!-- 
	<div style="background-color: #ffe766; box-shadow : 2px 2px 3px 3px;">
		<jsp:include page="header.jsp"></jsp:include>
		
		<div id="Keyword_list" class="row"
			style="margin: 40px 0px 10px 0px; text-align: center;">
			<div style = "margin : 10px 0px 0px 0px;">
				<div class="col-md-4" style = "padding : 0px 0px 50px 0px;background-color:#FFE576;">
					<div style="text-align: center;padding : 0px 0px 30px 0px;">
						<h2><strong>${user.tag1}</strong></h2>
					</div>
					<a href = "#"><img src = "resources/image/detail_btn.png" data-toggle="tab"
						data-target="first" id="firstBtn"/>
					</a>
				</div>
				<div class="col-md-4" style = "padding : 0px 0px 50px 0px;background-color:#FF8E5C;">
					<div style="text-align: center;padding : 0px 0px 30px 0px;">
						<h2><strong>${user.tag2}</strong></h2>
					</div>
					<a href = "#"><img src = "resources/image/detail_btn.png" data-toggle="tab"
						data-target="first" id="secondBtn"/></a>
				</div>
				<div class="col-md-4" style = "padding : 0px 0px 50px 0px;background-color:#FFFDC5;">
					<div style="text-align: center;padding : 0px 0px 30px 0px;">
						<h2><strong>${user.tag3}</strong></h2>
					</div>
					<a href = "#"><img src = "resources/image/detail_btn.png" data-toggle="tab"
						data-target="first" id="thirdBtn"/></a>
				</div>
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
					<a id="dislike" href="#"><img src="resources/image/dislike_icon.png" /></a>
					<a id="like" href="#"><img src="resources/image/like_icon.png" /></a>
				</div>
			</div>
		</div>
	</div>
		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane fade in active" id="first">
				<!-- 
				<div id="article_c_1" class="article_contents"
					style="overflow: hidden; margin-left: 30px; margin-top: 40px;">
					
				</div> -->
				<iframe src = "${doc.url}" frameborder = "0" id = "contents_frame" >
				</iframe>

			</div>
			<div class="tab-pane fade" id="second">
				<div id="article_c_2" class="article_contents"
					style="overflow: hidden; margin-left: 30px; margin-top: 40px;"></div>
			</div>
			<div class="tab-pane fade" id="third">
				<div id="article_c_3" class="article_contents"
					style="overflow: hidden; margin-left: 30px; margin-top: 40px;"></div>
			</div>
		</div>

		<script>
	
		$(document).ready(function(){
			getHTML("${doc.url}","article_c_1");
			$("#contents_frame").css("height", $(window).height()-420);
			$("#contents_frame").css("width", $(window).width());
		});
	
		$(window).resize(function() {
			$("#contents_frame").css("height", $(window).height()-420);
			$("#contents_frame").css("width", $(window).width());
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




