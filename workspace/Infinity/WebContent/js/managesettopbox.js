$(document).ready(function() {
	populate("standard");
});
function populate(type) {

	var typeString = type.toLowerCase() + "";
	var currentTable = document.getElementById(typeString + "Table");
	clearTableExceptHeader(currentTable);
	var numResults = getRand(10, 20);

	// for each result add row
	for ( var i = 0; i < numResults; i++) {
		// create new row in the table of the correct width
		var row = currentTable.insertRow(i + 1);
		row.id = "tr" + (i + 1) + typeString;
		var cellArray = new Array();
		for ( var j = 0; j < currentTable.rows[0].cells.length; j++) {
			cellArray.push(row.insertCell(j));
		}

		// fill in with dummy data
		cellArray[0].innerHTML = type;
		cellArray[1].innerHTML = makeCell(1, i + 1, getRand(0, 1000000),
				typeString);
		;
		cellArray[2].innerHTML = makeCell(2, i + 1, getRand(0, 1000),
				typeString);
		cellArray[3].innerHTML = makeCell(3, i + 1, getRand(100, 600),
				typeString);
		cellArray[4].innerHTML = makeCell(4, i + 1, getRand(100, 600),
				typeString);
		;
		cellArray[5].innerHTML = "Unassigned";

		// create onclick function calls for the buttons
		var editFunctionName = "editClick(\'" + typeString + "\'," + (i + 1)
				+ ")";
		var saveFunctionName = "saveClick(\'" + typeString + "\'," + (i + 1)
				+ ")";
		cellArray[6].innerHTML = "<Button class=\"btn btn-primary\" id=\""
				+ (i + 1) + typeString + "edit\" onclick=\"" + editFunctionName
				+ "\">Edit</Button>";
		cellArray[6].innerHTML += "<Button class=\"btn btn-success\" id=\""
				+ (i + 1) + typeString + "save\" onclick=\"" + saveFunctionName
				+ "\">Save</Button>";

		// hide the save button
		$("#" + (i + 1) + typeString + "save").hide();

		// similar to above but with delete
		var deleteFunctionName = "deleteClick(\'" + typeString + "\',"
				+ (i + 1) + ")";
		cellArray[7].innerHTML = "<Button class=\"btn btn-danger\" onclick=\""
				+ deleteFunctionName + "\">Delete</Button>";

	}
}

// creates cell with correct id for type row and cell with editable and
// non-editable fields
function makeCell(cellNum, rowNum, defaultValue, type) {
	return "<div id=\"" + cellNum + "row" + rowNum + type + "noedit\">"
			+ defaultValue + "</div><div hidden=true id=\"" + cellNum + "row"
			+ rowNum + type + "edit\"><input name=\"\" id=\"input"
			+ cellNum + "row" + rowNum + type
			+ "\" cols=\"6\" rows=\"1\"></input></div>";
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
// shows the editable text fields and shows the save button
function editClick(type, row) {
	for ( var i = 1; i < 5; i++) {
		$("#" + i + "row" + row + type + "noedit").hide();
		$("#" + i + "row" + row + type + "edit").show();
	}
	$("#" + row + type + "edit").hide();
	$("#" + row + type + "save").show();
}

// saves the editable text fields and shows the edit button and non-editable
// textfields
function saveClick(type, row) {
	var allAreFilled = true;

	for ( var i = 1; i < 5; i++) {
		var temp = $("#input" + i + "row" + row + type).val();
		if (temp.length < 1) {
			allAreFilled = false;
		}
	}
	for ( var i = 1; i < 5; i++) {
		var temp = $("#input" + i + "row" + row + type).val();
		if (allAreFilled) {
			$("#" + i + "row" + row + type + "noedit").html(temp);
			$("#input" + i + "row" + row + type).val("");
		}
		$("#" + i + "row" + row + type + "noedit").show();
		$("#" + i + "row" + row + type + "edit").hide();
	}

	$("#" + row + type + "save").hide();
	$("#" + row + type + "edit").show();

}

// Only hides for now. when deleting for real, leave the hide then delete from
// the database? maybe delete on confirm?
function deleteClick(type, row) {
	$("#tr" + row + type).hide();
}
