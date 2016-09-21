$('#registrationForm').validator().on('submit', function (e) {
  if (e.isDefaultPrevented()) {
    console.log("FORM FAILED");
  } else {
	  console.log("FORM SUCCESS");
	  window.location.href='logIn.jsp';
  }
});