<!DOCTYPE html>
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
  
	<div class="container">
      <div class="row">
        <div class="col-md-3">
          <h2>TITLE 1</h2>
          <p>contents</p>
         <button class="btn btn-primary btn-sm" data-toggle="tab" data-target="#first">show more>></button>
        </div>
        <div class="col-md-3">
          <h2>TITLE 2</h2>
          <p>contents</p>
         <button class="btn btn-primary btn-sm" data-toggle="tab" data-target="#second">show more>></button>
       </div>
        <div class="col-md-3">
          <h2>TITLE 3</h2>
          <p>contents</p>
           <button class="btn btn-primary btn-sm" data-toggle="tab" data-target="#third">show more>></button>
        </div>
      </div>
    </div> <!-- /container -->



<div class="container">
	<div class="page-header">
	  <h3>Search Keyword </h3>
	</div>

	<!-- Tab panes -->
	<div class="tab-content">
	  <div class="tab-pane fade in active" id="first">Sdfsdfsdfsdf</div>
	  <div class="tab-pane fade" id="second">sdfsdfsd</div>
	  <div class="tab-pane fade" id="third">zzzzzzz</div>
	</div>
</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
	
	<script>
	$(document).ready(function(){
		$('body').fadeIn(); 
	});
	</script>
  </body>
</html>




