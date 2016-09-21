
function passCheck(pass){
		// Setting password variable
		var pswd = document.getElementById(pass).value;
		var errors = []; // Array of error messages

		// Validate letter
		if (!pswd.match(/[A-z]/)) {
			errors.push("Password must include letters!");
			console.log("Password must include letters!");
		}

		// Validate capital letter
		if (!pswd.match(/[A-Z]/)) {
			errors.push("Password must contain at least 1 capital letter!");
			console.log("Password must contain at least 1 capital letter!")
		}

		// Validate number (0-9)
		if (!pswd.match(/\d/) ) {
			errors.push("Password must contain at least 1 number!");
			console.log("Password must contain at least 1 capital letter!")
		}

		// Print error alert window
		if (errors.length > 0){
			var msg = "ERRORS:\n\n";
			for (var i=0; i < errors.length; i++){
				msg+=errors[i] + "\n";
			}
			alert(msg);
		}
}