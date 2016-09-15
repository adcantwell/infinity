//function to add new data to table from modal. Uses JQuery Template
$(function() {
	$('#addChannelSubmit').click(function(e) {
		var model = new Object();	
		
		model.Name = $('#name').val();
		model.Category = $('#category').val();
		model.VideoFrequency = $('#video').val();
		model.AudioFrequency = $('#audio').val();
		model.ChargingType = $('#chargingType').val();
		model.TransmissionType = $('#transmissionType').val();
		model.Charge = $('#charge').val();
		
		//model needs to be read into db

		$.tmpl($('#tableLayout'), model).appendTo('#channelTable');
		$('#name').val('');
		$('#category').val('');
		$('#video').val('');
		$('#audio').val('');
		$('#chargingType').val('');
		$('#transmissionType').val('');
		$('#charge').val('');
		$('#addChannel').modal('hide');
	});
});