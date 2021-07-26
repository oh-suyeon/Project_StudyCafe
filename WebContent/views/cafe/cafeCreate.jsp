<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>지점 등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="/js/cafe/cafeCreate.js"></script>
	<link rel="stylesheet" href="/css/join/userJoin.css">
</head>
<body>
	<div class="container">
		<h2 class="text-center">지점 등록</h2>
		<br>
		<div>
			<form class="form-horizontal" id="fmCafeCreate">
				<div class="border5">
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerId">지점주 아이디:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="ownerId"
							placeholder="아이디를 선택하세요." readonly="readonly" name="ownerId">
						<button type="button" class="btn" onclick="openOwnerIdPopup()">찾기</button>
						<span id="ownerIdSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeName">지점명:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="cafeName"
							placeholder="이름을 입력하세요." name="cafeName">
							<span id="cafeNameSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeHp1">지점 <br>전화번호:</label>
					<div class="col-sm-10 form-inline">
 					<input type="text" class="form-control" id="cafeHp1" name="cafeHp1" style="width: 80px;"
						placeholder="010" maxlength="3">
						<input type="text" class="form-control" id="cafeHp2" name="cafeHp2" style="width: 80px;"
						placeholder="1234" maxlength="4">
						<input type="text" class="form-control" id="cafeHp3" name="cafeHp3" style="width: 80px;"
						placeholder="5678" maxlength="4">
						<span id="cafeHpSpan"></span>
					</div>
				</div>
				<%@include file="zipcode.jsp" %>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeRunCode">운영상태코드:</label>
					<div class="col-sm-10 form-inline">
						<select id="cafeRunCode" name="cafeRunCode" class="form-control">
							<option value="NO">--선택--</option>
							<option value="01">오픈 예정</option>
							<option value="02">영업 중</option>
							<option value="03">영업 중지</option>
						</select>
						<span id="cafeRunCodeSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeRegionCode">지역코드명:</label>
					<div class="col-sm-10 form-inline">
						<select id="cafeRegionCode" name="cafeRegionCode" class="form-control">
							<option value="NO">--선택--</option>
							<option value="01">서울특별시</option>
							<option value="02">인천광역시</option>
							<option value="03">대전광역시</option>
							<option value="04">울산광역시</option>
							<option value="05">대구광역시</option>
							<option value="06">부산광역시</option>
							<option value="07">광주광역시</option>
							<option value="08">세종특별자치시</option>
							<option value="09">경기도</option>
							<option value="10">강원도</option>
							<option value="11">충청북도</option>
							<option value="12">충청남도</option>
							<option value="13">경상북도</option>
							<option value="14">경상남도</option>
							<option value="15">전라북도</option>
							<option value="16">전라남도</option>
							<option value="17">제주도</option>
						</select>
						<span id="cafeRegionCodeSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeXPosition">X좌표:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="cafeXPosition"
							placeholder="X좌표값을 입력하세요." name="cafeXPosition">
							<span id="cafeXPositionSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeYPosition">Y좌표:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="cafeYPosition"
							placeholder="Y좌표값을 입력하세요." name="cafeYPosition">
							<span id="cafeYPositionSpan"></span>
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
	
	<!-- Modal 시작-->
	<div class="modal fade" id="ownerIdModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">지점주 아이디 찾기</h4>
				</div>
				<div class="modal-body">
					<table id="tbOwnerId" class="table table-hover">
						<colgroup>
							<col style="width: 100px;">
							<col style="width: auto;">
						</colgroup>
						<thead>
							<tr>
								<td>지점주 아이디</td>
								<td>지점주 이름</td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>
	<!-- Modal 종료-->
</body>
</html>