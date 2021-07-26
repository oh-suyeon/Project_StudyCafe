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
	</script>
	<script src="../../js/seat/getSeatList.js"></script>
</head>
<body>
	
	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	
	
	<!-- 해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">좌석 관리</span>
		</div>
		
		<!-- 좌석 목록 출력 -->	
		<div class="divPadding alignCenter marginBottom30">
			<table class="table table-bordered">
				<tbody id="tb">
				</tbody>
			</table>
		</div>
		
<%-- 		<form id="fm" action="<%=request.getContextPath() %>/getSeatList.do"> --%>
<!-- 			<input type="hidden" name="flag" value="usingYNUpdate"> -->
<!-- 			<input type="hidden" id="cafeSeatNoInput" name="cafeSeatNo"> -->
<!-- 		</form> -->
		
		<!--SeatNo를 한번에 입력하는 로직-->
		<form id="fm" action="<%=request.getContextPath()%>/updateSeat.do">
			<input type="hidden" id="flag" name="flag" value="saveSeatNo">
			<input type="hidden" id="sqlString" name="sqlString">
		</form>
		
		<div class="divPadding text-center">
			<button type="button" class="btn btn-info" id="saveAll">완료</button>
		</div>
     	 
    </div>
      	 
   	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
	
	<!-- Modal 시작-->
	<div class="modal fade" id="modalSeat" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">좌석 정보</h4>
				</div>

				<div class="modal-body text-center">
					<form id="fm">
					
						<div id="seatUsingYn" class='alert alert-warning'></div>
						
						<input type="hidden" id="cafeSeatNo" name="cafeSeatNo" value="">
						<input type="hidden" id="cafeNo" name="cafeNo" value="">
						<input type="hidden" id="ownerId" name="ownerId" value="<%=loginId %>">
						
						<div class="form-group form-inline">
							<div class="marginBottom30 fontSize2">발권 가능 여부 설정</div>
							<label for="seatUsableY">가능</label>
							<input type="radio" name="seatUsableYn" id="seatUsableY" value="Y" style="margin-right: 30px;">
							<label for="seatUsableN">불가능</label>
							<input type="radio" name="seatUsableYn" id="seatUsableN" value="N">
						</div>
						
						<button id="saveBtn" type="button" class="btn btn-default marginBottom30" onclick="save()">
							저장
						</button>
						
					</form>
					
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