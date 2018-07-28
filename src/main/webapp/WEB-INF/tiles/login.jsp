<!-- Source for the bootstrap login form tthe
  urls
  https://bootsnipp.com/tags/login
  https://bootsnipp.com/snippets/featured/login-amp-signup-forms-in-panel
   -->

			<h3>Login with Username and Password (Custom Page)</h3>

			<div class="container">
				<div id="loginbox" style="margin-top: 50px;"
					class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Sign In</div>
							<div
								style="float: right; font-size: 80%; position: relative; top: -10px">
								<a href="#">Forgot password?</a>
							</div>
						</div>

						<div style="padding-top: 30px" class="panel-body">

							<c:if test="${param.error != null}">
								<div id="login-alert" class="alert alert-danger col-sm-12">
									Your login attempt was not successful, try again.<br /> Caused
									: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}

								</div>
							</c:if>
							<form id="login-form" class="form-horizontal" role="form"
								action="/login" method='POST'>

								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input
										id="login-username" type="text" class="form-control"
										name="username" value="" placeholder="username or email">
								</div>

								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input
										id="login-password" type="password" class="form-control"
										name="password" placeholder="password">
								</div>


								<div class="input-group">
									<div class="checkbox">
										<label> <input id="login-remember" type="checkbox"
											name="remember" value="1"> Remember me
										</label>
									</div>
								</div>


								<div style="margin-top: 10px" class="form-group">
									<!-- Button -->

									<div class="col-sm-12 controls">
										<a id="btn-login" href="#" class="btn btn-success"
											type="submit" onclick="submit_form()">Login </a>
										<!--  <a id="btn-fblogin" href="#" class="btn btn-primary">Login with Facebook</a> -->
										<a id="btn-fblogin" href="#" class="btn btn-primary"
											name="reset" type="reset" onclick="login_form_reset()">Reset</a>
											
									</div>
								</div>


								<div class="form-group">
									<div class="col-md-12 control">
										<div
											style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
											Don't have an account! <a href="#"
												onClick="$('#loginbox').hide(); $('#signupbox').show()">
												Sign Up Here </a>
										</div>
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>

			<a id="protected_page" href="/protectedpage" class="btn btn-primary">protectedpage</a>
				
			</div>

