/**
 * 
 */
function checkAll() {
	var works=checkName();
	var worksC = checkCost();
	var worksCN = checkCName();
	var test = works && worksC && worksCN;
	return test;
}

function checkName() {
	var ret = true;
	var name = document.getElementById("pack-name").value;
	var length = name.length;
	if (length>20) {
	window.alert("Name cannot exceed 20 characters");
	ret= false;
	}
	var reg = new RegExp(/[^a-zA-Z\s]/);
	var num =reg.test(name); 
	if (num) {
	 window.alert("Name cannot contain special characters");
	 ret= false;
	}
	return ret;
}
 

function checkCost() {
	var ret = true;
	var cost = document.getElementById("pack-cost").value;
	ret = innerCheck(cost);
	return ret;
}
function innerCheck(cost) {
	var retI = true;
	var costReg = /^\d+[\.]{1}\d{2}$/;
	var test = costReg.test(cost);
	if (!test) {
		window.alert("Cost must have exactly two decimal places");
		retI=false;
	}
	return retI;
}
function checkCName() {
	var ret = true;
	var name = document.getElementById("pack-channel").value;
	var length = name.length;
	if (length>20) {
	window.alert("Channel name cannot exceed 20 characters");
	ret= false;
	}
	var reg = new RegExp(/[^a-z]A-Z\s/);
	var num =reg.test(name); 
	if (num) {
	 window.alert("Name cannot contain special characters");
	 ret= false;
	}
	return ret;
}

function setDate(){

var now = new Date();

var day = ("0" + now.getDate()).slice(-2);
var month = ("0" + (now.getMonth() + 1)).slice(-2);

var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    
document.getElementById("startDate").value = today;
document.getElementById("startDate").min = today;

var tomorrow = ("0" + (now.getDate()+1)).slice(-2);
tomorrow = now.getFullYear()+"-"+(month)+"-"+(tomorrow);

document.getElementById("endDate").value = tomorrow;
document.getElementById("endDate").min = tomorrow;

}


function openAddCat() {
	 var AddCat =window.open('AddCategory.html','Add_Cat',
			'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=400,height=300,left = 312,top = 234');
	
}