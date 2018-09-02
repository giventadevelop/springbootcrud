
	<!-- <div style="padding-left: 30px;padding-right: 30px">
   <ui-view> </ui-view>
    </div> -->
	<!-- Source for the bootstrap login form tthe
  urls
  https://bootsnipp.com/tags/login
  https://bootsnipp.com/snippets/featured/login-amp-signup-forms-in-panel
   -->

	<!-- <div style="padding-left: 30px; padding-right: 30px">
		<ui-view> </ui-view>
	</div> -->

	<h3>Register User</h3>

	<div class="container">
		<div class="row clearfix">
			<div class="container main-content" ng-controller="UserController">
				<div
					class="col-xs-12 col-sm-12 col-md-8 col-lg-6  column col-sm-offset-0 col-md-offset-2 col-lg-offset-3">
					<form ng-submit="onSubmit()" novalidate="novalidate"
						ng-hide="submitted" name="registerUserForm"
						class="form-horizontal">
						<fieldset>

							<!-- The horizontal layout form from https://www.bootply.com/s2mmi1YyL4 -->

							<div class="form-group">

								<label class="col-md-2 control-label" for="firstName">First
									Name</label>
								<div class="col-md-4">
									<input type="text" ng-model="formModel.firstName"
										name="firstName" id="firstName" required="required" size="25"
										class="form-control input-md">
								</div>
								<!--  </div>-->

								<label class="col-md-2 control-label" for="lastName">Last
									Name</label>
								<div class="col-md-4">
									<input type="text" ng-model="formModel.lastName"
										name="lastName" id="lastName" required="required" size="25"
										class="form-control input-md">
								</div>

							</div>


							<div class="form-group" id="username_form_group"
								name="username_form_group"	>
<!-- ng-class="{ 'has-error' : username_has_error }" -->
								<label class="col-md-2 control-label" for="username">User
									Name</label>
								<div class="col-md-4">
									<input type="text" ng-model="formModel.userName"
										ng-pattern="/^[A-Za-z0-9_]{1,32}$/" ng-minlength="5"
										ng-pattern-err-type="badUsername" name="userName"
										id="userName" ng-blur="userNameSearch()"
										placeholder="User Name" required="required" size="16"
										class="form-control input-md">
								</div>

