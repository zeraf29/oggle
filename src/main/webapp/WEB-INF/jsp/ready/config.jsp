<!DOCTYPE html>
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
		<div class = "margin_200px">
			<div class="col-md-2">
				<nav class="navbar navbar-default" role ="navigation">

					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>

					<div class="collapse navbar-collapse">
						<div class="panel-heading sidemenu_header">User_config</div>
						<ul class="nav nav-stacked sidemenu_list">
							<li><a href="#" id = "modify_profile">modify_profile</a></li>
							<li><a href="#" id = "friends">friends</a></li>
							<li><a href="#">keyword_setting</a></li>
						</ul>
					</div><!-- /.navbar-collapse -->
				</nav>
			</div><!--/end left column-->

			<div class="col-md-10">
				<div id = "Config_subContents"></div>
			</div>
		</div>
		
	<script>
		$("#modify_profile").click(function(){
			$("#Config_subContents").load("config_modify_profile.html");
		});
		
		$("#friends").click(function(){
			$("#Config_subContents").load("config_friends.html");
		});
	</script>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
  </body>
</html>
