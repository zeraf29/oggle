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
  <body>
  
  
    
	<div>
	<div class = "backGround_3">
		<p style = "font-size:40px; color:white; padding : 10px; margin:0px;">${user.email}</p>
	</div>	
	<div class = "backGround_4" style = "padding-top : 30px; padding-left : 30px;" id = "config_tag">
		  <p style = "font-size:20px; font-weight : bold;"><span class="glyphicon glyphicon-chevron-right"></span>첫번째 검색어</p>
	        <input type="text" id="tag1" class="form-control input-lg" style = "width: 50%; font-size : 20px; margin-left : 30px;">
		  <p style = "font-size:20px; font-weight : bold;"><span class="glyphicon glyphicon-chevron-right"></span>두번째 검색어</p>
	        <input type="text" id="tag2" class="form-control input-lg" style = "width: 50%; font-size : 20px; margin-left : 30px;">
	      <p style = "font-size:20px; font-weight : bold;"><span class="glyphicon glyphicon-chevron-right"></span>세번째 검색어</p>
	        <input type="text" id="tag3" class="form-control input-lg"style = "width: 50%; font-size : 20px; margin-left : 30px;">
	        <br/>
	      <button type="button" id="update" class="btn btn-default"><p style = "margin : 0px; padding : 0px; font-weight : bold;"><span class="glyphicon glyphicon-ok-circle"></span>   Update</p></button>
          <button type="button" id="cancel" class="btn btn-default" data-dismiss="modal" id = "cancel"><span class="glyphicon glyphicon-remove-circle"></span>   Cancel</button>
     </div>    
    </div> <!-- /container -->
  
  
  <!-- 
  
	<div class="container">
		<h3>${user.email}</h3> <br/>
		
		  <p>Keyword1</p>
	        <input type="text" id="tag1" class="form-control" placeholder="tag1">
		  <p>Keyword2</p>
	        <input type="text" id="tag2" class="form-control" placeholder="tag2">
	      <p>Keyword13</p>
	        <input type="text" id="tag3" class="form-control" placeholder="tag3">
	        <br/>
	       <button type="button" id="update" class="btn btn-default">Update</button>
          <button type="button" id="cancel" class="btn btn-default" data-dismiss="modal" id = "cancel">Cancel</button>
    </div> <!-- /container -->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
	
	<script>
	$(document).ready(function(){
		
		 $("#config_tag").height(($(window).height() - 157) );
		var tag1 = "${user.tag1}";
		var tag2 = "${user.tag2}";
		var tag3 = "${user.tag3}";

		$("#tag1").val(tag1);
		$("#tag2").val(tag2);
		$("#tag3").val(tag3);
		
		
		$("#update").click(function(e){
			
			var tag1 = $("#tag1").val();
			var tag2 = $("#tag2").val();
			var tag3 = $("#tag3").val();
			
			if(tag1 == "" || tag2 == "" || tag3 == "" )	
				alert("Input Text");
			else {
				$.post( "updateTag.do", {
						tag1: tag1, 
						tag2: tag2,
						tag3: tag3
					},
					function (data) {
						var obj = jQuery.parseJSON(data);
						var msg = obj.msg;
						switch(msg){
						case '1':
							alert("정상적으로 변경되었습니다.");
							//$("#alert_modal_body").html("정상적으로 변경이 완료되었습니다.");
						//	$("#config_alert_modal").modal('show');
							break;
						default:
							alert("변경을 실패했습니다.");
							break;
						}
						location.replace("/Oggle/home.do"); 
						//$("input").val("");
                    }
				);
			}
		});
		
		 $(window).resize(function(){
			 $("#config_tag").height(($(window).height() - 157) );
		 });
		 
		$("#cancel").click(function(e){
			$("input").val("");
			$("#name").val(tag1);
			$("#name").val(tag2);
			$("#name").val(tag3);
		});
		
	});
	</script>
  </body>
</body>
</html>
