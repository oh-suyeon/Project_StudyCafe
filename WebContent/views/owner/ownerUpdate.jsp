<%@page import="daily.owner.vo.OwnerCafeInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	OwnerCafeInfoVO ownerVO = (OwnerCafeInfoVO)request.getAttribute("ownerVO");
	
	String ownerHp = ownerVO.getOwnerHp();
	String hp1 = ownerHp.substring(0, 3);
	String hp2 = ownerHp.substring(3, 7);
	String hp3 = ownerHp.substring(7);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>지점주 계정 등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="/js/owner/ownerCreate.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="/css/join/userJoin.css">
	<script type="text/javascript">
		function update(){
			var fm = document.getElementById("fmOwnerUpdate");
			fm.action = "/ownerUpdate.do";
			fm.method = "post";
			fm.submit();
		}
	
		function cancel(){
			history.back();
		}
	
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
		            document.getElementById('ownerZip').value = data.zonecode;
//	 	            document.getElementById("ownerAddr1").value = roadAddr;
		            document.getElementById("ownerAddr1").value = data.jibunAddress;
		        }
		    }).open();
		}
	</script>
</head>
<body>
	<div class="container">
		<h2 class="text-center">지점주 계정 수정</h2>
		<br>
		<div>
			<form class="form-horizontal" id="fmOwnerUpdate">
				<div class="border5">
					<div class="form-group">
						<label class="control-label col-sm-2" for="ownerId">아이디:</label>
						<div class="col-sm-10 form-inline">
							<input type="text" class="form-control" id="ownerId" name="ownerId"
								placeholder="아이디를 입력하세요." readonly="readonly" value="<%=ownerVO.getOwnerId() %>">
							<span id="ownerIdSpan"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="ownerName">이름:</label>
						<div class="col-sm-10 form-inline">
							<input type="text" class="form-control" id="ownerName" name="ownerName"
								placeholder="이름을 입력하세요." readonly="readonly" value="<%=ownerVO.getOwnerName() %>">
								<span id="ownerNameSpan"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="ownerPw">비밀번호:</label>
						<div class="col-sm-10 form-inline">
							<input type="text" class="form-control" id="ownerPw" name="ownerPw"
								placeholder="비밀번호를 입력하세요." value="<%=ownerVO.getOwnerPw() %>">
								<span id="ownerPwSpan"></span>
						</div>
					</div>
	<!-- 				<div class="form-group"> -->
	<!-- 					<label class="control-label col-sm-2" for="ownerPWChk">비밀번호 확인:</label> -->
	<!-- 					<div class="col-sm-10 form-inline"> -->
	<!-- 						<input type="password" class="form-control" id="ownerPwChk" -->
	<!-- 							placeholder="비밀번호를 입력하세요." name="ownerPwChk"> -->
	<!-- 							<span id="ownerPwChkSpan"></span> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="ownerHp1">휴대폰 <br>번호:</label>
						<div class="col-sm-10 form-inline">
	 					<input type="text" class="form-control" id="ownerHp1" name="ownerHp1" style="width: 80px;"
							placeholder="010" maxlength="3" value="<%=hp1 %>">
							<span>-</span>
							<input type="text" class="form-control" id="ownerHp2" name="ownerHp2" style="width: 80px;"
							placeholder="1234" maxlength="4" value="<%=hp2 %>">
							<span>-</span>
							<input type="text" class="form-control" id="ownerHp3" name="ownerHp3" style="width: 80px;"
							placeholder="5678" maxlength="4" value="<%=hp3 %>">
							<span id="ownerHpSpan"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="ownerEmail">이메일:</label>
						<div class="col-sm-10 form-inline">
							<input type="email" class="form-control" id="ownerEmail"
								placeholder="abcd123@email.com" name="ownerEmail" value="<%=ownerVO.getOwnerEmail() %>">
								<span id="ownerEmailSpan"></span>
						</div>
					</div>
					<div class="form-group">
						<div>
							<label class="control-label col-sm-2" for="ownerZip">우편번호:</label>
							<div class="col-sm-10 bottom5 form-inline">
								<input type="text" class="form-control" id="ownerZip"
									placeholder="우편번호를 검색하세요." name="ownerZip" readonly="readonly" value="<%=ownerVO.getOwnerZip() %>">
								<button type="button" class="btn btn-info" onclick="execDaumPostcode()">번호 검색</button>
								<span id="ownerZipSpan"></span>
							</div>
						</div>
						<div>
							<label class="control-label col-sm-2" for="ownerAddr1">주소:</label>
							<div class="col-sm-10 bottom5">
								<input  type="text" readonly="readonly" class="form-control" id="ownerAddr1" 
									name="ownerAddr1" value="<%=ownerVO.getOwnerAddr1() %>">
							</div>
						</div>
						<div>
							<label class="control-label col-sm-2" for="ownerAddr2">상세주소:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="ownerAddr2"
									placeholder="상세주소를 입력하세요." name="ownerAddr2" value="<%=ownerVO.getOwnerAddr2() %>">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="ownerBirth">생년월일:</label>
						<div class="col-sm-10 form-inline">
							<input type="date" class="form-control" id="ownerBirth" name="ownerBirth" value="<%=ownerVO.getOwnerBirth() %>">
							<span id="ownerBirthSpan"></span>
						</div>
					</div>
<!-- 				<input type="hidden" name="flag" id="flag"> -->
				</div>
			</form>
			<div class="form-group lastRow ">
				<div class="btnDiv">
					<button type="button" class="btn btn-primary" onclick="update()">수정저장</button>
					<button type="button" class="btn btn-info" onclick="cancel()">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>