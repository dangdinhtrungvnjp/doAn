function validateform() {

	var password = document.myform.password.value;
	var email = document.myform.email.value;
	var count = 0;
	
	var reg_mail = /^[A-Za-z0-9]+([_\.\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\.\-]?[A-Za-z0-9]+)*(\.[A-Za-z]+)+$/;
	var specialChars = "<>!#$%^&*()_+[]{}?:;|'\"\\,/~`-=";
	var checkForSpecialChar = function(string) {
		for (i = 0; i < specialChars.length; i++) {
			if (string.indexOf(specialChars[i]) > -1) {
				return true;
			}
		}
		return false;
	}

	if (email == null || email == "") {
		document.getElementById("choInEmail").innerHTML = "email không được để trống";
		count++;
		email = '';// nếu rơi vào trường hợp sai thì không gửi đi dữ liệu đó
	} else if (checkForSpecialChar(email)) {
		document.getElementById("choInEmail").innerHTML = "vui lòng nhập mail không bao gồm kí tự đặc biệt";
		email = '';
	} 
//	else if (atposition < 1 || dotposition < (atposition + 2)
//			|| (dotposition + 2) >= x.length) {
//		email = '';
//		document.getElementById("choInEmail").innerHTML = "định dạng email chưa đúng";
//		count++;
//		
//	}
	else if(reg_mail.test(email) == false){
		email = '';
		document.getElementById("choInEmail").innerHTML = "định dạng email chưa đúng";
		count++;
	}
	
	else {
		document.getElementById("choInEmail").innerHTML = "";
		
	}

	if (password == null || password == "") {
		password = '';
		document.getElementById("choInPassword").innerHTML = "mật khẩu không được đê trống";
		count++;
	} else if (password.length < 8) {
		count++;
		document.getElementById("choInPassword").innerHTML = "vui lòng nhập mật khẩu trên 8 kí tự";
		password = '';
	} else {
		document.getElementById("choInPassword").innerHTML = "";
	}

//	if (email == null || email == "" || checkForSpecialChar(email)
//			|| atposition < 1 || dotposition < (atposition + 2)
//			|| (dotposition + 2) >= x.length || password == null
//			|| password == "" || password.length < 8) {
//		return false;
//	} else {
//		return true;
//	}
	if(password==''||email==''){
		return false;
	}

	 if(count>0){
		 return false;
	 }else{
		 return true;
	 }
}




