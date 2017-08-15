<!-- START ROW -->
<div class="row">
	<div class="starter-template col-sm-6 col-md-6 col-lg-6">
		<form class="form-horizontal" id="form1" method="post" action="{php}echo base_url();{/php}auth/change_pass" novalidate="novalidate">
		<fieldset>

		<!-- Form Name -->
		<legend>User -> Change Password</legend>
		
		<input type="hidden" name="id" id="id" value="{$detail['id']}"/>
		{$csrf}
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="password">Password</label>  
		  <div class="col-md-4">
		  <input id="password" name="password" placeholder="Password" class="form-control input-md" required="" type="password">
			
		  </div>
		</div>

		<!-- Password input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="password_confirm">Confirm Password </label>
		  <div class="col-md-4">
			<input id="password_confirm" name="password_confirm" placeholder="Confirm Password" class="form-control input-md" required="" type="password">
			
		  </div>
		</div>
		
		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="submit"></label>
			<div class="col-md-4">
			<button id="submit" name="submit" class="btn btn-primary">Submit</button>
			</div>
		</div>
		</fieldset>
		</form>
	</div>
</div>
<!-- end widget grid -->
<input type="hidden" id="hiddenElement" value="true"/>
<!-- SCRIPTS ON PAGE EVENT -->
<script type="text/javascript">
	// Registration validation script
	function runFormValidation() {
		var $form1 = $("#form1").validate({
			// Ajax form submition
			submitHandler : function(form) {
				var once = $("#hiddenElement").val();
				if (once == "true") {
					$(form).ajaxSubmit({
						beforeSubmit: function() {
							$("#hiddenElement").val("false");
							$("#cancel").attr("disabled","disabled");
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
								$("#cancel").removeAttr("disabled");
								$("button[type=submit]").removeAttr("disabled");
							} else {
								window.location = site_url + 'user_management/change_pass/add_success';
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
</script>