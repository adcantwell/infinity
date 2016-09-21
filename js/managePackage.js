//function to add new data to table from modal. Uses JQuery Template
$(function() {
	$('#addPackageSubmit').click(function(e) {
		var model = new Object();	
		
		model.Name = $('#name').val();
		model.Category = $('#category').val();
		model.ChargingType = $('#chargingType').val();
		model.TransmissionType = $('#transmissionType').val();
		model.Channels = $('#channels').val();
		model.Cost = $('#cost').val();
		model.AvailableFrom = $('#availableFrom').val();
		model.AvailableTo = $('#availableTo').val();
		model.AddedByDefault = $('#addedByDefault').val();
		
		//model needs to be read into db

		$.tmpl($('#tableLayout'), model).appendTo('#packageTable');
		$('#name').val('');
		$('#category').val('');
		$('#chargingType').val('');
		$('#transmissionType').val('');
		$('#channels').val('');
		$('#cost').val('');
		$('#availableFrom').val('');
		$('#availableTo').val('');
		$('#addedByDefault').val('');
		$('#addPackage').modal('hide');
	});
});
