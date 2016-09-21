$(document).ready(function() {
//	populateInventoryDetails("standard");
//
	$("#standardButton").click(function(){
		manageClick("standard");
		$("#stbForm").submit();
	});
	$("#hdButton").click(function(){
		manageClick("hd");
		$("#stbForm").submit();
	});
	$("#hdrButton").click(function(){
		manageClick("hdr");
		$("#stbForm").submit();
	});
	$("#iptvButton").click(function(){
		manageClick("iptv");
		$("#stbForm").submit();
	});
	populateSetTopBoxTypes();
});
function manageClick(type){
	$("#hiddenInput").val(type.toString());
	
}
function populateSetTopBoxTypes() {
	var typeArray = [ "standard", "hd", "hdr", "iptv" ];
	var table = document.getElementById("setTopBoxTypes");

	var numResults = typeArray.length;

	for ( var i = 0; i < numResults; i++) {
		// create new row in the table of the correct width
		var row = table.insertRow(i + 1);
		var typeString = typeArray[i];
		row.id = "tr" + typeString;
		var cellArray = new Array();
		for ( var j = 0; j < table.rows[0].cells.length; j++) {
			cellArray.push(row.insertCell(j));
		}

		// fill in with dummy data
		cellArray[0].innerHTML = typeString;
		cellArray[1].innerHTML = makeCellSetTopType(1, i + 1, getRand(0,
				1000000), typeString);
		cellArray[2].innerHTML = makeCellSetTopType(2, i + 1, getRand(0, 1000),
				typeString);
		cellArray[3].innerHTML = makeCellSetTopType(3, i + 1,
				getRand(100, 600), typeString);
		cellArray[4].innerHTML = makeCellSetTopType(4, i + 1,
				getRand(100, 600), typeString);

		cellArray[5].innerHTML = makeCellSetTopType(5, i + 1, getRand(0,
				1000000), typeString);
		cellArray[6].innerHTML = makeCellSetTopType(6, i + 1, getRand(0, 1000),
				typeString);
		cellArray[7].innerHTML = makeCellSetTopType(7, i + 1,
				getRand(100, 600), typeString);
		cellArray[8].innerHTML = makeCellSetTopType(8, i + 1,
				getRand(100, 600), typeString);

		// create onclick function calls for the buttons
		var editFunctionName = "editClickSetTopBox(\'" + typeString + "\',"
				+ (i + 1) + ")";
		var saveFunctionName = "saveClickSetTopBox(\'" + typeString + "\',"
				+ (i + 1) + ")";
		cellArray[9].innerHTML = "<Button class=\"btn btn-primary\" id=\"type"
				+ (i + 1) + typeString + "edit\" onclick=\"" + editFunctionName
				+ "\">Edit</Button>";
		cellArray[9].innerHTML += "<Button class=\"btn btn-success\" id=\"type"
				+ (i + 1) + typeString + "save\" onclick=\"" + saveFunctionName
				+ "\">Save</Button>";

		// hide the save button
		$("#type" + (i + 1) + typeString + "save").hide();

	}
}
function editClickSetTopBox(type, row) {
	for ( var i = 1; i < 9; i++) {
		$("#type" + i + "row" + row + type + "noedit").hide();
		text = $("#type" + i + "row" + row + type + "noedit").html();
		$("#typeinput" + i + "row" + row + type).val(text);
		$("#type" + i + "row" + row + type + "edit").show();
	}
	$("#type" + row + type + "edit").hide();
	$("#type" + row + type + "save").show();
}
function saveClickSetTopBox(type, row) {
	var allAreFilled = true;

	for ( var i = 1; i < 9; i++) {
		var temp = $("#typeinput" + i + "row" + row + type).val();
		if (temp.length < 1) {
			allAreFilled = false;
		}
	}
	for ( var i = 1; i < 9; i++) {
		var temp = $("#typeinput" + i + "row" + row + type).val();
		if (allAreFilled) {
			$("#type" + i + "row" + row + type + "noedit").html(temp);
			$("#typeinput" + i + "row" + row + type).val("");
		}
		$("#type" + i + "row" + row + type + "noedit").show();
		$("#type" + i + "row" + row + type + "edit").hide();
	}

	$("#type" + row + type + "save").hide();
	$("#type" + row + type + "edit").show();

}
function makeCellSetTopType(cellNum, rowNum, defaultValue, type) {
	return "<div id=\"type" + cellNum + "row" + rowNum + type + "noedit\">"
			+ defaultValue + "</div><div hidden=true id=\"type" + cellNum
			+ "row" + rowNum + type + "edit\"><input name=\"\" id=\"typeinput"
			+ cellNum + "row" + rowNum + type
			+ "\" cols=\"2\" rows=\"1\"></input></div>";
}


// used for dummy data between min and max parameters
function getRand(min, max) {
	return Math.floor(Math.random() * (max - min) + min);
}

// deletes all rows except the top one
function clearTableExceptHeader(table) {
	while (table.rows.length > 1) {
		table.deleteRow(1);
	}
}
