<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.Retailer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Manage Retailer</title>
<link href="bootstrap/css/bootstrap.css" type="text/css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
	type="text/javascript"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/manageRetailers.js"></script>
<script src="bootstrap/js/validator.js"></script>
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
		<div class="col-sm-10 col-sm-offset-1">
			<div class="panel panel-primary">
				<div class="panel-heading">Retailers</div>
				<div class="table-responsive">

					<form action="RetailerController" method="get">
						<input type="hidden" name="source" value="searchRetailer" />
						<table class="table table-striped" id="retailerTable">
							<tr>
								<th>Name</th>
								<th>Contact #</th>
								<th>City</th>
								<th>State</th>
								<th>Box Limit</th>
								<th>Commission Percentage</th>
								<th>Service Charge</th>
								<th>Inventory Cost</th>
								<th>Delete</th>
							</tr>
							<%
						ArrayList<Retailer> retailerList = (ArrayList<Retailer>)request.getAttribute("retailerList");
						Retailer retailer= null;
						if(retailerList!=null && retailerList.size()>0){
							for(int i = 0;i<retailerList.size();i++){
								retailer = new Retailer();
								retailer = retailerList.get(i);
								System.out.print(retailer.toString());
						%>
							<tr align="center">
								<td><%= retailer.getName() %></td>
								<td><%= retailer.getContactNo1() %></td>
								<td><%= retailer.getCity()%></td>
								<td><%= retailer.getState()%> </td>
								<td><%= retailer.getSetTopBoxLimit()%></td>
								<td><%= String.format("%3.2f%%",Double.parseDouble(retailer.getCommissionPercentage()))%></td>
								<td><%= String.format("$%10.2f", Double.parseDouble(retailer.getServiceCharge())).replaceAll(" ", "")%></td>
								<td><%= String.format("$%10.2f", Double.parseDouble(retailer.getTotalCostInventory())).replaceAll(" ", "")%></td>
								<td><button class="btn btn-danger">Delete</button></td>
							</tr>
							<% }
						}
						%>

						</table>

					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>