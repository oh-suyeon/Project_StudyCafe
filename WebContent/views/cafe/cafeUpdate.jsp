<%@page import="daily.cafe.vo.CafeRegionNameVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	CafeRegionNameVO cafeVO = (CafeRegionNameVO) request.getAttribute("cafeVO");	

	String cafeTel = cafeVO.getCafeTel();
	String tel1 = cafeTel.substring(0, 3);
	String tel2 = cafeTel.substring(3, 7);
	String tel3 = cafeTel.substring(7);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>지점 등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/js/cafe/cafeCreate.js"></script>
	<link rel="stylesheet" href="/css/join/userJoin.css">
	<script type="text/javascript">
		$(document).ready(function(){
			var cafeRunCode = '<%=cafeVO.getCafeRunCode() %>';
			var cafeRegionCode = '<%=cafeVO.getCafeRegionCode() %>';
			
			var a = $('#cafeRunCode [value="' + cafeRunCode +'"]').prop('selected', true);
			var b= $('#cafeRegionCode [value="' + cafeRunCode +'"]').prop('selected', true);

		});
	
		function update(){
			var fm = document.getElementById("fmCafeUpdate");
			fm.action = "/cafeUpdate.do";
			fm.method = "post";
			fm.submit();
		}
	
		function cancel2(){
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
		            document.getElementById('cafeZip').value = data.zonecode;
	 	            document.getElementById("cafeAddr1").value = roadAddr;
		            document.getElementById("cafeAddr1").value = data.jibunAddress;
		        }
		    }).open();
		}
	</script>
</head>
<body>
	<div class="container">
		<h2 class="text-center">지점 수정</h2>
		<br>
		<div>
			<form class="form-horizontal" id="fmCafeUpdate">
				<div class="border5">
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeNo">지점번호:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="cafeNo" value="<%=cafeVO.getCafeNo() %>"
							readonly="readonly" name="cafeNo">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerId">지점주 아이디:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="ownerId" value="<%=cafeVO.getOwnerId() %>"
							readonly="readonly" name="ownerId">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeName">지점명:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="cafeName" value="<%=cafeVO.getCafeName() %>"
							placeholder="이름을 입력하세요." name="cafeName">
							<span id="cafeNameSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeHp1">지점 <br>전화번호:</label>
					<div class="col-sm-10 form-inline">
 					<input type="text" class="form-control" id="cafeHp1" name="cafeHp1" style="width: 80px;"
						placeholder="010" maxlength="3" value="<%=tel1 %>">
						<input type="text" class="form-control" id="cafeHp2" name="cafeHp2" style="width: 80px;"
						placeholder="1234" maxlength="4" value="<%=tel2 %>">
						<input type="text" class="form-control" id="cafeHp3" name="cafeHp3" style="width: 80px;"
						placeholder="5678" maxlength="4" value="<%=tel3 %>">
						<span id="cafeHpSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeZip">우편번호:</label>
					<div class="col-sm-10 bottom5 form-inline">
						<input type="text" class="form-control" id="cafeZip" value="<%=cafeVO.getCafeZip() %>"
							placeholder="우편번호를 검색하세요." name="cafeZip" readonly="readonly">
						<button type="button" class="btn btn-info" onclick="execDaumPostcode()">번호 검색</button>
						<span id="cafeZipSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeAddr1">주소:</label>
					<div class="col-sm-10 bottom5">
						<input  type="text" readonly="readonly" class="form-control" value="<%=cafeVO.getCafeAddr1() %>"
							id="cafeAddr1" name="cafeAddr1">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeAddr2">상세주소:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="cafeAddr2"  value="<%=cafeVO.getCafeAddr2() %>"
							placeholder="상세주소를 입력하세요." name="cafeAddr2">
					</div>
				</div>
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
							placeholder="X좌표값을 입력하세요." name="cafeXPosition" value="<%=cafeVO.getCafeXPosition() %>">
							<span id="cafeXPositionSpan"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cafeYPosition">Y좌표:</label>
					<div class="col-sm-10 form-inline">
						<input type="text" class="form-control" id="cafeYPosition" value="<%=cafeVO.getCafeYPosition() %>"
							placeholder="Y좌표값을 입력하세요." name="cafeYPosition">
							<span id="cafeYPositionSpan"></span>
					</div>
				</div>
				<div class="form-group lastRow ">
					<div class="btnDiv">
						<button type="button" class="btn btn-primary" onclick="update()">수정저장</button>
						<button type="button" class="btn btn-info" onclick="cancel2()">취소</button>
					</div>
				</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>