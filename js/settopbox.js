/**
 * 
 */

function isDigit(char)
{
	return !isNaN(char);
};

function validPrice(string)
{
	var len = string.length;
	var dotFound = false;
	var order = 0;
	for(var i = 0;i<len;++i)
	{
		var char = string.charAt(i);
		if(dotFound && order==2)
		{
			//Contains thousandths and smaller increments
			return false;
		}
		if(char=='.'&&!dotFound)
		{
			//Find the dot, go to next digit
			dotFound = true;
			continue;
		}
		if(isDigit(char))
		{
			if(dotFound)
			{
				order++;
			}
		}
		else
		{
			//Contains non-digit that is not the period
			return false;
		}
	}
	return true;
}

function validPercentage(string)
{
	var len = string.length;
	var dotFound = false;
	var percentSignFound = false;
	for(var i = 0;i<len;++i)
	{
		var char = string.charAt(i);
		if(char=='.'&&!dotFound)
		{
			//Find the dot, go to next digit
			dotFound = true;
			continue;
		}
		if(char=='%'&&!percentSignFound)
		{
			//Find the dot, go to next digit
			percentSignFound = true;
			continue;
		}
		//Once the percent sign is found, no more chars
		if(percentSignFound)
		{
			return false;
		}
		//No periods other than decimal point, only the one %
		if(!isDigit(char))
		{
			return false;
		}
	}
	if(!percentSignFound)
	{
		return false;
	}
	return true;
}

function validLength(string)
{
	var num = parseFloat(string);
	if(isNaN(num)||num<0)
	{
		return false;
	}
	else
	{
		return true;
	}
}

function isInputEmpty(input, failureString) 
{ 
	if(input==null)
	{
	return "No such input ";
	}
    var mystring = input.value; 
    if(!mystring.match(/\S/)) 
    {
        return failureString;
    }
    return "";
}

function matchType()
{
	var type = document.getElementById("type");
	var echo = document.getElementById("typeEcho");
	var index = type.selectedIndex;
	echo.selectedIndex = index;
}

function matchTypeEcho()
{
	var type = document.getElementById("type");
	var echo = document.getElementById("typeEcho");
	var index = echo.selectedIndex;
	type.selectedIndex = index;
}

function validatePriceType(textarea, failureString)
{
	var val = textarea.value;
	if(validPrice(val))
	{
	return "";
	}
else
	{
	return failureString;
	}
}

function validatePercentageType(textarea, failureString)
{
	var val = textarea.value;
	if(validPercentage(val))
	{
	return "";
	}
else
	{
	return failureString;
	}
}

function validateLengthType(textarea, failureString)
{
	var val = textarea.value;
	if(validLength(val))
	{
	return "";
	}
else
	{
	return failureString;
	}
}

function validateInput()
{
	var price = document.getElementById("price");
	var installationCharges = 
		document.getElementById("installationCharges");
	var refundableDeposit = 
		document.getElementById("refundableDeposit");
	var billingTypes = document.getElementsByName("billingType");
	var upgradationCharges = 
		document.getElementById("upgradationCharge");
	var type = document.getElementById("type");
	var dishAssetId = document.getElementById("dishAssetId");
	var remoteControlAssetId = 
		document.getElementById("remoteControlAssetId");
	var macId = 
		document.getElementById("macId");
	var serialNumber = document.getElementById("serialNumber");
	var length = document.getElementById("length");
	var width = document.getElementById("width");
	var breadth = document.getElementById("breadth");
	var discount = document.getElementById("discount");
	var err = "";
	err += validatePrice(price);
	err += validateInstallationCharges(installationCharges);
	err += validateRefundableDeposit(
			refundableDeposit, billingTypes);
	err += validateUpgradationCharge(upgradationCharges, type);
	err += validateDishAssetId(dishAssetId);
	err += validateRemoteControlAssetId(remoteControlAssetId);
	err += validateMacId(macId);
	err += validateSerialNumber(serialNumber);
	err += validateLength(length);
	err += validateWidth(width);
	err += validateBreadth(breadth);
	err += validateBillingType(billingTypes);
	err += validateDiscount(discount);
	if(err.length>500)
		{
		alert("Please fill out your form.");
		return false;
		}
	else
		{
		if(err!="")
			{
		alert(err);
		return false;
			}
		}
	return true;
}

function validatePrice(price)
{
	var failEmpty = "Price is a mandatory field. ";
	var inputEmpty = isInputEmpty(price, failEmpty);
	if(inputEmpty!="")
		{
		return inputEmpty;
		}
	var failureString = 
		"Price must be be a non-negative number with " +
				"two or less decimal places ";
	return validatePriceType(price, failureString);
}

