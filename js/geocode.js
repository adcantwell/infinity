$().ready(function() {
	$("#zip").keyup(function() {
		if ($("#zip").val().length == 5) {
			cityid = "#city";
			stateid = "#state";
			getCityAndStateFromZip($("#zip").val());
		}
	});

	$("#retzip").keyup(function() {
		if ($("#retzip").val().length == 5) {
			cityid = "#retcity";
			stateid = "#retstate";
			getCityAndStateFromRetZip($("#retzip").val());
		}
	});
	// document.getElementById("createDate").valueAsDate = new Date();
});
var cityid;
var stateid;
function getCityAndStateFromZip(zip) {
	var addressString = $("#zip").val();
	var urlString = "https://maps.googleapis.com/maps/api/geocode/json?address="
			+ addressString;
	httpGetAsync(urlString, parseAndShow);
}
function getCityAndStateFromRetZip(zip) {
	var addressString = $("#retzip").val();
	var urlString = "https://maps.googleapis.com/maps/api/geocode/json?address="
			+ addressString;
	httpGetAsync(urlString, parseAndShow);
}


function parseAndShow(str) {

	var obj = JSON.parse(str);
	var resultsArr = obj.results[0].address_components;
	console.log(cityid);
	var city, state;
	var inUS = true;
	if (obj.status == "OK") {
		for ( var i = 0; i < resultsArr.length; i++) {
			// parsing location data
			var arr = resultsArr[i];
			var typeArr = arr.types;

			// gets the city
			if (typeArr[0].toLowerCase() == "locality"
					|| typeArr[0].toLowerCase() == "neighborhood") {
				city = arr.long_name;
			}

			// gets the state
			if (typeArr[0].toLowerCase() == "administrative_area_level_1") {
				// the full name
				//state = arr.long_name;

				// the two letter abbreviation
				state = arr.short_name;
			}

			// if the address is outside the US flag it to display error message
			if (typeArr[0].toLowerCase() == "country") {
				if (arr.short_name != "US") {
					inUS = false;
					console.log(arr.long_name);
				}

			}
		}
		if (inUS) {
			$(cityid).val(city);
			$(stateid).val(state);
		}
		// Some graphical way of showing it was invalid
		else {

		}
	}
}

function httpGetAsync(theUrl, callback) {
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
			callback(xmlHttp.responseText);
	};
	xmlHttp.open("GET", theUrl, true); // true for asynchronous
	xmlHttp.send(null);
}