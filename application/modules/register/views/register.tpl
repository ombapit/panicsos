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
  </head>

  <body>
	<div class="container ">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login-form" class="form-signin mg-btm" action="{php}echo site_url();{/php}/auth/create_user" method="post">
				<h3 class="heading-desc">
				Login</h3>
				<div class="main">	
					{$message}
					<section>
						<label>Your Name</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							{$first_name}
						</div>
					</section>
					<section>
						<label>Email</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
							{$email}
						</div>
					</section>
					<section>
						<label>Phone Number</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
							{$phone}
						</div>
					</section>
					<section>
						<label>Username</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							{$username}
						</div>
					</section>

					<section>
						<label>Password</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							{$password}
						</div>
					</section>
					
					<section>
						<label>Password Confirmation</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							{$password_confirm}
						</div>
					</section>
					<div class="row">
						<div class="col-xs-10 col-md-10 pull-right">
							<button type="submit" class="btn btn-large btn-success pull-right">Register </button>
							<a style="margin-right: 2px;" class="btn btn-large btn-primary pull-right" href="{php}echo base_url();{/php}">Back to Login</a>
						</div>
					</div>
				</div>
			  </form>
			</div>
		</div>
	</div>
	<input type="hidden" id="hiddenElement" value="true"/>
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
		$(function() {
			// Load form valisation dependency 
			base_url = '{php}echo base_url();{/php}';
			site_url = '{php}echo site_url();{/php}';
			
			function runFormValidation() {
				// Validation
				$("#login-form").validate({
					// Ajax form submition
					submitHandler : function(form) {
						var once = $("#hiddenElement").val();
						if (once == "true") {
							$(form).ajaxSubmit({
								beforeSubmit: function() {
									$("#hiddenElement").val("false");
									$("button[type=submit]").attr("disabled","disabled");
									$("button[type=submit]").append('<i class="fa fa-gear fa-1x fa-spin"></i>');
								},
								dataType: 'json',
								success : function(msg) {
									if (msg.msg == "noauth") {
										window.location = base_url;
									}
									else if (msg.error == true) {
										write_error_html(msg.field);
										
										//button manipulating
										$("#hiddenElement").val("true");
										$(".fa-spin").remove();
										$("button[type=submit]").removeAttr("disabled");
									} else {
										window.location = site_url;
									}
								}
							});
						}
					},

					// Do not change code below
					errorPlacement : function(error, element) {
						error.insertAfter(element.parent());
					}
				});
			}
			runFormValidation();
		});
	</script>
  </body>
</html>