function validateInstallationCharges(installationCharges)
{
	var failEmpty = "Installation charges is a mandatory field. ";
	var inputEmpty = isInputEmpty(installationCharges, failEmpty);
	if(inputEmpty!="")
		{
		return inputEmpty;
		}
	var failureString = 
		"Installation charges must contain a " +
		"non-negative number with two or less decimal " +
		"places ";
	return validatePriceType(installationCharges, failureString);
}

function validateRefundableDeposit(refundableDeposit, billingTypes)
{
	var billingTypeStr = null;
	for(var i = 0;i<billingTypes.length;++i)
		{
		if(billingTypes[i]!=null && billingTypes[i].checked)
			{
			billingTypeStr = billingTypes[i].value;
			}
		}
	var failEmpty = "Refundable deposit is a mandatory field " +
			"for set top boxes that use a postpaid billing type. ";
	var inputEmpty = isInputEmpty(refundableDeposit, failEmpty);
	//Mandatory only when post type
	if(inputEmpty == failEmpty && billingTypeStr=="post")
	{
		return inputEmpty;
	}
	//For the case of a null element
	if(inputEmpty!=failEmpty && inputEmpty!="")
	{
	return inputEmpty;
	}
	var failureString = 
		"Refundable deposit must contain a " +
		"non-negative number with two or less decimal " +
		"places ";
	return validatePriceType(refundableDeposit, failureString);
}

function validateUpgradationCharge(upgradationCharge, type)
{
	var typeStr = type.value;
	var failEmpty = "Upgradation charge is a mandatory field. " +
			"for set top boxes of non-standard type ";
	var inputEmpty = isInputEmpty(upgradationCharge, failEmpty);
	//Upgradation charge is mandatory if type is not Standard
	if(inputEmpty==failEmpty && typeStr!="Standard")
		{
			return inputEmpty;
		}
	//In the case of a null
	if(inputEmpty!=failEmpty && inputEmpty!="")
		{
		return inputEmpty;
		}
	var failureString = 
		"Upgradation charge must contain a " +
		"non-negative number with two or less decimal " +
		"places ";
	return validatePriceType(upgradationCharge, failureString);
}

function validateDishAssetId(dishAssetId)
{
	var failEmpty = "Please enter your Dish Asset ID. ";
	var inputEmpty = isInputEmpty(dishAssetId, failEmpty);
	return inputEmpty;
}

function validateRemoteControlAssetId(remoteControlAssetId)
{
	var failEmpty = "Please enter your Remote Control Asset ID. ";
	var inputEmpty = isInputEmpty(
			remoteControlAssetId, failEmpty);
	return inputEmpty;
}

function validateMacId(macId)
{
	var failEmpty = "Please enter your MAC ID. ";
	var inputEmpty = isInputEmpty(macId, failEmpty);
	return inputEmpty;
}

function validateSerialNumber(serialNumber)
{
	var failEmpty = "Please enter your Serial Number. ";
	var inputEmpty = isInputEmpty(serialNumber, failEmpty);
	return inputEmpty;
}

function validateLength(length)
{
	var failEmpty = "Please enter the length of the box. ";
	var inputEmpty = isInputEmpty(length, failEmpty);
	if(inputEmpty!="")
		{
		return inputEmpty;
		}
	var failString = "Length must be a non-negative number. ";
	return validateLengthType(length, failString);
}

function validateBreadth(breadth)
{
	var failEmpty = "Please enter the breadth of the box. ";
	var inputEmpty = isInputEmpty(breadth, failEmpty);
	if(inputEmpty!="")
	{
	return inputEmpty;
	}
	var failString = "Breadth must be a non-negative number. ";
	return validateLengthType(breadth, failString);
}

function validateWidth(width)
{
	var failEmpty = "Please enter the width of the box. ";
	var inputEmpty = isInputEmpty(width, failEmpty);
	if(inputEmpty!="")
	{
	return inputEmpty;
	}
	var failString = "Width must be a non-negative number. ";
	return validateLengthType(width, failString);
}

function validateDiscount(discount)
{
	var failEmpty = "Please enter a discount value. ";
	var inputEmpty = isInputEmpty(discount, failEmpty);
	if(inputEmpty!="")
		{
	return inputEmpty;
		}
	var failString = "Discount must be a non-negative " +
			"number ending in a percent sign. ";
	if(discount.value.charAt(0)=='%')
		{
		return failString;
		}
	return validatePercentageType(discount, failString);
}

