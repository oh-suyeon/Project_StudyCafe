<%@page import="java.util.List"%>
<%@page import="daily.seat.vo.SeatVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 로그인 확인 작업
	String loginId = (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType");
// 	out.print("loginId : " + loginId + "<br />");
// 	out.print("loginName : " + loginName + "<br />");
// 	out.print("loginType : " + loginType + "<br />");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> DAILY | SEAT </title>

	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<link href="<%=request.getContextPath() %>/css/seat/getSeatList.css" type="text/css" rel="stylesheet">
	
	<!-- 외부 js 파일에서 쓸 정보 미리 변수에 담아놓기 -->
	<script type="text/javascript">
		var contextPath = '<%=request.getContextPath()%>';
		var loginId = "<%=loginId%>";
		var cafeNo = <%=request.getAttribute("cafeNo")%>;
		var seatCode = <%=request.getAttribute("seatCode")%>;
	</script>
	<script src="../../js/seat/userGetSeatList.js"></script>
</head>
<body>
	
	<!-- 네비-->
	<jsp:include page="../include/cafeNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/cafeNav2.jsp"/>
	
	
	<!-- 해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">개인석 예약</span>
		</div>
		
		<!-- 게시글 목록 출력 -->	
		<div class="divPadding alignCenter marginBottom30">
			<table class="table table-bordered">
				<tbody id="tb">
				</tbody>
			</table>
		</div>
		
		<!-- 버튼 -->
		<div class="divPadding text-center">
			<button type="button" class="btn btn-info" onclick="location.href='#'">완료</button>
		</div>
     	 
    </div>
      	 
   	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
	
	<!-- Modal 시작-->
	<div class="modal fade" id="modalSeat" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content text-center">
				<div class="modal-header marginBottom30">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">좌석 예약</h4>
				</div>

				<div class="modal-body divPadding marginTop30 text-center">
					<!-- 화면에 보여지는 데이터 -->
					
					<!-- 예약일 선택 -->
					<div class="row text-center marginBottom30">
						<div class="col-xs-7 form-inline" >
							<h3>예약 날짜</h3>
							<input id="reservationDate" name="reservationDate" type="date" class="form-control">
							<button type="button" class="btn" name="search" onclick="search();">검색</button>
						</div>
	
						<div class="col-xs-4">
							<h3>시작 시간 </h3> 
							<select name="usingTime" id="usingTime" class="form-control" onchange="changeUsingTime()">
								<option>== 선택 ==</option>
							</select>
						</div>
					</div>
						
					<hr>
					
					<!-- 이용권 선택  -->
					<div class="row text-center marginBottom30">
					
						<div class="col-xs-6">
							<h3>이용권 유형</h3>
							<div id="divTicketType">
								<input type='radio' name='ticketType' id="typeOneDay" value="02"
									checked="checked" /> <label for="typeOneDay">당일권</label><br>
								<!--oneDay -->
								<input type='radio' name='ticketType' id="typeRegular"
									value='03' /> <label for="typeRegular">정기권</label>
								<!--regularDay -->
							</div>
						</div>
						
						<div class="col-xs-6">
							<h3>이용권 선택</h3>
							<div id="divTicketPrice">
								<input type='radio' name='ticketPrice' id='ticketTime2'
									value='3000' checked='checked' /> <label for="ticketTime2">2시간/3,000원</label><br>
								<input type='radio' name='ticketPrice' id='ticketTime4'
									value='5000' /> <label for="ticketTime4">4시간/5,000원</label><br>
								<input type='radio' name='ticketPrice' id='ticketTime6'
									value='7000' /> <label for="ticketTime6">6시간/7,000원</label>
							</div>
						</div>
						
					</div>
					
					<hr>
					
					<!-- 결과 -->
					<div class="marginBottom30 marginTop30">
						<div id="timeInput" class=""> </div>
						<div id="timeResult" class=""> </div>
					</div>
					
					
					
					<!-- 실제로 날아갈 데이터 -->
					<form id="fm" action="<%=request.getContextPath()%>/userInsertSeat.do">
					
						<!-- 좌석 예약에 필요한 정보 -->
						<input type="hidden" id="cafeSeatNo" name="cafeSeatNo"> 
						<input type="hidden" id="seatNo" name="seatNo">
						<input type="hidden" id="hiddenStartTime" name="userSeatStartDate">
						<input type="hidden" id="hiddenEndTime" name="userSeatEndDate">
						<input type="hidden" id="userId" name="userId" value="<%=loginId %>">
						<!-- 결제에 필요한 정보 -->
						<input type="hidden" name="cafeNo" value="<%=request.getAttribute("cafeNo")%>">
						<input type="hidden" id="hiddenTicketType" name="ticketType">
						<input type="hidden" id="hiddenTicketPrice" name="ticketPrice">
						
					</form>
					
					<hr>
					
					<div class="text-center marginTop30" >
						<button id="saveBtn" type="button"
							class="btn btn-info marginBottom30" onclick="save()">발권
						</button>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- Modal 끝-->
	
</body>


</html>