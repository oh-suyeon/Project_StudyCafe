/**
 * 회원가입화면 JS
 */

//[중복검사] 버튼 클릭시 -ID 중복검사


function duplicateId() {
	//ajax

	//아이디 검사
	var obj = $("#userId");
	var objSpan = $("#userIdSpan");
	//입력 값 있는지 확인
	if(checkValueEmpty(obj,objSpan, "아이디")) {
		return;
	}
	//유효성 확인
	if(!checkValueRegExp(obj, objSpan, "아이디", /^[a-z0-9]{4,12}$/ , "아이디(4~12자)는 영문(소문자)으로 시작하며, 영문(소문자)와 숫자로만 구성되어야합니다.")){
		return;
	}
	
	chkOverlap(obj);
	
	$("#userName").focus();

}

/************************* <시작> 유효성 체크 부분(공통)********************************/

//유효성 검사
function checkValueRegExp(obj, objSpan, strName, regExp, strErr) {
	 var val = obj.val().trim();
	 
	if(!val.match(regExp)) {
		objSpan.addClass("text-warning");
		objSpan.text(strErr); 
		 obj.focus();
		 return false; //정규식이 맞지 않아요
	 }
	objSpan.text("");
	return true; //정규식이 맞아요
}

//빈값 검사
function checkValueEmpty(obj, objSpan, strName) {
	var val = obj.val().trim();
	
	if(val == null || val.length == 0 || val =="") {
		objSpan.addClass("text-warning");
		objSpan.text(strName + "을(를) 입력해주세요."); 
		obj.focus();
		return true; //빈값이에요
	}
	objSpan.text("");
	return false; //빈값이 아니에요
}

/*//길이 검사
function checkValueLength(obj, objSpan, strName, min, max) {
	var val = obj.val().trim();
	
	if(val.length < min || val.length > max) {
		objSpan.addClass("text-warning");
		objSpan.text(strName+ "은(는) " + min + "자 이상, " + max + "자 이하로 입력 가능합니다."); 
		obj.focus();
		return false; //길이가 안맞아요
	}
	objSpan.text("");
	return true; //길이가 맞아요
}*/
/************************* <끝> 유효성 체크 부분(공통)********************************/
/************************* <시작> 유효성 체크 부분(부분)********************************/
//생년월일 검사
function birthChk() {
	
	//입력한 생일 정보 가져오기
	var birYear = parseInt($("#userBirth").val().substr(0,4));
	var age = 20;
	
	var currYear = new Date().getFullYear();
	
	if((currYear - birYear) +1 < age) {
		//alert("미성년자의 경우 보호자 연락처를 필수로 입력해야 합니다.");
		$("#userBirthSpan").addClass("text-warning");
		$("#userBirthSpan").text("미성년자의 경우 보호자 연락처를 필수로 입력해야 합니다.");
		$("#userParentHp1").prop("readonly",false);
		$("#userParentHp2").prop("readonly",false);
		$("#userParentHp3").prop("readonly",false);
		return false;
	}	
	$("#userBirthSpan").text("");
	return true;
}

//휴대폰 유효성 검사
function checkValuePhoneRegExp(obj, objSpan, strName, regExp, strErr) {
	 var val = obj.trim();
	 
	if(!val.match(regExp)) {
		objSpan.addClass("text-warning");
		objSpan.text(strErr); 
		 return false; //정규식이 맞지 않아요
	 }
	objSpan.text("");
	return true; //정규식이 맞아요
}

//휴대폰 빈값 검사
function checkValuePhoneEmpty(hp1, hp2, hp3, objSpan, strName) {
	var val1 = hp1.val().trim();
	var val2 = hp2.val().trim();
	var val3 = hp3.val().trim();
	if(val1 == null || val1.length == 0 || val1 =="") {
		objSpan.addClass("text-warning");
		objSpan.text(strName + "을(를) 입력해야합니다."); 
		hp1.focus();
		return true; //빈값이에요
	}
	if(val2 == null || val2.length == 0 || val2 =="") {
		objSpan.addClass("text-warning");
		objSpan.text(strName + "을(를) 입력해야합니다."); 
		hp2.focus();
		return true; //빈값이에요
	}
	if(val3 == null || val3.length == 0 || val3 =="") {
		objSpan.addClass("text-warning");
		objSpan.text(strName + "을(를) 입력해야합니다."); 
		hp3.focus();
		return true; //빈값이에요
	}
	objSpan.text("");
	return false; //빈값이 아니에요
}
/************************* <끝> 유효성 체크 부분(부분)********************************/