function validateBillingType(billingTypes)
{
	var noSelection = true;
	for(var i = 0; i<billingTypes.length; ++i)
	{
		if(billingTypes[i].checked)
			{
			noSelection = false;
			}
	}
	if(noSelection)
		{
		return "Please select a billing type. ";
		}
	return "";
}

function settopboxSubmit()
{
	var form = document.getElementById("settopboxform");
	var success = validateInput();
	if(success)
		{
			form.submit();
		}
}

function updateTypeFile(type, typeEcho, string)
{
	var good = false;
	if(string=="Standard")
		{
		good = true;
		type.value = "Standard";
		typeEcho.value = "Standard";
		}
	if(string=="HD")
	{
		good = true;
	type.value = "HD";
	typeEcho.value = "HD";
	}	
	if(string=="HD+")
	{
		good = true;
	type.value = "HD+";
	typeEcho.value = "HD+";
	}	
	if(string=="IPTV")
	{
		good = true;
	type.value = "IPTV";
	typeEcho.value = "IPTV";
	}
	if(!good)
		{
		alert("File upload: Setbox Type could not be processed!");
		}
}

function asyncReadCsv(reader)
{
	var dishAssetId = document.getElementById("dishAssetId");
	var remoteControlAssetId = 
		document.getElementById("remoteControlAssetId");
	var macId = 
		document.getElementById("macId");
	var serialNumber = document.getElementById("serialNumber");
	var type = document.getElementById("type");
	var echo = document.getElementById("typeEcho");
	var status = document.getElementById("status");
	if(reader.error!=null)
		{
		alert("Error produced by file-read");
		}
	var arr = reader.result.split(/[,]+/);
	//alert(arr.length());
	if(arr.length!=6)
		{
		alert("File is malformed!");
		}
	else
		{
		updateTypeFile(type, echo, arr[0]);
		serialNumber.value=arr[1];
		macId.value=arr[2];
		remoteControlAssetId.value=arr[3];
		dishAssetId.value=arr[4];
		status.value=arr[5];
		}
	//alert(arr[1].charAt(1));
	/*for(var i = 0; i<arr.length; ++i)
		{
		alert(arr[i]);
		}*/
}

//takes a csv of A, B, C, D, E, F
//where A= the string values of different types
//B=Serial
//C=MAC
//D=RC Asset
//E=Dish
//F=Status
function uploadFile()
{
	var fileInput = 
		document.getElementById("inventoryDetailsFile");
	var files = fileInput.files;
	var currentFile = null;
	if(files.length>0)
	{
		currentFile = files[0];
		var reader = new FileReader();
		try
		{
		reader.onloadend = function(){
			asyncReadCsv(reader);
		};
		reader.readAsText(currentFile);
		}
		catch(err)
		{
			alert(err);
		}
	}
}

function buttonAddFeature()
{
	//alert("e");
	var listedFeatures = document.getElementById("listedFeatures");
	var features = document.getElementById("features");
	var hidden = document.getElementById("featuresSubmitted");
	var hiddenStr = hidden.value;
	var failString = "Fail";
	failString = isInputEmpty(features, failString);
	if(failString=="Fail")
		{
		return;
		}
	var text = features.value;
	var option = document.createElement("option");
	option.value = text;
	option.text = text;
	listedFeatures.add(option);
	features.value = "";
	hiddenStr = hiddenStr + " " + text;
	hidden.value = hiddenStr;
};

function buttonClearFeatures()
{
	var hidden = document.getElementById("featuresSubmitted");
	var features = document.getElementById("features");
	var listedFeatures = document.getElementById("listedFeatures");
	hidden.value = "";
	features.value = "";
	//var i = listedFeatures.length;
	//alert(i);
	for(var i = listedFeatures.length-1; i>=0;i--)
		{
		listedFeatures.remove(i);
		}
}

//window.onload = 
	function test()
{
	alert("E");
	//var type = document.getElementById("type").value;
	//alert(type);
	//var a = document.getElementById("upgradationCharge").value;
	//alert(isInputEmpty(upgradationCharge,"Fail"));
	//var billingType = document.getElementsByName("billingType");
	//alert(billingType[0].value);
	//alert(billingType[1].value);
	//var discount = document.getElementById("discount");
	//discount.value="%";
	//var fileInput = 
	//	document.getElementById("inventoryDetailsFile");
	//fileInput.onchange= function(){
	//	alert("E");
	//};
	//validateInput();
};
