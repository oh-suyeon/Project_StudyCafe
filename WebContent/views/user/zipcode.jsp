<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>우편번호 검색 팝업창</title>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				console.log(data);
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('userZip').value = data.zonecode;
	            //document.getElementById("userAddr1").value = roadAddr;
	            document.getElementById("userAddr1").value = data.jibunAddress;
	            
/* 	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("sample4_extraAddress").value = '';
	            } */
	
	            var guideTextBox = document.getElementById("guide");
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                document.getElementById('userAddr1').value = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                document.getElementById('userAddr1').value = '(예상 지번 주소 : ' + expJibunAddr + ')';
	            } else {
	            	document.getElementById("userAddr1").value = roadAddr;
	            } 
	        }
	    }).open();
	}
</script>
</head>
<body>
<div class="form-group">
					<div>
						<label class="control-label col-sm-2" for="userZip">📪 우편번호:</label>
						<div class="col-sm-10 bottom5 form-inline">
							<input type="text" class="form-control" id="userZip"
								placeholder="우편번호를 검색하세요." name="userZip" readonly="readonly">
							<button type="button" class="btn btn-info" onclick="execDaumPostcode()">번호 검색</button>
							<span id="userZipSpan"></span>
						</div>
					</div>
					<div>
						<label class="control-label col-sm-2" for="userAddr1">✔ 주소:</label>
						<div class="col-sm-10 bottom5">
							<input  type="text" readonly="readonly" class="form-control" id="userAddr1" name="userAddr1">
						</div>
					</div>
					<div>
						<label class="control-label col-sm-2" for="userAddr2">✔ 상세주소:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userAddr2"
								placeholder="상세주소를 입력하세요." name="userAddr2">
						</div>
					</div>
				</div>
</body>
</html>