//[저장] 버튼 클릭시 -회원정보 저장
function myInfoUpdate() {
	//ajax

	if(!validate()) {
		return;
	}
	if(!confirm("저장하시겠습니까?")) {
		alert("취소하셨습니다.");
		//cancel();
		return;
	}
	
	//회원등록후 메인화면 보여주기
	//$("#flag").val("C"); //form에 있는 hidden input까지 데이터로 감
	$.ajax ({
		url : "/myInfoUpdate.do"
		,type : "post"
		,data : $("#fm").serialize()
		,dataType : "json"
		,success : function(data) {
			// data = {resultCnt : 1}
			//저장 성공인 경우
			if(data.resultCnt == 1) {
				alert("저장되었습니다.");
				
				location.href = "http://localhost/views/main/main.jsp"; //목록화면으로				
			}else {
				alert("저장되지 않았습니다. 관리자에게 문의하세요.");
			}
		}
		,error : function(xhr) {
			console.log(xhr);
			alert("오류입니다. 관리자에게 문의하세요.");
		}
		
	});
	
}
//[저장] 버튼 클릭시 - 유효성 검사
function validate() {

	//이름 검사
	obj = $("#userName");
	objSpan = $("#userNameSpan");
	if(checkValueEmpty(obj, objSpan, "이름")) {
		return false;
	}
	if(!checkValueRegExp(obj, objSpan, "이름", /^[가-힣]{2,5}$/ , "이름은 한글(2~5자)로 구성되어야 합니다.")){
		return false;
	}

	hp1 = $("#userParentHp1");
	hp2 = $("#userParentHp2");
	hp3 = $("#userParentHp3");
	obj = hp1.val() + hp2.val() + hp3.val();
	objSpan = $("#userParentHpSpan");
	if(!birthChk()) { 
		//보호자 휴대폰 번호 검사
		if(checkValuePhoneEmpty(hp1, hp2, hp3, objSpan, "보호자 휴대폰번호")) {
			return false;
		}
		
		if(!checkValuePhoneRegExp(obj, objSpan, "보호자 휴대폰번호", /^(?:(010\d{4})|(01[1|[6-9]\d{3,4}))(\d{4})$/ , "휴대폰번호는 숫자만 포함된 휴대폰 형식이어야합니다.")){
			return false;
		}
	}else {
		hp1.prop("readonly",true);
		hp2.prop("readonly",true);
		hp3.prop("readonly",true);
		$("#userBirthSpan").text("");
		$("#userParentHpSpan").text("");
		$("#userParentHp1").val("");
		$("#userParentHp2").val("");
		$("#userParentHp3").val("");
	}
	
	//비밀번호 검사
	obj = $("#userPw");
	objSpan = $("#userPwSpan");
	if(checkValueEmpty(obj, objSpan, "비밀번호")) {
		return false;
	}
	if(!checkValueRegExp(obj, objSpan, "비밀번호", /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$/ , "비밀번호(8~20자)는 영문(소,대문자), 숫자, 특수문자가 반드시 포함되어야합니다.")){
		return false;
	}
	
	//비밀번호확인 검사
	obj = $("#userPwChk");
	objSpan = $("#userPwChkSpan");
	if(checkValueEmpty(obj, objSpan, "비밀번호")) {
		return false;
	}
	if($("#userPw").val().trim() != $("#userPwChk").val().trim()) {
		objSpan.text("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	//휴대폰 번호 검사
	var hp1 = $("#userHp1");
	var hp2 = $("#userHp2");
	var hp3 = $("#userHp3");
	obj = $("#userHp1").val() + $("#userHp2").val() + $("#userHp3").val();
	objSpan = $("#userHpSpan");
	if(checkValuePhoneEmpty(hp1, hp2, hp3, objSpan, "휴대폰번호")) {
		return false;
	}
	if(!checkValuePhoneRegExp(obj, objSpan, "휴대폰번호", /^(?:(010\d{4})|(01[1|[6-9]\d{3,4}))(\d{4})$/ , "휴대폰번호는 숫자만 포함된 휴대폰 형식이어야합니다.")){
		return false;
	}

	//이메일 검사
	obj = $("#userEmail");
	objSpan = $("#userEmailSpan");
	if(checkValueEmpty(obj, objSpan, "이메일")) {
		return false;
	}
	if(!checkValueRegExp(obj, objSpan, "이메일", /^[0-9a-zA-z]([-_.]?[0-9a-zA-z])*@[0-9a-zA-z]([-_.]?[0-9a-zA-Z])*\.[a-zA-z]{2,3}$/ , "이메일은 @를 포함된 이메일 형식이어야합니다.")){
		return false;
	}
	
	//우편번호 검사
	obj = $("#userZip");
	objSpan = $("#userZipSpan");
	if(checkValueEmpty(obj, objSpan, "우편번호")) {
		return false;
	}
	
	//주소 검사
	obj = $("#userAddr1");
	objSpan = $("#userZipSpan");
	if(checkValueEmpty(obj, objSpan, "주소")) {
		return false;
	}
	
/*	//상세주소 검사
	obj = $("#userAddr2");
	objSpan = $("#userZipSpan");
	if(checkValueEmpty(obj, objSpan, "상세주소")) {
		return false;
	}*/
	
	return true;
}

//[취소] 버튼 클릭시 -회원목록(이전)화면으로 돌아가기
function cancel() {
	//submit
	
	if(!confirm("취소하시겠습니까?")) {
		//cancel();
		return;
	}
	var fm = document.getElementById("fm");
	
	fm.method = "post"; 
	fm.action = "/views/main/main.jsp"; 
	fm.submit();
}

//[초기화] 버튼 클릭시 - 내용 다 사라지기
function resetFm() {
	
	if(!confirm("초기화하시겠습니까?")) {
		//cancel();
		return;
	}
	$("input").val("");
	$("span").text("");
}
