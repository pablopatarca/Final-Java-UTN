function validateNotEmpty(value){
	if(value == ''){
		return false;
	}else{
		return true;
	}
}

function validateEmail(value){
	var idx = value.indexOf('@');
	if(idx<0){
		return false;
	}else{
		return true;
	}
}

function validateNumeric(value){
	return !isNaN(value);
}

function validateDate(){


}

function validateYear(value){
	if(value<2013 && value>1900){
		return true;
	}else{
		return false;
	}
}

function validateMonth(value){
	if(value<13 && value>0){
		return true;
	}else{
		return false;
	}
}

function validateDay(value){
	if(value<32 && value>0){
		return true;
	}else{
		return false;
	}
}
