<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Registration</title>
	<link href="bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
	<script src="bootstrap/js/validator.js"></script>
	<script src="js/geocode.js"></script>
	<script src="js/customerRegistration.js"></script>
	<script src="js/passwordStrength.js"></script>
</head>
<header>
	<div class="row bg-primary">
		<div class="col-sm-2">
			<img src="images/Infinity_Transparent.png"
				style="width: 200px; height: 100px;">
		</div>
		<div class="col-sm-10">
			<h1 style="padding-top: 10px">Infinity DTH Services</h1>
		</div>
	</div>
</header>

<body>
	<div class="row">
		<div class="col-sm-4 col-sm-offset-4" style="padding-top: 1em;">
			<form action="CustomerController" method="post" name="registration" class="form-horizontal form-credentials" data-toggle="validator" role="form" id="registrationForm">
				<input type ="hidden" name="source" value="addCustomer">
				<fieldset>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h2 class="panel-title text-center">Customer Registration</h2>
						</div>
						<div class="panel-body">
							<div class="form-group has-feedback">
								<label for="first" class="hide">First Name:</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" name="first" id="first"
										placeholder="First Name" required autofocus data-minlength="2">
									<div class="help-block with-errors"></div>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label for="last" class="hide">Last Name:</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="last" name="last"
										placeholder="Last Name" required autofocus data-minlength="2">
									<div class="help-block with-errors"></div>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label for="email" class="hide">Email:</label>
								<div class="col-sm-12">
									<input type="email" class="form-control" id="email" name="email"
										placeholder="Email" required autofocus>
									<div class="help-block with-errors"></div>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label for="phone" class="hide">Phone Number:</label>
								<div class="col-sm-12">
									<input type="number" data-minlength="10" name="phone" data-maxlength = "9" class="form-control" id="phone"
										placeholder="Phone Number" required autofocus>
									<div class="help-block with-errors"></div>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label for="addr1" class="hide">Address 1:</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="addr1" name="addr1"
										placeholder="Address 1" required autofocus>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label for="addr2" class="hide">Address 2:</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="addr2" name="addr2"
										placeholder="Address 2">
								</div>
							</div>
							
							<div class="form-group has-feedback">
								<label for="zip" class="hide">Zip Code:</label>
								<div class="col-sm-12">
									<input type="text" data-minlength="5" class="form-control" id="zip" name="zip"
										data-error="Invalid Zip Code"
										placeholder="Zip Code" required autofocus>
									<div class="help-block with-errors"></div>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label for="city" class="hide">City:</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="city" name="city"
										placeholder="City" required autofocus>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label for="state" class="hide">State:</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="state" name="state"
										placeholder="State" required autofocus>
								</div>
							</div>
							<br>
							<div class="form-group">
								<label for="createDate" class="hide">Customer
									Creation Date:</label>
								<p
									style="padding-left: 12px; margin-top: -16px; margin-bottom: -1px; font-size: 15px"></p>
								<div class="col-sm-12">
									<input type="text" readonly id="x" class="form-control"
										id="createDate" name="createDate"
										placeholder="Customer Creation Date">
								</div>
								<script>
									document
											.getElementById("x").value = Date();
								</script>
							</div>
							
							<div class="form-group has-feedback">
								<label for="pass" class="hide">Password:</label>
								<div class="col-sm-12">
									<input type="password" data-minlength="6" class="form-control" id="pass" name="pass"
										placeholder="Password" required autofocus>
									<div class="help-block with-errors"></div>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label for="pass2" class="hide">Confirm Password:</label>
								<div class="col-sm-12">
									<input type="password" data-match="#pass" class="form-control" id="pass2"
										data-match-error="Passwords don't match"
										placeholder="Confirm Password" required autofocus>
										<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
						<div class="panel-footer clearfix">
							<button id="registerButton" type="submit" value="Register" data-disable="true"
								onclick="passCheck('pass')" class="btn btn-success pull-right">Register</button>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>