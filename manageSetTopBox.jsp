<%@page import="com.bean.SetTopBox"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Set Top Box</title>
<link href="bootstrap/css/bootstrap.css" type="text/css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/managesettopbox.js"></script>
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
	<div class="row" style="padding-top: 5px;">
		<div class="col-sm-12">
			<div class="panel panel-primary">
				<div class="panel-heading">Set Top Box Types</div>
				<div class="table-responsive">
					<table id="setTopBoxTypes" class="table table-striped">
						<tr>
							<th>Type</th>
							<th>Features</th>
							<th>Dimensions (LxBxW cm)</th>
							<th>Price</th>
							<th>Installation Charges</th>
							<th>Upgrade Charges</th>
							<th>Discount</th>
							<th>Billing Type</th>
							<th>Refundable</th>
							<th>Edit</th>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>Standard</td> -->
<!-- 							<td><div id="standardfeaturesnoedit">Live Recording, Pause and Play, Child Lock</div><div id="standardfeaturesnoedit">Live Recording, Pause and Play, Child Lock</div></td> -->
<!-- 							<td><div id="standarddimensionsnoedit">40 x 10 x 40</div><div id="standarddimensionsnoedit">40 x 10 x 40</div></td> -->
<!-- 							<td><div id="standarddimensionsnoedit">40 x 10 x 40</div><div id="standarddimensionsnoedit">40 x 10 x 40</div></td> -->
<!-- 							<td><div id="standardinstallnoedit">$100.00</div><div id="standardinstallnoedit">$100.00</div></td> -->
<!-- 							<td><div id="standardupgradenoedit">$0.00</div><div id="standardupgradenoedit">$0.00</div></td> -->
<!-- 							<td><div id="standarddiscountnoedit">10%</div><div id="standarddiscountnoedit">10%</div></td> -->
<!-- 							<td><div id="standarddiscountnoedit">10%</div><div id="standarddiscountnoedit">10%</div></td> -->
<!-- 							<td><div id="standarddiscountnoedit">10%</div><div id="standarddiscountnoedit">10%</div></td> -->
<!-- 							<td><button id="editStandardTypeButton" class="btn btn-primary" onClick="">Edit</button> -->
<!-- 							</td> -->
<!-- 						</tr> -->
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-sm-offset-5">
			<div align="center">
				<!-- <button href="#inventoryDetailsTable" class="btn btn-primary"
					data-toggle="collapse">Show Inventory Details</button> -->
			</div>
		</div>
	</div>
	<!-- form name or id = 'x'; action = SetTopBoxController
	input type hidden value = standard, hd, something-->
	
	<!-- js function(input string) {
	set hidden value = string
	form.submit(); -->
	<div class="row" id="inventoryDetailsTable">
		<div class="col-sm-12">
		<form id ="stbForm" action="SetTopBoxController" name="setTopBoxTable">
		 <input id ="hiddenInput" name ="source" type = "hidden">
			<ul class="nav nav-tabs" data-tabs="tabs">
				<li><a id="standardButton"
					data-toggle="tab" href="#table" >Standard</a></li>
				<li><a id="hdButton"
					data-toggle="tab" href="#table" >High Definition</a></li>
				<li><a id="hdrButton"
					data-toggle="tab" href="#table" >High Definition Recorder</a></li>
				<li><a id="iptvButton" 
				data-toggle="tab" href="#table" >IPTV</a></li>
			
			</ul>
		</form>	
			<%
			session.setAttribute("operation", "standard");
			%>
			<div class="tab-content">
				<div id="table" class="">
					<div class="panel panel-primary">
						<div class="panel-heading">Inventory Details</div>
						<div class="table-responsive">
							<table class="table table-striped" id="standardTable">
								<tr>
									<th>Type</th>
									<th>Serial Number</th>
									<th>MAC ID</th>
									<th>RC Asset ID</th>
									<th>Dish Asset ID</th>
									<th>Status</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
								<% 
								java.util.ArrayList<com.bean.SetTopBox> setTopBoxList = (java.util.ArrayList<SetTopBox>)request.getAttribute("setTopBoxList");
								com.bean.SetTopBox setTopBox;
								if(setTopBoxList!=null && setTopBoxList.size()>0){
									for(int i = 0;i<setTopBoxList.size();i++){
										setTopBox = new com.bean.SetTopBox();
										setTopBox = setTopBoxList.get(i);
								%>
								<tr>
									<td><%= setTopBox.getbType().name() %></td>
									<td><%= setTopBox.getBoxSerialNumber() %></td>
									<td><%= setTopBox.getBoxMacID() %></td>
									<td><%= setTopBox.getRemoteControlAssetID() %></td>
									<td><%= setTopBox.getDishAssetID() %></td>
									<td><%= setTopBox.getBoxStatus() %></td>
									<td><button class="btn btn-primary" onClick="">Edit</button></td>
									<td><button class="btn btn-danger" onClick="">Delete</button></td>
								</tr>
								<%}
								}%>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 col-sm-offset-5">
							Select a CSV File: <input type="file" name="csv">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>