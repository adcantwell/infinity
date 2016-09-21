<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.Channel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Manage Channel</title>
<link href="bootstrap/css/bootstrap.css" type="text/css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
	type="text/javascript"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/manageChannel.js"></script>
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
				<div class="panel-heading">Channels</div>
				<div class="table-responsive">

					<form action="ChannelController" method="post">
						<input type="hidden" name="source" value="searchChannel" />
						<table class="table table-striped" id="channelTable">
							<tr>
								<th>Name</th>
								<th>Channel Band</th>
								<th>Video Frequency</th>
								<th>Audio Frequency</th>
								<th>Charging Type</th>
								<th>Transmission Type</th>
								<th>Charge</th>
								<th>Delete</th>
							</tr>
							<%
						ArrayList<Channel> channelList = (ArrayList<Channel>)request.getAttribute("channelList");
						Channel channel= null;
						if(channelList!=null && channelList.size()>0){
							for(int i = 0;i<channelList.size();i++){
								channel = new Channel();
								channel = channelList.get(i);
								System.out.print(channel.toString());
						%>
							<tr align="center">
								<td><%= channel.getChannelName() %></td>
								<td><%= channel.getChannelBand()%></td>
								<td><%= String.format("%.2f", channel.getVideoFrequency())%> MHz</td>
								<td><%= String.format("%.2f", channel.getAudioFrequency())%> MHz</td>
								<td><%= channel.getChargeType()%></td>
								<td><%= channel.getTransmissionType()%></td>
								<td><%= 
								String.format("$%4.2f/month",channel.getChannelCharge()).replace(" ", "")
								%></td>
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
	<div class="row">
		<div class="col-sm-2 col-sm-offset-5">
			<div align="center">
				<button class="btn btn-primary" data-toggle="modal"
					data-target="#addChannel">Add</button>
				<div id="addChannel" class="modal fade" role="dialog">
					<!-- MODAL TOP -->
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Add Channel</h4>
							</div>
							<form action="ChannelController" method="post" name="addChannel"
								class="form-horizontal form-credentials" data-toggle="validator"
								role="form">

								<input type="hidden" name="source" value="addChannel" />
								<fieldset>
									<div class="modal-body">

										<div class="form-group has-feedback">
											<label for="name" class="hide">Name:</label>
											<div class="col-sm-12">
												<input type="text" name="name" class="form-control"
													id="name" placeholder="Channel Name" required autofocus>
											</div>
										</div>

										<div class="form-group has-feedback">
											<label for="channelBand" class="hide">Channel Band:</label>
											<div class="col-sm-12">
												<input type="text" name="band" class="form-control"
													id="channelBand" placeholder="Channel Band" required
													autofocus>
											</div>
										</div>

										<div class="form-group has-feedback">
											<label for="video" class="hide">Video Frequency:</label>
											<div class="col-sm-12">
												<input type="number" name="videoFreq" class="form-control"
													id="video" placeholder="Video Frequency" required autofocus>
											</div>
										</div>

										<div class="form-group has-feedback">
											<label for="audio" class="hide">Audio Frequency:</label>
											<div class="col-sm-12">
												<input type="number" name="audioFreq" class="form-control"
													id="audio" placeholder="Audio Frequency" required autofocus>
											</div>
										</div>

										<div class="form-group has-feedback">
											<label for="charType" class="hide">Charging Type:</label>
											<div class="col-sm-12">
												<!-- <input type="text" class="form-control" id="chargingType" placeholder="Charging Type" required autofocus> -->
												<select class="form-control" name="chargeType"
													id="chargingType">
													<option value="">Select A Charge Type</option>
													<option value="FTA">Free To Air</option>
													<option value="Paid">Paid</option>
												</select>
											</div>
										</div>

										<div class="form-group has-feedback">
											<label for="transType" class="hide">Transmission
												Type:</label>
											<div class="col-sm-12">
												<!-- <input type="text" class="form-control" id="transmissionType" placeholder="Transmission Type" required autofocus> -->
												<select class="form-control" name="transType"
													id="transmissionType">
													<option value="">Select A Transmission Type</option>
													<option value="Standard">Standard</option>
													<option value="HD">HD</option>
												</select>
											</div>
										</div>

										<div class="form-group has-feedback">
											<label for="charge" class="hide">Charge:</label>
											<div class="col-sm-12">
												<input type="number" name="charge" class="form-control"
													id="charge" placeholder="Charge" required autofocus>
											</div>
										</div>
									</div>
								</fieldset>
								<div class="modal-footer">
									<button id="addChannelSubmit" type="submit" value="click"
										class="btn btn-success">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>