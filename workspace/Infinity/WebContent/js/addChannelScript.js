function validateAddChannel(){
	var correctInfo = true;
    var name = document.forms["addChannel"]["name"].value;
      
    var band = document.forms["addChannel"]["band"].value;
    var bandRegex = /^band\s\d+$/;
    if (!bandRegex.test(band)){
    	correctInfo = false;
    	window.alert("Band should be in format 'band <number>'.");
    }
    
    var videoFreq = document.forms["addChannel"]["videoFreq"].value;
    if(videoFreq < 40 || videoFreq > 225){
    	correctInfo = false;
    	window.alert("Video Frequency should be in range 40 - 225");
    }
    var audioFreq = document.forms["addChannel"]["audioFreq"].value;
    if(audioFreq < 45 || audioFreq > 230){
    	correctInfo = false;
    	window.alert("Audio Frequency should be in range 45 - 230");
    }
       
    var channelChargeType = document.forms["addChannel"]["channelChargeType"].value;
    var channelTrans = document.forms["addChannel"]["channelTrans"].value;
    
    var charge = document.forms["addChannel"]["charge"].value;
    var chargeRegex = /^\d+[\.]{1}\d{2}$/;
    if (!chargeRegex.test(charge)){
    	correctInfo = false;
    	window.alert("Channel charge should have 2 decimal places.");
    }
    
    if (correctInfo == true){
    	window.alert("Channel added successfully!");
    	return true;
    }
}