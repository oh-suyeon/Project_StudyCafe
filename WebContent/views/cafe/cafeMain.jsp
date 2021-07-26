<%@page import="daily.cafe.vo.CafeIntroduceVO"%>
<%@page import="daily.cafe.vo.CafeRegionNameVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CafeRegionNameVO cafeVO = (CafeRegionNameVO)request.getAttribute("cafeVO");
// CafeIntroduceVO introduceVO = (CafeIntroduceVO)request.getAttribute("introduceVO");

%>

<!DOCTYPE html>
<html>
<head>
  <title>Daily Study Cafe - 지점 상세 메인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<link href="../../css/common/common.css" type="text/css" rel="stylesheet">
	<link href="../../css/common/navNFooter.css" type="text/css" rel="stylesheet">
	<link href="../../css/cafe/main2.css" type="text/css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../include/cafeNav1.jsp"/>
	<!-- 	상세 네비 -->
	<jsp:include page="../include/cafeNav2.jsp"/>
		
	<!-- Carousel -->
	<div class="container divPadding marginBottom30">
		<div class="text-center marginBottom30">
			<h2 style="color: SaddleBrown;  font-weight: bold"><%=cafeVO.getCafeRegionName() %> <%=cafeVO.getCafeName() %></h2>
		</div>	
      	<div>
        	<img src="../../image/cafeMain.PNG" class="img-responsive" alt="Image">
      	</div>
	</div>
	  
	<div class="container divPadding">    
		<div style="width: 100%; height: 200px;">
			
<!-- 			<div style="width: 150px; height: 150px; background-color: red;"> -->
			<div class="container divPadding alignCenter" style="display: flex; justify-content: center;">
				<div class="smallIcon">
					<a href="<%=request.getContextPath()%>userGetSeatList.do?cafeNo=<%=cafeVO.getCafeNo() %>&seatCode=01">
						<img src="../../image/ss6.png"
						class="img-responsive" alt="Image">
					</a>
					<p>좌석예약</p>
				</div>
				<div class="smallIcon">
					<a href="<%=request.getContextPath()%>/getNoticeList.do?cafeNo=<%=cafeVO.getCafeNo()%>">
						<img src="../../image/board_icon01.png"
						class="img-responsive" alt="Image">
					</a>
					<p>공지사항</p>
				</div>
				<div class="smallIcon">
					<a href="<%=request.getContextPath()%>/reviewList.do">
						<img src="../../image/review.png"
						class="img-responsive" alt="Image">
					</a>
					<p>리뷰</p>
				</div>
			</div>			
			</div>
<!-- 		</div> -->
	</div>
	<br><br><br>
<!-- 	<div class="container divPadding">     -->
<!-- 		<table id="tb" class="table table-striped table-hover"> -->
<!-- 			<colgroup> -->
<!-- 				<col style="width: 80px;"> -->
<!-- 				<col style="width: auto;"> -->
<!-- 				<col style="width: 150px;"> -->
<!-- 			</colgroup> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th class="alignCenter">글번호</th> -->
<!-- 					<th>제목</th> -->
<!-- 					<th class="alignCenter">게시일</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody class="fontWeight300"> -->
<!-- 				<tr class="cursorPointer"> -->
<!-- 					<td class="alignCenter">1</td> -->
<!-- 					<td>쿠폰 발행 관련 공지사항</td> -->
<!-- 					<td class="alignCenter">2021-06-19</td> -->
<!-- 				</tr> -->
<!-- 				게시물 없을 경우 -->
<!-- 				<tr> -->
<!-- 					<td colspan="3" class="alignCenter">게시물 없음</td> -->
<!-- 				</tr> -->
<!-- 			</tbody> -->
<!-- 		</table> -->
<!-- 	</div> -->
	
	
	<footer class="container text-center">
		<hr class="marginBottom30">
		<div>
		  	<p>대표자 : O O O | 사업자 번호 : 555-86-01317</p>
		  	<p>주소 : 서울시 구로구 디지털로 33길 11 | 연락처 : 02-858-5789</p>
		</div>
	</footer>
	
	
</body>
</html>