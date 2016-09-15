/**
 * 
 */

function checkNew() {
	var check = window.confirm("Would you like to create another category?");
	return check;
	
}

function closeWindow() {
	
	document.getElementById("cat-form").submit();
	window.close();
}