<%@page import="com.bean.SetTopBox"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Dashboard</title>
		<link href="bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.js"></script>
		<script src="js/purchaseScript.js"></script>
		<script src="js/dashboard.js"></script>
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
				<h1>Customer Options</h1>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-10 col-sm-offset-1">
			<div class="panel panel-primary">
				<div class="panel-heading">Customer Plans</div>
				<div class="panel-body">
					<div class="row">
						<!--<div class="radio-form">-->
						<form action="CustomerDashboardController" method="post" class="radio-form">
							<div class="col-sm-6" id="payment">
								Payment Type:<br /> 
								<select class="form-control" name="paytype" id="paytype">
									<option value="">Select payment type</option>
									<option value="prepaid">Prepaid</option>
									<option value="postpaid">Postpaid</option>
								</select>
								<br>
							</div>
							<div class="col-sm-6" id="stbtype" align="right">
								STB Type:<br /> 
								<select class="form-control" name="stbtype" id="stbtype">
									<option value="">Select STB Type</option>
									<option value="standard">Standard</option>
									<option value="iptv">IPTV</option>
									<option value="hd">HD</option>
									<option value="hdr">HD Recorder</option>
								</select>
								<br>
							</div>
							<div class="panel-footer clearfix">
								<button type="submit" value="" class="btn btn-primary" onclick="window.location.href='CustomerDashboardController'">See STB</button>
							</div>
						</form>
					</div>
				</div>
				
				<div class="row" style="padding-top: 5px;">
					<div class="col-sm-12">
						<div class="panel panel-default" id="hiddenTable">
							<div class="panel-heading search-results">Search Results</div>
							<div class="table-responsive">
								<table class="table table-striped" id="searchResultsTable">
									<tr>
										<th>Box ID</th>
										<th>STB Type</th>
										<th>STB Features</th>
										<th>Dimensions</th>
										<th>Price</th>
										<th>Installation Charges</th>
										<th>Upgrade Charge</th>
										<th>Discount</th>
										<th>Billing Type</th>
										<th>Deposit</th>
										<th>Cart</th>
									</tr>
									
									<%
										java.util.ArrayList<SetTopBox> stbList = (java.util.ArrayList<SetTopBox>)request.getAttribute("stbList");
										SetTopBox stb;
										if(stbList != null && stbList.size() > 0){
											for(int i = 0; i < stbList.size(); i++){
												stb = new SetTopBox();
												
												stb = stbList.get(i);										
									%>
									<tr align="center">
										<td class="type"><%= stb.getBoxId() %></td>
										<td><%= stb.getbType() %></td>
										<td><%= stb.getBoxFeature() %></td>
										<td><%= stb.getBreadth() + "x" + stb.getLength() + "x" + stb.getWidth() %></td>
										<td><%= "$ " + stb.getPrice() %></td>
										<td><%= "$ " + stb.getInstallationCharge() %></td>
										<td><%= "$ " + stb.getUpgradationCharge() %></td>
										<td><%= "$ " + stb.getDiscount() %></td>
										<td><%= stb.getBillType() %></td>
										<td><%= "$ " + stb.getRefundableDepositAmount() %></td>
										<td><button class="btn btn-primary" onclick="passToModal(this)">Add</button>
									</tr>
									<% 	}
										}%>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			
			<div id="purchaseBox" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Purchase Form</h4>
						</div>
						<div class="modal-body">
							<h3>Are you sure you would like to purchase this package?</h3>
							<%-- <div class="panel panel-primary" id="cartTableHeader">
								<div class="panel-heading cart">Shopping Cart</div>
								<div class="table-responsive">
									<table class="table table-striped" id="cartTable">
										<%-- <%
										//java.util.ArrayList<SetTopBox> stbList = (java.util.ArrayList<SetTopBox>)request.getAttribute("stbList");
										//SetTopBox stb;
										if(stbList != null && stbList.size() > 0){
											for(int i = 0; i < stbList.size(); i++){
												stb = new SetTopBox();
												stb = stbList.get(i);
												if(stb.getBoxId() == 4) {
													
																						
									%>
										<tr>
											<th>Customer Name</th>
											<td></td>
										</tr>
										<tr>
											<th>STB Type</th>
											<td><%= stb.getbType() %></td>
										</tr>
										<tr>
											<th>STB MAC ID</th>
											<td></td>
										</tr>
										<tr>
											<th>STB Serial Number</th>
											<td><%= stb.getBoxMacID() %></td>
										</tr>
										<tr>
											<th>STB Price</th>
											<td><%= "$ " + stb.getPrice() %></td>
										</tr>
										<tr>
											<th>Installation Charge</th>
											<td><%= "$ " + stb.getInstallationCharge() %></td>
										</tr>
										<tr>
											<th>Deposit</th>
											<td><%= "$ " + stb.getRefundableDepositAmount() %></td>
										</tr>
										<tr>
											<th>Discount</th>
											<td><%= "$ " + stb.getDiscount() %></td>
										</tr>
										<tr>
											<th>Tax</th>
											<td><%= "$ " + stb.getTax() %></td>
										</tr>
										<tr>
											<th>Amount Payable</th>
											<td><%= "$ " + stb.getAmount_Payable() %></td>
										</tr>
										<% 	}}
										}%> 
									</table>
								</div>
							</div>
						</div> --%>
						<div class="modal-footer">
							<button id="purchaseSubmit" type="submit" value="click"
								class="btn btn-success" data-dismiss="modal">Submit</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>