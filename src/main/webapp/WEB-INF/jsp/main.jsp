<!DOCTYPE html>
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

  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">OGGLE</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active" id = "MyContents_btn"><a href="#">My Contents</a></li>
            <li id = "FriendContents_btn"><a href="#">Friend's Contents</a></li>
			<li id = "History_btn"><a href="#">Search History</a></li>
			<li id = "Config_btn"><a href="#">Config</a></li>
          </ul>
		  	<p class="navbar-text pull-right">
     			  <a href="#" class="navbar-link">User_name</a>
    		 </p>
        </div><!--/.nav-collapse -->
      </div>
    </div>

<div id = "Contents"></div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
     <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			$("body").fadeIn("slow"); 
			$("#Contents").load("MyContents.html");
		});
		
		$("#MyContents_btn").click(function(){
			$("#Contents").load("MyContents.html");
		});
		$("#FriendContents_btn").click(function(){
			$("#Contents").load("FriendsContents.html");
		});
		$("#History_btn").click(function(){
			$("#Contents").load("SearchHistory.html");
		});
		$("#Config_btn").click(function(){
			$("#Contents").load("config.html");
		});
		
	</script>
  </body>
</html>
