/**
 * 지점 등록 유효성
 */

// 지점주 아이디 선택 모달 시작 ****************************************************
function openOwnerIdPopup(){
	
	$.ajax({
		url: "/cafeOwnerList.do"
		,type: "get"
		,dataType: "json"
		,success: function(data){
			
//			console.log(data);
			var strHtml = "";
			
			if(data.length > 0){
				
				for(var i=0; i<data.length; i++){
					var obj = data[i];
					
					strHtml += "<tr>"
							+ "<td>" + obj.ownerId + "</td>"
							+ "<td>" + obj.ownerName + "</td>"
							+ "</tr>";
				}
				
			}else{
				strHtml += "<tr>"
					+ "<td colspan=\"2\">검색된 결과가 없습니다.</td>"
					+ "</tr>";
			}
			
			$("#tbOwnerId tbody").html(strHtml);
		} 
		,error: function(xhr){
			console.log(xhr);
			alert("오류발생");
		}
	});
	
	$("#ownerIdModal").modal();
}

$(document).ready(function(){
	$("#tbOwnerId").on('dblclick', 'tbody tr', function(){
		var ownerId = $($(this).children()[0]).text();
		var ownerName = $($(this).children()[1]).text();
		
		$("#ownerId").val(ownerId);
		$("#ownerName").val(ownerName);
		
		$("#ownerIdModal").modal('hide');
	});
	
});
//지점주 아이디 선택 모달 끝 ****************************************************


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
/************************* <끝> 유효성 체크 부분(공통)********************************/

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

/************************* <시작> 유효성 체크 부분(부분)********************************/

/************************* <끝> 유효성 체크 부분(부분)********************************/

//[저장] 버튼 클릭시 -회원정보 저장
function save() {
	//ajax

	if(!validate()) {
		return;
	}
	if(!confirm("저장하시겠습니까?")) {
		return;
	}
	
	var fm = document.getElementById("fmCafeCreate");
	fm.action = "/cafeCreate.do";
	fm.method = "post";
	fm.submit();
	
}

//[저장] 버튼 클릭시 - 유효성 검사
function validate() {
	//지점주 아이디 검사
	var obj = $("#ownerId");
	var objSpan = $("#ownerIdSpan");
	if(checkValueEmpty(obj,objSpan, "아이디")) {
		return false;
	}
	
	//카페 지점명 검사
	obj = $("#cafeName");
	objSpan = $("#cafeNameSpan");
	if(checkValueEmpty(obj, objSpan, "이름")) {
		return false;
	}
	if(!checkValueRegExp(obj, objSpan, "이름", /^[가-힣]{2,10}$/ , "이름은 한글(2~10자)로 구성되어야 합니다.")){
		return false;
	}
	
	//지점 전화번호 검사
	var hp1 = $("#cafeHp1");
	var hp2 = $("#cafeHp2");
	var hp3 = $("#cafeHp3");
	obj = $("#cafeHp1").val() + $("#cafeHp2").val() + $("#cafeHp3").val();
	objSpan = $("#cafeHpSpan");
	if(checkValuePhoneEmpty(hp1, hp2, hp3, objSpan, "지점 전화번호")) {
		return false;
	}
	if(!checkValuePhoneRegExp(obj, objSpan, "지점 전화번호", /^(?:(010\d{4})|(01[1|[6-9]\d{3,4}))(\d{4})$/ , "휴대폰번호는 숫자만 포함된 휴대폰 형식이어야합니다.")){
		return false;
	}

	//우편번호 검사
	obj = $("#cafeZip");
	objSpan = $("#cafeZipSpan");
	if(checkValueEmpty(obj, objSpan, "우편번호")) {
		return false;
	}
	
	//주소 검사
	obj = $("#cafeAddr1");
	objSpan = $("#cafeZipSpan");
	if(checkValueEmpty(obj, objSpan, "주소")) {
		return false;
	}
	
/*	//상세주소 검사
	obj = $("#cafeAddr2");
	objSpan = $("#cafeZipSpan");
	if(checkValueEmpty(obj, objSpan, "상세주소")) {
		return false;
	}*/
	
	// 운영상태 코드
	var cafeRunVal = $("#cafeRunCode option:selected").val();
	console.log(cafeRunVal);
	obj = $("#cafeRunCode");
	objSpan = $("#cafeRunCodeSpan");
	if("NO" == cafeRunVal) {
		objSpan.addClass("text-warning");
		objSpan.text("운영상태를 선택해주세요."); 
		obj.focus();
		return false;
	}

	// 지역 코드
	var cafeRegionVal = $("#cafeRegionCode option:selected").val();
	console.log(cafeRegionVal);
	obj = $("#cafeRegionCode");
	objSpan = $("#cafeRegionCodeSpan");
	if("NO"== cafeRegionVal) {
		objSpan.addClass("text-warning");
		objSpan.text("지역코드명을 선택해주세요."); 
		obj.focus();
		return false;
	}
	
	//X좌표 검사
	var obj = $("#cafeXPosition");
	var objSpan = $("#cafeXPositionSpan");
	if(checkValueEmpty(obj,objSpan, "X좌표")) {
		return false;
	}
	
	//Y좌표 검사
	var obj = $("#cafeYPosition");
	var objSpan = $("#cafeYPositionSpan");
	if(checkValueEmpty(obj,objSpan, "Y좌표")) {
		return false;
	}
	
	return true;
}

//[취소] 버튼 클릭시 -회원목록(이전)화면으로 돌아가기
function cancel() {
	//submit
	
//	if(!confirm("취소하시겠습니까?")) {
//		//cancel();
//		return;
//	}
	var fm = document.getElementById("fmCafeCreate");
	
	fm.method = "post"; 
	fm.action = "/cafeManage.do"; 
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
