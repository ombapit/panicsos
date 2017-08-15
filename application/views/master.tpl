<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
	
    <!-- FAVICONS -->
	<link rel="shortcut icon" href="{php}echo base_url();{/php}template/img/favicon/favicon.ico" type="image/x-icon">
	<link rel="icon" href="{php}echo base_url();{/php}template/img/favicon/favicon.ico" type="image/x-icon">

    <title> {$title} </title>

    <!-- Bootstrap core CSS -->
    <link href="{php}echo base_url();{/php}template/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="{php}echo base_url();{/php}template/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
	<link rel="stylesheet" type="text/css" media="screen" href="{php}echo base_url();{/php}template/css/font-awesome.min.css">
    <link href="{php}echo base_url();{/php}template/assets/css/starter-template.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="{php}echo base_url();{/php}template/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script>window.jQuery || document.write('<script src="{php}echo base_url();{/php}template/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="{php}echo base_url();{/php}template/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="{php}echo base_url();{/php}template/assets/js/ie10-viewport-bug-workaround.js"></script>
	
	<!-- JQUERY VALIDATE -->
	<script src="{php}echo base_url();{/php}template/js/plugin/jquery-validate/jquery.validate.min.js"></script>
	<script src="{php}echo base_url();{/php}template/js/plugin/jquery-form/jquery-form.min.js"></script>
	
	<script src="{php}echo base_url();{/php}template/assets/js/app.js"></script>
	
	<script type="text/javascript">
		// Load form valisation dependency 
		base_url = '{php}echo base_url();{/php}';
		site_url = '{php}echo site_url();{/php}';
	</script>
  </head>

  <body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container">
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="{php}echo site_url();{/php}">Polres Omba</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
		  <ul class="nav navbar-nav pull-right">
			<li{$users_active}><a href="{php}echo site_url();{/php}user_management/users">Manage Users</a></li>
            <li{$settings_active}><a href="{php}echo site_url();{/php}settings">Parameter Settings</a></li>
            <li{$log_active}><a href="{php}echo site_url();{/php}log">Log</a></li>
			<li{$chpass_active}><a href="{php}echo site_url();{/php}user_management/change_pass">Change Password</a></li>
			<li{$upgrade_active}><a href="{php}echo site_url();{/php}auth/logout">{php}echo $_SESSION['username'];{/php}(Logout)</a></li>
		  </ul>
		</div><!--/.nav-collapse -->
	  </div>
	</nav>
	<div class="container ">
		<div class="row">
			{include file="$tpl_name.tpl"}
		</div>
	</div>
	<input type="hidden" id="hiddenElement" value="true"/>
    <script>myAudio = new Audio('{php}echo base_url();{/php}template/audio/sirine.ogg'); </script>
  </body>
</html>