<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="/css/join/userJoin.css">
</head>
<body>
	<div class="container">
		<h2 class="text-center">지점주 계정 등록</h2>
		<br>
		<div>
			<form class="form-horizontal" id="fm">
				<div class="border5">
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerId">아이디:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="ownerId"
							placeholder="아이디를 입력하세요." name="ownerId">
						<button type="button" onclick="duplicateId()" class="btn btn-info" id="btnownerId">중복검사</button>
						<input type="hidden" name="idDuplication" id="idChk">
						<span id="ownerIdSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerName">이름:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="ownerName"
							placeholder="이름을 입력하세요." name="ownerName">
							<span id="ownerNameSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerPw">비밀번호:</label>
					<div class="col-sm-10 form-inline">
						<input type="password" class="form-control" id="ownerPw"
							placeholder="비밀번호를 입력하세요." name="ownerPw">
							<span id="ownerPwSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerPWChk">비밀번호 확인:</label>
					<div class="col-sm-10 form-inline">
						<input type="password" class="form-control" id="ownerPwChk"
							placeholder="비밀번호를 입력하세요." name="ownerPwChk">
							<span id="ownerPwChkSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerHp1">휴대폰 <br>번호:</label>
					<div class="col-sm-10 form-inline">
 					<input type="text" class="form-control" id="ownerHp1" name="ownerHp1" style="width: 80px;"
						placeholder="010" maxlength="3">
						<span>-</span>
						<input type="text" class="form-control" id="ownerHp2" name="ownerHp2" style="width: 80px;"
						placeholder="1234" maxlength="4">
						<span>-</span>
						<input type="text" class="form-control" id="ownerHp3" name="ownerHp3" style="width: 80px;"
						placeholder="5678" maxlength="4">
						<span id="ownerHpSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerEmail">이메일:</label>
					<div class="col-sm-10 form-inline">
						<input type="email" class="form-control" id="ownerEmail"
							placeholder="abcd123@email.com" name="ownerEmail">
							<span id="ownerEmailSpan"></span>
					</div>
				</div>
				<%@include file="zipcode.jsp" %>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerBirth">생년월일:</label>
					<div class="col-sm-10 form-inline">
						<input type="date" class="form-control" id="ownerBirth" name="ownerBirth">
						<span id="ownerBirthSpan"></span>
					</div>
				</div>
				<div class="form-group lastRow ">
					<div class="btnDiv">
						<button type="button" class="btn btn-primary" onclick="save()">저장</button>
						<button type="button" class="btn btn-info" onclick="resetFm()">초기화</button>
						<button type="button" class="btn btn-info" onclick="cancel()">취소</button>
					</div>
				</div>
<!-- 				<input type="hidden" name="flag" id="flag"> -->
				</div>
			</form>
		</div>
	</div>
</body>
</html>