<!-- The below shows 'User name available.'  next to user name but commenetd since we  are not being able to show the message under the text filed instead appearing to the right
may fix later. -->

								<!-- <div id="userAvailable" class="{{username_availability_class}}"
									ng-cloak>{{ addUserNameAvailabilityStatus.errorMessage }}</div> -->

							</div>

							<!--  </div>-->
							<div class="form-group">
								<label for="password" class="col-md-2 control-label">Password</label>

								<div class="col-md-4">
									<input type="password" class="form-control"
										ng-model="formModel.password" id="password"
										required="required" ng-minlength="5"
										class="form-control input-md">
								</div>

								<label class="col-md-2 control-label" for="email">Email</label>
								<div class="col-md-4">
									<input type="email" ng-model="formModel.email" id="email"
										required="required" size="25" class="form-control input-md">
								</div>
								<!-- <div class="form-group">

									<div id="userAvailable" class="{{username_availability_class}}"
										ng-cloak>{{ addUserNameAvailabilityStatus.errorMessage
										}}</div>


								</div> -->

							</div>

							<div class="form-group">


								<label class="col-md-2 control-label" for="yearPassed">Year
									Passed</label>
								<div class="col-md-4">


									<select ng-model="formModel.yearPassed" name="yearPassed"
										id="yearPassed" required="required" 
										data-dropup-auto="true" data-size="2" class="form-control input-md">

										<option value="1965">1965</option>
										<option value="1966">1966</option>
										<option value="1967">1967</option>
										<option value="1968">1968</option>
										<option value="1969">1969</option>
										<option value="1970">1970</option>
										<option value="1971">1971</option>
										<option value="1972">1972</option>
										<option value="1973">1973</option>
										<option value="1974">1974</option>
										<option value="1975">1975</option>
										<option value="1976">1976</option>
										<option value="1977">1977</option>
										<option value="1978">1978</option>
										<option value="1979">1979</option>
										<option value="1980">1980</option>
										<option value="1981">1981</option>
										<option value="1982">1982</option>
										<option value="1983">1983</option>
										<option value="1984">1984</option>
										<option value="1985">1985</option>
										<option value="1986">1986</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990">1990</option>
										<option value="1991">1991</option>
										<option value="1992">1992</option>
										<option value="1993">1993</option>
										<option value="1994">1994</option>
										<option value="1995">1995</option>
										<option value="1996">1996</option>
										<option value="1997">1997</option>
										<option value="1998">1998</option>
										<option value="1999">1999</option>
										<option value="2000">2000</option>
										<option value="2001">2001</option>
										<option value="2002">2002</option>
										<option value="2003">2003</option>
										<option value="2004">2004</option>
										<option value="2005">2005</option>
										<option value="2006">2006</option>
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021">2021</option>
										<option value="2022">2022</option>


									</select>


								</div>
							</div>


							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">Address</h3>
								</div>
								<div class="panel-body">



									<div class="form-group">

										<label class="col-md-2 control-label" for="familyName">Family
											Name</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.familyName"
												name="familyName" id="familyName" size="25"
												class="form-control input-md">
										</div>
										<!--  </div>-->

										<label class="col-md-2 control-label" for="addressStreet">Street
											Address</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.addressStreet"
												name="addressStreet" id="addressStreet" size="25"
												class="form-control input-md">
										</div>

									</div>


									<div class="form-group">

										<label class="col-md-2 control-label" for="addressLineTwo">Address
											Line Two</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.addressLineTwo"
												name="addressLineTwo" id="addressLineTwo" size="25"
												class="form-control input-md">
										</div>
										<!--  </div>-->

										<label class="col-md-2 control-label" for="stateOrProvince">State
											Or Province</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.stateOrProvince"
												name="stateOrProvince" id="stateOrProvince" size="25"
												class="form-control input-md">
										</div>

									</div>

									<div class="form-group">

										<label class="col-md-2 control-label" for="city">City</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.city" name="city"
												id="city" size="25" class="form-control input-md">
										</div>
										<!--  </div>-->

										<label class="col-md-2 control-label" for="country">Country</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.country"
												name="country" id="country" size="25"
												class="form-control input-md">
										</div>

									</div>

									<div class="form-group">

										<label class="col-md-2 control-label" for="zipOrPinCode">Zip
											Or Pin Code</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.zipOrPinCode"
												name="zipOrPinCode" id="zipOrPinCode" size="25"
												class="form-control input-md">
										</div>
										<!--  </div>-->

										<label class="col-md-2 control-label" for="phoneNumber">Phone
											Number</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.phoneNumber"
												name="phoneNumber" id="phoneNumber" size="25"
												ng-pattern="/^(\+?(\d{1}|\d{2}|\d{3})[- ]?)?\d{3}[- ]?\d{3}[- ]?\d{4}$/" ng-pattern-err-type="invalidPhoneNumber" 
												class="form-control input-md">
										</div>

									</div>







								</div>
							</div>


							<!-- <div class="form-group">
					<label for="firstName" class="control-label">First Name</label>
					 <input
						type="text" class="form-control" ng-model="formModel.firstName"
						name="firstName" id="firstName" required="required">
				</div>

				<div class="form-group">
					<label for="lastName" class="control-label">Last Name</label> <input
						type="text" class="form-control" ng-model="formModel.lastName"
						name="lastName" id="lastName" required="required">
				</div>
				 -->




							<!-- <div class="form-group">
					<label for="email" class="control-label">Email</label> <input
						type="email" class="form-control" ng-model="formModel.email"
						id="email" required="required">
				</div>

				<div class="form-group" id="username_form_group" name="username_form_group" ng-class="{ 'has-error' : username_has_error }">
					<label for="username" class="control-label">User Name</label> <input
						type="text" class="form-control" ng-model="formModel.userName"
						ng-pattern="/^[A-Za-z0-9_]{1,32}$/" ng-minlength="5"
						ng-pattern-err-type="badUsername" name="userName" id="userName"
						ng-blur="userNameSearch()"
						placeholder="User Name" required="required">
				</div>
 -->

							<!-- <div
					ng-class="addUserNameAvailabilityStatusClass(addUserNameAvailabilityStatus)">
					{{ addUserNameAvailabilityStatus.errorMessage }}</div> -->

							<!-- <div id="userAvailable" 
					class="{{username_availability_class}}"  ng-cloak>
					{{ addUserNameAvailabilityStatus.errorMessage }}</div> -->

							<!-- <div class="form-group" >
			<label for="age" class="control-label">Age</label >
			<input type="number"
			       class="form-control"
			       ng-model="formModel.age"
			       min="18"
			       max="64"
			       id="age"
			       ng-min-err-type="tooYoung"
			       ng-max-err-type="tooOld"
			       required="required" >
		</div > -->

							<!-- <div class="form-group" >
			<label for="sex" class="control-label">Sex</label >
			<select id="sex"
							class="form-control"
							ng-model="formModel.sex"
							required="required" >
				<option value="" >Please Choose</option >
				<option value="male" >Male</option >
				<option value="female" >Female</option >
			</select >
		</div > -->

							<!-- <div class="form-group">
								<label for="password" class="control-label">Password</label> <input
									type="password" class="form-control"
									ng-model="formModel.password" id="password" required="required"
									ng-minlength="5">
							</div>
 -->
							<div class="form-group">

								<!-- <div class="alert alert-danger text-center" ng-show="has_error">
				<h3>There was a problem registering, please try again later!</h3>
			</div> -->

								<button class="btn btn-primary" ladda="submitting"
									data-style="expand-right" type="submit">
									<!-- <span ng-show="submitting">Registering</span>  --><span
										ng-show="!submitting">Register</span>
								</button>
							</div>

						</fieldset>
					</form>

					<div class="alert alert-info text-center" ng-show="submitted">
						<h3>Thanks for Registering!</h3>
					</div>

				</div>
			</div>
		</div>

	</div>
