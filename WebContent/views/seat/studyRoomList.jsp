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
	<script src="../../js/seat/studyRoom.js"></script>
</head>
<body>
	
	<!-- 네비-->
	<jsp:include page="../include/cafeNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/cafeNav2.jsp"/>
	
     
    <!-- 스터디룸 예약 포맷 --> 	 
    <div class="divPadding alignCenter container" style="border: 2px solid; width: 500px;  border-radius: 8px;">
    		
    		<div class="alignCenter marginBottom30 marginTop30">
				<span class="textUnderline fontSize2">스터디룸 예약</span>
			</div>
    

			<!-- Modal content-->
			<div class=" divPadding marginTop30 text-center ">
				
				<!-- 이용권 선택  -->
				<div class="row text-center marginBottom30">
					<div >
						<p>스터디룸 유형</p>
						<div id="divTicketType">
							<!--4인실 -->
							<input type='radio' name='typeRoom' id="typeRoomFour" value="128" checked="checked" />
								<label for="typeRoomFour">스터디룸 4인실</label><br>
							<!--6인실 -->
							<input type='radio' name='typeRoom' id="typeRoomSix" value="129" /> 
								<label for="typeRoomSix">스터디룸 6인실</label>
						</div>
					</div>
<!-- 						<div class="col-md-3"></div> -->
				</div>
				
				<!-- 예약일 선택 -->
				<div class="text-center marginBottom30">
					<div class="form-group form-inline" >
						<label>예약 날짜</label>
						<input id="reservationDate" name="reservationDate" type="date" class="form-control">
						<button type="button" class="btn" name="search" onclick="search();">검색</button>
					</div>

					<div class="form-group form-inline">
						<label class="control-label">시작 시간 </label> 
							<select name="usingTime" id="usingTime" class="form-control">
							<option>== 선택 ==</option>
						</select>
					</div>
				</div>

				<!-- 스터디룸 이용시간 유형 -->
				<div class="row text-center marginBottom30">
					<div >
						<p>이용시간 선택</p>
						<div id="divTicketPrice">
							<input type='radio' name='ticketPrice' id='fourRoomTime1' value='8000' checked='checked'/>
								<label for='fourRoomTime1'>1시간/8,000원</label><br>
							<input type='radio' name='ticketPrice' id='fourRoomTime2' value='16000'/> 
						 		<label for='fourRoomTime2'>2시간/16,000원</label><br> 
						 	<input type='radio' name='ticketPrice' id='fourRoomTime3' value='24000'/>
						 		<label for='fourRoomTime3'>3시간/24,000원</label>
						</div>
					</div>
				</div>
<!-- 					<div id="timeInput"></div> -->
				<div id="timeResult"></div>
<!-- 					<div id="result"></div> -->
				
				<div class="text-center">
					<button id="saveBtn" type="button"
						class="btn btn-info marginBottom30" onclick="save()">발권
					</button>
				</div>

			</div>
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
   	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
	
</body>


</html>