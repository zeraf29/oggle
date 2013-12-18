<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>OGGLE_oggleoggle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript" src="resources/js/jquery-2.0.2.js"></script> 
	<script type="text/javascript" src="resources/js/bootstrap.js"></script> 
	
    <script>
   
		$(function() {
			
			var auth = "${auth}";
			
			if(auth == "Success") {
				alert("Thank you");
				location.replace("/Oggle/main.do"); 
			}
			
			if(window.location.pathname == "/Oggle/logout.do"){
				location.replace("/Oggle/main.do"); 
			}
			
			$('body').fadeIn(); 
			
			$('.carousel').carousel({
				  interval: 4000
				});

			$("#login").click(function(e){
				var email = $("#email").val();
				var pwd = $("#pwd").val();
				
				var reg_email=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
				
				if(email == "" || pwd == "")	
					alert("Input Text");
				else if (email.search(reg_email) == -1)
					alert("Incorrect email");
				else {
					$.post( "login.do", { 	
							email: email, 
							pwd: pwd
						},
						function (data) {
							var obj = jQuery.parseJSON(data);
							alert(obj.msg);
							if(obj.email != null){
								location.replace("/Oggle/home.do");
							}
	                    }
					);
				}
			});
			
			$("#signup").click(function(e){
				
				var email = $("#sEmail").val();
				var pwd1 = $("#sPwd1").val();
				var pwd2 = $("#sPwd2").val();
				var name = $("#sName").val();
				var tag1 = $("#tag1").val();
				var tag2 = $("#tag2").val();
				var tag3 = $("#tag3").val();
				
				var reg_email=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
				
				if(email == "" || pwd1 == "" || pwd2 == "" || name == "" 
						|| tag1== ""|| tag2== ""|| tag3== "")	
					alert("Input Text");
				else if(pwd1 != pwd2)
					alert("Confirm Password");
				else if(pwd1.length < 5 || pwd2.length < 5)
					alert("ID & Password are too short\n(minimum is 6 characters)");
				else if (email.search(reg_email) == -1)
					alert("Incorrect email");
				else {

					$.post( "signup.do", {
							email: email,
							pwd1: pwd1, 
							pwd2: pwd2, 
							name: name,
							tag1: tag1,
							tag2: tag2,
							tag3: tag3
						},
						function (data) {
							var obj = jQuery.parseJSON(data);
							var msg = obj.msg;
							alert(msg);
							location.replace("/Oggle/main.do"); 
	                    }
					);
				}
			});
			
			$("#cancel").click(function() {  
				$("input").val("");
			});
			
			
			
		});
		
		$("intro_carousel").carousel('cycle');
	</script>
  </head>
  
  <body class = "backGround_4">
	<div id="intro_carousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#intro_carousel" data-slide-to="0" class="active"></li>
			<li data-target="#intro_carousel" data-slide-to="1"></li>
			<li data-target="#intro_carousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="height_60 backGround_2"></div>
				<div class="carousel-caption">
					<img src="resources/image/explain3.png" />
					<p><h3 style="font-family:Malgun Gothic,Gothic;font-weight:bold;">당신이 놓쳤던 다양한 인터넷 속 정보를 손쉽게 받아보세요</h3></p>
				</div>
			</div>
			<div class="item">
				<div class="height_60 backGround_3"></div>
				<div class="carousel-caption">
					<img src="resources/image/explain2.png" />
					<p><h3 style="font-family:Malgun Gothic,Gothic;font-weight:bold;">당신의 관심사에 꼭 맞는 정보를 제공해 드립니다</h3></p>

				</div>
				</div>
				<div class="item">
					<div class="height_60 backGround_1"></div>
					<div class="carousel-caption">
						<img src="resources/image/explain.png" />
						<p><h3 style="font-family:Malgun Gothic,Gothic;font-weight:bold;">Oggle의 내부엔진은 오로지 당신의 관심사만을 찾아냅니다.</h3></p>
					</div>
				</div>
			</div>
		</div>
		<!-- /.carousel -->

	<div class = "margin_left_10">
		<p style = "font-size: 150px;">OGGLE</p>
	</div>
	<div class = "backGround_4">
		<div class="container">
			<div class="col-md-8"></div>
	
			<div class="col-md-4 padding_top_10">
				<input type="text" id="email" class="form-control"
					placeholder="Email address" style = "background-color :  #F3CA5A; box-shadow : 1px 1px 1px 1px inset;"required autofocus> <input
					type="password" id="pwd" class="form-control " style = "background-color :  #F3CA5A; box-shadow : 1px 1px 1px 1px inset;" placeholder="Password"
					required>
	
				<div class="float_right">
					<button id="login" class="btn btn-mini btn-primary" type="button">Login</button>
					<button class="btn btn-mini btn-primary" type="button"
						data-toggle="modal" data-target="#myModal4">Signup</button>
				</div>
			</div>
			</button>
		</div>
	</div>
	
	
	<!--LogIn Modal -->
		<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content backGround_4">
					<div class="modal-header backGround_2">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel" style = "color : white; font-weight : bold;">SIGN - UP</h4>
					</div>
					<div class="modal-body" id="#user_profile">
						<p><span class="glyphicon glyphicon-envelope"></span>   E-mail</p>
						<input type="text" id="sEmail" class="form-control"
							placeholder="회원님의 로그인 정보로 활용할 E-mail을 입력해 주십시오" required autofocus>
						<p><span class="glyphicon glyphicon-chevron-right"></span>패스워드</p>
						<input type="password" id="sPwd1" class="form-control"
							placeholder="패스워드를 입력해 주세요">
						<p><span class="glyphicon glyphicon-chevron-right"></span>패스워드 확인</p>
						<input type="password" id="sPwd2" class="form-control"
							placeholder="패스워드를 한번 더 입력해 주십시오." >
						<p><span class="glyphicon glyphicon-chevron-right"></span>사용자 이름</p>
						<input type="text" id="sName" class="form-control"
							placeholder="사용자의 이름을 입력해 주십시오" >
						<p><span class="glyphicon glyphicon-search"></span>   최초의 검색 키워드를 설정해 주세요.</br>이 검색어를 토대로 회원님의 검색이 시작됩니다.</p>
						<input type="text" id="tag1" class="form-control"
							placeholder="첫번째 검색어" >
						<input type="text" id="tag2" class="form-control"
						placeholder="두번째 검색어" >
						<input type="text" id="tag3" class="form-control"
						placeholder="세번째 검색어" >
					</div>
					<div class="modal-footer backGround_2">
						<button type="button" class="btn btn-default" id="signup"><span class="glyphicon glyphicon-ok-circle"></span>     Signup</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="cancel"> <span class="glyphicon glyphicon-remove-circle"></span>     Cancel</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<!-- <script src="https://code.jquery.com/jquery.js"></script> -->
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<!-- <script src="resources/js/bootstrap.min.js"></script>-->
</body>
</html>
