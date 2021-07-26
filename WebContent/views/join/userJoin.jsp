<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="/js/join/userJoin.js?v=1"></script>
	<link rel="stylesheet" href="/css/join/userJoin.css">
</head>
<body>
	<div class="container">
		<h2 class="text-center">회원가입</h2>
		<br>
		<div>
			<form class="form-horizontal" id="fm">
				<div class="border5">
				<div class="form-group">
					<label class="control-label col-sm-2" for="userId">🔑 아이디:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="userId"
							placeholder="아이디를 입력하세요." name="userId">
						<button type="button" onclick="duplicateId()" class="btn btn-info" id="btnUserId">중복검사</button>
						<input type="hidden" name="idDuplication" id="idChk">
						<span id="userIdSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="userName">👤 이름:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="userName"
							placeholder="이름을 입력하세요." name="userName">
							<span id="userNameSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="userBirth">📆 생년월일:</label>
					<div class="col-sm-10 form-inline">
						<input type="date" class="form-control" id="userBirth" name="userBirth">
						<span id="userBirthSpan">미성년자의 경우 보호자 연락처를 필수로 입력해야 합니다.</span>
					</div>
				</div>
				 <div class="form-group">
					<label class="control-label col-sm-2" for="userParentHp1">📞 보호자 <br>휴대폰 번호:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="userParentHp1" name="userParentHp1" style="width: 80px;"
						placeholder="010" readonly="readonly" maxlength="3">
						<span>-</span>
						<input type="text" class="form-control" id="userParentHp2" name="userParentHp2" style="width: 80px;"
						placeholder="1234" readonly="readonly" maxlength="4">
						<span>-</span>
						<input type="text" class="form-control" id="userParentHp3" name="userParentHp3" style="width: 80px;"
						placeholder="5678" readonly="readonly" maxlength="4">
						<span id="userParentHpSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="userPw">🔐 비밀번호:</label>
					<div class="col-sm-10 form-inline">
						<input type="password" class="form-control" id="userPw"
							placeholder="비밀번호를 입력하세요." name="userPw">
							<span id="userPwSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="userPWChk">🔐 비밀번호 확인:</label>
					<div class="col-sm-10 form-inline">
						<input type="password" class="form-control" id="userPwChk"
							placeholder="비밀번호를 입력하세요." name="userPwChk">
							<span id="userPwChkSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="userHp1">📞 휴대폰 <br>번호:</label>
					<div class="col-sm-10 form-inline">
 					<input type="text" class="form-control" id="userHp1" name="userHp1" style="width: 80px;"
						placeholder="010" maxlength="3">
						<span>-</span>
						<input type="text" class="form-control" id="userHp2" name="userHp2" style="width: 80px;"
						placeholder="1234" maxlength="4">
						<span>-</span>
						<input type="text" class="form-control" id="userHp3" name="userHp3" style="width: 80px;"
						placeholder="5678" maxlength="4">
						<span id="userHpSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="userEmail">💌 이메일:</label>
					<div class="col-sm-10 form-inline">
						<input type="email" class="form-control" id="userEmail"
							placeholder="abcd123@email.com" name="userEmail">
							<span id="userEmailSpan"></span>
					</div>
				</div>
				<%@include file="zipcode.jsp" %>
				<div class="form-group lastRow ">
					<div class="btnDiv">
						<button type="button" class="btn btn-primary" onclick="save()">저장</button>
						<button type="button" class="btn btn-info" onclick="resetFm()">초기화</button>
						<button type="button" class="btn btn-info" onclick="cancel()">취소</button>
					</div>
				</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>