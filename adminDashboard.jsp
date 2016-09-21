<%@page import="com.controller.OperatorController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.Operator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Administrator Dashboard</title>
	<link href="bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>
	<script src="js/dashboard.js"></script>
	<script src="js/registrationPage.js"></script>
	<script src="bootstrap/js/validator.js"></script>
	<script src="js/geocode.js"></script>
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
		<div class="col-sm-6 col-sm-offset-3">
			<div class="page-header" align="center">
				<h1>Administrator Management Options</h1>
			</div>
		</div>
	</div>
	<div class="row" align="center">
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Customer Management</div>
				<div class="panel-body">
					<div class="row" align="center">
						<button class="btn btn-primary" data-toggle="modal"
							data-toggle="validator" role="form"
							data-target="#customerRegistration">Create Customer</button>
						<div id="customerRegistration" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Customer Registration</h4>
									</div>
									<div class="modal-body">
										<form name="customerRegistration" data-toggle="validator"
											id="custRegister" role="form" action="CustomerController"
											method="post" class="form-horizontal form-credentials">
											<input type="hidden" name="source" value="addCustomerAdmin">
											<fieldset>
												<div class="form-group has-feedback">
													<label for="first" class="hide">First Name:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" name="first"
															id="first" placeholder="First Name" required autofocus
															data-minlength="2">
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="last" class="hide">Last Name:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="last"
															name="last" placeholder="Last Name" required autofocus
															data-minlength="2">
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="email" class="hide">Email:</label>
													<div class="col-sm-12">
														<input type="email" class="form-control" id="email"
															name="email" placeholder="Email" required autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="phone" class="hide">Phone Number:</label>
													<div class="col-sm-12">
														<input type="number" data-minlength="10" name="phone"
															data-maxlength="9" class="form-control" id="phone"
															placeholder="Phone Number" required autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="addr1" class="hide">Address 1:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="addr1"
															name="addr1" placeholder="Address 1" required autofocus>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="addr2" class="hide">Address 2:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="addr2"
															name="addr2" placeholder="Address 2">
													</div>
												</div>
												<div class="form-group has-feedback">
													<label for="zip" class="hide">Zip Code:</label>
													<div class="col-sm-12">
														<input type="text" data-minlength="5" class="form-control"
															id="zip" name="zip" data-error="Invalid Zip Code"
															placeholder="Zip Code" required autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>
												<div class="form-group has-feedback">
													<label for="city" class="hide">City:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="city"
															name="city" placeholder="City" required autofocus>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="state" class="hide">State:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="state"
															name="state" placeholder="State" required autofocus>
													</div>
												</div>

												

												<div class="form-group has-feedback">
													<label for="pass1" class="hide">Password:</label>
													<div class="col-sm-12">
														<input type="password" data-minlength="6"
															class="form-control" id="pass1" name="pass1"
															placeholder="Password" required autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="pass2" class="hide">Confirm Password:</label>
													<div class="col-sm-12">
														<input type="password" data-match="#pass1"
															class="form-control" id="pass2"
															data-match-error="Passwords don't match"
															placeholder="Confirm Password" required autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>
											</fieldset>

											<div class="modal-footer">
												<button id="customerRegistrationSubmit" type="submit"
													onclick="passCheck(pass1)" value="Register" class="btn btn-success">Register</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Operator Management</div>
				<div class="panel-body">
					<div class="row" align="center">
						<button class="btn btn-primary" data-toggle="modal"
							data-toggle="validator" role="form"
							data-target="#operatorRegistration">Create Operator</button>
						<div id="operatorRegistration" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											data-toggle="validator" role="form">&times;</button>
										<h4 class="modal-title">Operator Registration</h4>
									</div>
									<div class="modal-body">
										<form action="OperatorController" method="post"
											name="operatorRegistration" data-toggle="validator"
											role="form" class="form-horizontal form-credentials"
											name="addOperator">
											<input type="hidden" name="source" value="addOperator" />
											<fieldset>
												<div class="form-group with-feedback">
													<label for="first" class="hide">First Name:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="first"
															name="first" placeholder="First Name" required autofocus
															data-minlength="2">
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group with-feedback">
													<label for="last" class="hide">Last Name:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="last"
															name="last" placeholder="Last Name" required autofocus
															data-minlength="2">
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group with-feedback">
													<label for="email" class="hide">Email:</label>
													<div class="col-sm-12">
														<input type="email" class="form-control" id="email"
															name="email" placeholder="Email" required autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group with-feedback">
													<label for="phone" class="hide">Phone Number:</label>
													<div class="col-sm-12">
														<input type="number" class="form-control" id="phone"
															name="phone" placeholder="Phone Number" required
															autofocus data-maxlength="11">
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group with-feedback">
													<label for="start" class="hide">Start Time:</label>
													<div class="col-sm-12">
														<!-- <input type="text" class="form-control" id="start" placeholder="Start Time" required autofocus>  -->
														<select type="time" class="form-control" id="start"
															name="start">
															<option value="">Select A Start Time</option>
															<option value="7">7:00am</option>
															<option value="8">8:00am</option>
															<option value="9">9:00am</option>
														</select>
													</div>
												</div>

												<div class="form-group with-feedback">
													<label for="numCust" class="hide">Max Number of
														Customers:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="numCust"
															name="numCust" placeholder="Maximum Number of Customers"
															required autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group with-feedback">
													<label for="creation" class="hide">Creation Date:</label>
													<p
														style="padding-left: 12px; margin-top: -16px; margin-bottom: -1px; font-size: 15px">Creation
														Date:</p>
													<div class="col-sm-12">
														<input type="date" class="form-control" id="creation"
															name="creation" placeholder="Creation Date" required
															autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="oppass1" class="hide">Password:</label>
													<div class="col-sm-12">
														<input type="password" data-minlength="6"
															class="form-control" id="oppass1" name="oppass1"
															placeholder="Password" required autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="oppass2" class="hide">Confirm Password:</label>
													<div class="col-sm-12">
														<input type="password" data-match="#oppass1"
															class="form-control" id="oppass2"
															data-match-error="Passwords don't match"
															placeholder="Confirm Password" required autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>
											</fieldset>
											<div class="modal-footer">
												<button id="operatorRegistrationSubmit" type="submit"
													onclick="passCheck(oppass1)" value="click" class="btn btn-success">Submit</button>
											</div>
										</form>
									</div>

								</div>
							</div>
						</div>
						<button class="btn btn-primary" onclick="window.location.href='OperatorController'"
							data-toggle="collapse">Search Operator</button>
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Retailer Management</div>
				<div class="panel-body">
					<div class="row" align="center">
						<button class="btn btn-primary" data-toggle="modal"
							data-toggle="validator" role="form"
							data-target="#retailerRegistration">Create Retailer</button>
						<div id="retailerRegistration" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											data-toggle="validator" role="form">&times;</button>
										<h4 class="modal-title">Retailer Registration</h4>
									</div>

									<form name="addRetailer" data-toggle="validator" role="form"
										action="RetailerController" method="post"
										class="form-horizontal form-credentials">
										<input type="hidden" name="source" value="addRetailer" />
										<div class="modal-body">
											<fieldset>
												<div class="form-group has-feedback">
													<label for="fname" class="hide">Full Name/Company
														Name:</label>
													<div class="col-sm-12">
														<input type="text" name="fname" class="form-control"
															id="fname" placeholder="Full Name/Company Name" required
															autofocus data-minlength="2">
													</div>
													<div class="help-block with-errors"></div>
												</div>

												<div class="form-group has-feedback">
													<label for="cont1" class="hide">Contact #1:</label>
													<div class="col-sm-12">
														<input type="number" data-maxlength="11"
															class="form-control" name="cont1" id="cont1"
															placeholder="Contact #1" required autofocus>
													</div>
													<div class="help-block with-errors"></div>
												</div>

												<div class="form-group has-feedback">
													<label for="cont2" class="hide">Contact #2:</label>
													<div class="col-sm-12">
														<input type="number" data-maxlength="11"
															class="form-control" name="cont2" id="cont2"
															placeholder="Contact #2">
													</div>
													<div class="help-block with-errors"></div>
												</div>

												<div class="form-group has-feedback">
													<label for="addr1" class="hide">Address #1:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" name="addr1"
															id="addr1" placeholder="Address #1" required autofocus>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="addr2" class="hide">Address #2::</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" name="addr2"
															id="addr2" placeholder="Address #2">
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="zip" class="hide">Zip Code:</label>
													<div class="col-sm-12">
														<input type="number" data-minlength="5"
															class="form-control" name="zip" id="retzip"
															data-error="Invalid Zip Code" placeholder="Zip Code"
															required autofocus>
														<div class="help-block with-errors"></div>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="city" class="hide">City:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" name="city"
															id="retcity" placeholder="City" required autofocus>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="state" class="hide">State:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" name="state"
															id="retstate" placeholder="State" required autofocus>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="tbLim" class="hide">Set Top Box Limit:</label>
													<div class="col-sm-12">
														<input type="number" class="form-control" name="tbLim"
															id="tbLim" placeholder="Set Top Box Limit" required
															autofocus>
													</div>
												</div>

												<div class="form-group has-feedback">
													<label for="credLim" class="hide">Credit Limit:</label>
													<div class="col-sm-12">
														<input type="number" class="form-control" name="credLim"
															id="credLim" placeholder="Credit Limit" required
															autofocus>
													</div>
													<div class="help-block with-errors"></div>
												</div>

												<div class="form-group has-feedback">
													<label for="comPer" class="hide">Commission
														Percentage:</label>
													<div class="col-sm-12">
														<input type="number" class="form-control" name="comPer"
															id="comPer" placeholder="Commission Percentage" required
															autofocus>
													</div>
													<div class="help-block with-errors"></div>
												</div>

												<div class="form-group has-feedback">
													<label for="serChg" class="hide">Service Charges:</label>
													<div class="col-sm-12">
														<input type="number" class="form-control" name="serChg"
															id="serChg" placeholder="Service Charges" required
															autofocus>
													</div>
													<div class="help-block with-errors"></div>
												</div>

												<div class="form-group has-feedback">
													<label for="invList" class="hide">Inventory List:</label>
													<p
														style="padding-left: 12px; margin-top: -16px; margin-bottom: -1px; font-size: 15px">Inventory
														List:</p>
													<div class="col-sm-12">
													<!-- class="form-control" -->
														<input type="file" class="" name="invList"
															id="invList" placeholder="Inventory List" required
															autofocus>
													</div>
												</div>

												<div class="form-group">
													<label for="createDate" class="hide">Retailer
														Creation Date:</label>
													<p
														style="padding-left: 12px; margin-top: -16px; margin-bottom: -1px; font-size: 15px">Retailer
														Creation Date:</p>
													<div class="col-sm-12">
														<input type="text" readonly id="x" class="form-control"
															id="createDate" name="createDate"
															placeholder="Retailer Creation Date">
													</div>
													<script>
														document
																.getElementById("x").value = Date();
													</script>
												</div>

												<div class="form-group has-feedback">
													<label for="totVal" class="hide">Total Cost of
														Inventory:</label>
													<p
														style="padding-left: 12px; margin-top: -16px; margin-bottom: -1px; font-size: 15px">Total
														Value</p>
													<div class="col-sm-12">
														<input type="number" class="form-control" name="totVal"
															id="totVal" placeholder="Total Cost of Inventory"
															required autofocus>
													</div>
													<div class="help-block with-errors"></div>
												</div>
											</fieldset>
										</div>
										<div class="modal-footer">
											<button id="retailerRegistrationSubmit"
												onclick="check(this.form)" type="submit" value="click"
												class="btn btn-success">Register</button>
										</div>

									</form>
								</div>
							</div>
						</div>
						<button class="btn btn-primary" onclick="window.location.href='RetailerController'">Show Retailers</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" align="center">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Plan Management</div>
				<div class="panel-body">
				
					<!-- no onclick because page not created -->
					<button class="btn btn-primary"
						onclick="">Package</button>
					<button class="btn btn-primary"
						onclick="window.location.href='ChannelController'">Channel</button>
					<button class="btn btn-primary"
						onclick="window.location.href='SetTopBoxController?source=standard'">Set
						Top Box</button>
				</div>
			</div>
		</div>
		<div class="col-sm-6" align="center">
			<div class="panel panel-primary">
				<div class="panel-heading">Bill Management</div>
				<div class="panel-body">
					<!-- TODO: This button needs generate bills from backend -->
					<button class="btn btn-primary" data-toggle="modal"
						data-target="#generateBills">Generate Bills</button>
					<div id="generateBills" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										role="form">&times;</button>
									<h4 class="modal-title">Generate Bills</h4>
								</div>
								<div class="modal-body">
									<h3>Bills Have Been Generated!</h3>
								</div>
							</div>
						</div>
					</div>
					<!-- TODO: This button needs deduct bills from backend -->
					<button class="btn btn-primary" data-toggle="modal"
						data-target="#deductBills">Deduct Bills</button>
					<div id="deductBills" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										role="form">&times;</button>
									<h4 class="modal-title">Generate Bills</h4>
								</div>
								<div class="modal-body">
									<h3>Bills Have Been Deducted!</h3>
								</div>
							</div>
						</div>
					</div>
					
					<!-- no onclick because page not created -->
					<button class="btn btn-primary"
						onclick="">Existing
						Bills</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="dataTable">
		<div class="col-sm-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-sm-2">
							<h4>Operator Search</h4>
						</div>
						<div class="col-sm-3 col-sm-offset-7">
							<input type="text" id="filter" class="search form-control"
								placeholder="Who are you looking for?">
						</div>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table table-striped" id="operatorTable">
					<thead >
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Start Time</th>
							<th>Max Customers</th>
						</tr>
					</thead>
					<tbody class="searchable">
						<%
							ArrayList<Operator> operatorList = (ArrayList<Operator>)request.getAttribute("operatorList");
							Operator operator; 
							if(operatorList!=null && operatorList.size()>0){
							for(int i = 0;i<operatorList.size();i++){
							operator=new Operator();
							operator=operatorList.get(i);
						%>
						<tr >
							<td><%=operator.getFirstName()%></td>
							<td><%=operator.getLastName()%></td>
							<td><%=operator.getEmail()%></td>
							<td><%=operator.getPhoneNumber()%></td>
							<td><%=operator.getShiftTimeStart()%></td>
							<td><%=operator.getMaxNumCustomer()%></td>
						</tr>
						<%
							}
																								}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>