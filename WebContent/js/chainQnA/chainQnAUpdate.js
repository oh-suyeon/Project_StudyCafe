/**
 * 가맹 문의 등록하는 폼 js
 */
function save() {
	//제목 빈값 검사
	//이름 빈값 검사
	//아이디 비회원-readonly 회원(자동입력)
	//비밀번호 회원시 - readonly 처리
	//비밀번호 비회원시 빈값 검사
	//내용 빈값 검사
	//연락처 유효성 검사
	
	if(!validate()) {
		return;
	}
	if(!confirm("저장하시겠습니까?")) {
		alert("취소하셨습니다.");
		//cancel();
		return;
	}
	alert("완료되었습니다.");
	var fm = document.fm;
	fm.submit();
	
}

//빈값 검사
function checkValueEmpty(obj, strName) {
	var val = obj.val();
	
	if(val == null || val.length == 0 || val =="") {
		alert(strName + "을(를) 입력해주세요.");
		obj.focus();
		return true; //빈값이에요
	}
	return false; //빈값이 아니에요
}

//휴대폰 유효성 검사
function checkValuePhoneRegExp(obj, strName, regExp, strErr) {
	 var val = obj;
	 
	if(!val.match(regExp)) {
		alert(strErr);
		 return false; //정규식이 맞지 않아요
	 }
	return true; //정규식이 맞아요
}

//휴대폰 빈값 검사
function checkValuePhoneEmpty(hp1, hp2, hp3, strName) {
	var val1 = hp1.val();
	var val2 = hp2.val();
	var val3 = hp3.val();
	if(val1 == null || val1.length == 0 || val1 =="") {
		alert(strName + "을(를) 입력해야합니다.");
		hp1.focus();
		return true; //빈값이에요
	}
	if(val2 == null || val2.length == 0 || val2 =="") {
		alert(strName + "을(를) 입력해야합니다.");
		hp2.focus();
		return true; //빈값이에요
	}
	if(val3 == null || val3.length == 0 || val3 =="") {
		alert(strName + "을(를) 입력해야합니다.");
		hp3.focus();
		return true; //빈값이에요
	}
	return false; //빈값이 아니에요
}

//유효성 검사
function checkValueRegExp(obj, strName, regExp, strErr) {
	 var val = obj.val();
	 
	if(!val.match(regExp)) {
		alert(strErr);
		 obj.focus();
		 return false; //정규식이 맞지 않아요
	 }
	return true; //정규식이 맞아요
}

function validate() {
	var obj = $("#chainQnaTitle");
	if(checkValueEmpty(obj, "제목")) {
		return false;
	}
	obj = $("#writerName");
	if(checkValueEmpty(obj, "이름")) {
		return false;
	}
	if(!checkValueRegExp(obj, "이름", /^[가-힣]{2,5}$/ , "이름은 한글(2~5자)로 구성되어야 합니다.")){
		return false;
	}
	obj = $("#chainQnaContent");
	if(checkValueEmpty(obj, "내용")) {
		return false;
	}
	var hp1 = $("#chainQnaHp1");
	var hp2 = $("#chainQnaHp2");
	var hp3 = $("#chainQnaHp3");
	obj = $("#chainQnaHp1").val() + $("#chainQnaHp2").val() + $("#chainQnaHp3").val();
	if(checkValuePhoneEmpty(hp1, hp2, hp3, "연락처")) {
		return false;
	}
	if(!checkValuePhoneRegExp(obj, "연락처", /^(?:(010\d{4})|(01[1|[6-9]\d{3,4}))(\d{4})$/ , "연락처는 휴대폰 형식이어야합니다.")){
		return false;
	}
	return true;
}