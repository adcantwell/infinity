var payTypeSelected = false;
var stbTypeSelected = false;

function payClicked(){
	payTypeSelected = true;
	checkRefresh();
}
function stbClicked(){
	stbTypeSelected = true;
	checkRefresh();
}

function checkRefresh(){
	if(payTypeSelected && stbTypeSelected){	
		var tableHeaders = document.getElementById("hiddenTable");
		$("#hiddenTable").show();
		var table = document.getElementById("searchResultsTable");
		$("table").show();
		clearTable(table);
		//setupTable(table);
	}
}

function clearTable(table){
	while(table.rows.length > 1){
		table.deleteRow(1);
	}
}

function clearColumnsTable(table){
	for(var i = 0; i < table.rows.length; i++){
		table.rows.deleteRow(1);
	}
}

function setupTable(table){
		var numResults = 3;
		
		//for each result add row
		for(var i = 0; i < numResults; i++){
			var row = table.insertRow(i+1);
			var cellArray = new Array();
			for(var j = 0; j < table.rows[0].cells.length; j++){
				cellArray.push(row.insertCell(j));
			}
			cellArray[0].innerHTML = $('input[name=stbtype]:checked').val();
			cellArray[1].innerHTML = "Live Recording, Pause and Play, Child Lock";
			cellArray[2].innerHTML = "40cm x 10cm x 40cm";
			cellArray[3].innerHTML = "$500";
			cellArray[4].innerHTML = "$100";
			cellArray[5].innerHTML = "$0";
			cellArray[6].innerHTML = "10%";
			cellArray[7].innerHTML = $('input[name=paytype]:checked').val();
			cellArray[8].innerHTML = "$0";
			
			var cellButton = cellArray[cellArray.length - 1];
			cellButton.innerHTML = "<Button id=searchRow"+(i+1)+" onclick=addToCart(" + (i+1) + ") data-toggle=\"modal\" data-target=\"#purchaseBox\">Add</Button>";

		}
}

function removeDollar(string){
	return string.substring(1);
}
function removePercent(string){
	return string.substring(0,string.length-1);
}

function addToCart(rowNum){
	var table = document.getElementById("searchResultsTable");
	var thisRow = table.rows[rowNum];
	var price = parseFloat(removeDollar(thisRow.cells[3].innerHTML));
	var installCharge = parseFloat(removeDollar(thisRow.cells[4].innerHTML));
	var discount = parseFloat(removePercent(thisRow.cells[6].innerHTML));
	var deposit = parseFloat(removeDollar(thisRow.cells[8].innerHTML));
	console.log(price + " " + installCharge + " " + discount + " " + deposit);
	var pretax = (price + installCharge + deposit) * (100 - discount)/100.0;
	var tax = .12 * pretax;
	var total = pretax + tax;
	
	displayPurchase(thisRow, price, installCharge, discount, deposit, pretax, tax, total);
}

function displayPurchase(thisRow, price, installCharge, discount, deposit, pretax, tax, payable){
	var table = document.getElementById("searchResultsTable");
	var cartTable = document.getElementById("cartTable");
	
	var customerRow = cartTable.rows[0];
	var typeRow = cartTable.rows[1];
	var macIdRow = cartTable.rows[2];
	var serialNumberRow = cartTable.rows[3];
	var priceRow = cartTable.rows[4];
	var installChargeRow = cartTable.rows[5];
	var depositRow = cartTable.rows[6];
	var discountRow = cartTable.rows[7];
	var taxRow = cartTable.rows[8];
	var payableRow = cartTable.rows[9];
	
	customerRow.cells[1].innerHTML = "John Smith";
	typeRow.cells[1].innerHTML = thisRow.cells[7].innerHTML;
	macIdRow.cells[1].innerHTML = "78901";
	serialNumberRow.cells[1].innerHTML = "8675309";
	priceRow.cells[1].innerHTML = "$"+price;
	installChargeRow.cells[1].innerHTML = "$"+installCharge;
	depositRow.cells[1].innerHTML = "$"+deposit;
	discountRow.cells[1].innerHTML = discount+"%";
	taxRow.cells[1].innerHTML = "$"+tax;
	payableRow.cells[1].innerHTML = "$"+payable;
	
	
	console.log("hello");
	
	$(cartTable = document.getElementById("cartTableHeader")).show();
	$("#cartTable").show();
	
	
	
	
	
}

function passToModal(elem) {

	var myModal = $("#purchaseBox");

	// now get the values from the table
	var type = $(elem).closest("tr").find("td.type").html();
	document.getElementById("purchaseBox").setAttribute("value", type);
	
	// and set them in the modal:
	console.log($('.type', myModal).val(type));
	$('.type', myModal).val(type);

	// and finally show the modal
	myModal.modal({
		show : true
	});

}