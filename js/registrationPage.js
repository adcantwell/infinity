$('#custRegister').validator().on('submit', function (e) {
	  if (e.isDefaultPrevented()) {
	    alert("FORM FAILED");
	  } else {
		  alert("FORM SUCCESS");
	  }
	});