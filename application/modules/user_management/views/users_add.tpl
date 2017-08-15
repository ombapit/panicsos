<!-- START ROW -->
<div class="row">
	<div class="starter-template col-sm-8 col-md-8 col-lg-8">
		<form class="form-horizontal" id="form1" method="post" action="{php}echo base_url();{/php}auth/{$stat_cond}" novalidate="novalidate">
			<legend>{$cond} User</legend>
			
			<input type="hidden" name="id" id="id" value="{$detail['id']}"/>
			{$csrf}
			<fieldset>
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-2 control-label" for="first_name">First Name</label>  
				  <div class="col-md-4">
					<input type="text" placeholder="First name" name="first_name" value="{$detail['first_name']}" class="form-control input-md">
				  </div>
				</div>
				<div class="form-group">
				  <label class="col-md-2 control-label" for="last_name">Last name</label>  
				  <div class="col-md-4">
					<input type="text" placeholder="Last name" name="last_name" value="{$detail['last_name']}" class="form-control input-md">
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="col-md-2 control-label" for="username">Username</label>  
				  <div class="col-md-4">
					<input id="username" name="username" placeholder="Username" value="{$detail['username']}" class="form-control input-md" required="" type="text">					
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="col-md-2 control-label" for="password">Password</label>  
				  <div class="col-md-4">
					<input id="password" name="password" placeholder="Password" class="form-control input-md" type="password">					
				  </div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label" for="password_confirm">Confirm Password</label>  
				  <div class="col-md-4">
					<input id="password_confirm" name="password_confirm" placeholder="Confirm Password" class="form-control input-md" type="password">	
				  </div>
				</div>
                
				<div class="form-group">
				  <label class="col-md-2 control-label" for="email">Email</label>  
				  <div class="col-md-4">
					<input id="email" name="email" placeholder="Email" value="{$detail['email']}" class="form-control input-md" required="" type="text">					
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="col-md-2 control-label" for="username">Phone</label>  
				  <div class="col-md-4">
					<input id="phone" name="phone" placeholder="Phone" class="form-control input-md" required="" type="text" value="{$detail['phone']}">					
				  </div>
				</div>
                
				<div class="form-group">
					{$member_groups}
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="submit"></label>
					<div class="col-md-4">
						<a id="cancel" href="{php}echo base_url();{/php}user_management/users" class="btn btn-default">
							Cancel
						</a>
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-save"></i>
							Submit
						</button>
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
			// Rules for form validation
			rules : {
				first_name : {
					required : true
				},
				// last_name : {
					// required : true
				// },
				username : {
					required : true
				},
				// company : {
					// required : true
				// },
				email : {
					required : true,
					email : true
				},
				phone : {
					required : true
				}
			},

			// Messages for form validation
			messages : {
				first_name : {
					required : 'Please enter your first name'
				},
				last_name : {
					required : 'Please enter your last name'
				},
				username : {
					required : 'Please enter your username'
				},
				company : {
					required : 'Please enter your Company'
				},
				email : {
					required : 'Please enter your email address',
					email : 'Please enter a VALID email address'
				},
				phone : {
					required : 'Please enter your Phone'
				},
			},
						
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
								window.location = site_url + 'user_management/users/add_success';
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