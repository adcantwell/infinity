var numBool=false;
var passBool=false;
var cpassBool=false;
var emailBool= false;
var adminbool = false;
var userbool =false;

function numCheck(x,y){
	var containsNum = /[0-9]/;
	var f = document.getElementById(x).value;
	if (f==""){
		document.getElementById(y).src="../images/redCross.png";
		numBool=false;
	}
	else if (!containsNum.test(f)){
		document.getElementById(y).src="../images/greenCheck.jpg";
		numBool=true;
	}
	else if(containsNum.test(f)){
		document.getElementById(y).src="../images/redCross.png";
		numBool=false;
	}
}

function emailCheck(y) {
	var x = document.getElementById("email").value;
	var atpos = x.indexOf("@");
	var dotpos = x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length || x=="") {
		document.getElementById(y).src="../images/redCross.png";
		emailBool=false;
	}else{
		document.getElementById(y).src="../images/greenCheck.jpg";
		emailBool=true;
	}
}

function adminCheck(y){
	var a=document.getElementById("adminid").value;
	if (isNaN(a) || a=="" || a<0){
		document.getElementById(y).src="../images/redCross.png";
		adminbool= false;
	}
	else{
		document.getElementById(y).src="../images/greenCheck.jpg";
		adminbool =true;
	}    	
}

function usernameCheck(y){
	var user = document.getElementById("username").value;
	if(/^[a-zA-Z0-9- ]*$/.test(user) == false || user==""){
		document.getElementById(y).src="../images/redCross.png";
		userbool= false;
		
	}else{
		document.getElementById(y).src="../images/greenCheck.jpg";
		userbool=true;
}
}

function passCheck(y){
	var containsNum = /[0-9]/;
	var containsCap = /[A-Z]/;
	var containsLow = /[a-z]/;
	var p = document.getElementById("password").value;
	if (containsNum.test(p) && containsCap.test(p) && containsLow.test(p) && p.length>=8 && p!="") {
		document.getElementById(y).src="../images/greenCheck.jpg";
		passBool=true;
	} else {
		document.getElementById(y).src="../images/redCross.png";
		passBool=false;
	}
}

function passConfirm(y){
	var p = document.getElementById("password").value;
	var cp = document.getElementById("cpassword").value;
	if (p == cp) {
		document.getElementById(y).src="../images/greenCheck.jpg";
		cpassBool=true;
	} else {
		document.getElementById(y).src="../images/redCross.png";
		cpassBool=false;
	}
}

function goBack() {
	window.history.back();
}

function validate() {
	if(numBool && passBool && cpassBool && adminbool && userbool){
		return true;
	}else{
		return false;
	}
	
}