<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>Login Page</title>
		<link href="bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    </head>
	
	<header>
		<div class="row bg-primary">
			<div class="col-sm-2">
				<img src= "images/Infinity_Transparent.png" style="width:200px;height:100px;">
			</div>
			<div class="col-sm-10">
				<h1 style="padding-top: 10px">Infinity DTH Services</h1>
			</div>
		</div>
	</header>
	
    <body>
		<div class="row">
			<div class="col-sm-4 col-sm-offset-4" style="padding-top: 1em;">
				<form name="login" class="form-horizontal form-credentials" action="UserController" method="post">
					<fieldset>
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h2 class="panel-title text-center">Login</h2>
							</div>
							<div class="panel-body">
								<div class="form-group">
									<label for="usr" class="hide">Email:</label>
									<div class="col-sm-12">
										<input type="text" class="form-control" id="usr" name="username" placeholder="Email" required autofocus>
									</div>
								</div>
								
								<div class="form-group">
									<label for="pwd" class="hide">Password:</label>
									<div class="col-sm-12">
										<input type="password" class="form-control" id="pwd" name="password" placeholder="Password" required autofocus>
									</div>
								</div>
							</div>
							<div class="panel-footer clearfix">
								<button type="submit" onclick="check(this.form)" value="Login" class="btn btn-primary pull-right">Login</button>
								<!--TODO: Link to register page-->
								<!-- <button class="btn btn-primary" onclick="window.location.href='registrationPage.html'">Register</button> -->
								<button class="btn btn-primary" onclick="window.location.href='customerRegistration.jsp'">Register</button> 
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
    </body>
</html>