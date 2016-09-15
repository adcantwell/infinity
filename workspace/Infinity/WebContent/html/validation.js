//Registration Page Validation (registrationPage.html)
function validateEmail(){
	
	var boolAlert = true;
	var email = document.getElementById("email").valueOf();
	var atSymLoc = email.indexOf("@");
	var dotSymLoc = email.indexOf(".");
	
	if (atSymLoc < 1 || dotSymLoc < atSymLoc+2 || dotSymLoc+2 >= email.length){
		alert("Invalid Email Address!");
		boolAlert = false;
	}
	
	return boolAlert;
	
}

// Login & Registration Page Name validation (Use for both first and last name entry)
function validateName(name){
	
	var length = name.length;
	
	if (length > 20){
		window.alert("Name cannot exceed 20 characters")
	}
	else if (length < 2){
		window.alert("Name must be at least 2 characters")
	}
}




