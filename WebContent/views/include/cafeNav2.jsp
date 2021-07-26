<%@page import="daily.cafe.vo.CafeRegionNameVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String reqUrl = request.getRequestURI();
%>

<% 
// 로그인 확인 작업
String loginId = (String)session.getAttribute("loginId");
String loginName = (String)session.getAttribute("loginName");
String loginType = (String)session.getAttribute("loginType");
%>

<%
	String cafeNo = "";
	
	// 카페 번호
	CafeRegionNameVO cafeVO = (CafeRegionNameVO)request.getAttribute("cafeVO");
	String cafeNoTemp = (String)request.getAttribute("cafeNo");
	
	if(cafeVO != null){
		cafeNo = cafeVO.getCafeNo();
	}else if(cafeNoTemp != null){
		cafeNo = (String)request.getAttribute("cafeNo");
	}else{
// 		cafeNo = "1";
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<nav class="navbar ">
		<div class="container marginBottom30">

				<!-- 좌석 -->
				<%if(reqUrl.indexOf("eat") != -1){ %> <!-- 1:1문의 url 일부 -->
					<div class="collapse navbar-collapse" style="text-align: center;">
						<ul class="nav navbar-nav"  style="width: 100%">
							<li class="active" style="width: calc(100% / 2)">
								<a href="<%=request.getContextPath() %>/userGetSeatList.do?cafeNo=<%=cafeNo%>&seatCode=01">
									개인석
								</a>
							</li>
							<li class="active" style="width: calc(100% / 2)">
								<a href="<%=request.getContextPath() %>/getRoomList.do?cafeNo=<%=cafeNo%>&seatCode=02">
									스터디룸
								</a>
							</li>
						</ul>
					</div>
					<hr>
				<!-- 공지사항  -->
				<%}else if(reqUrl.indexOf("otice") != -1 
						   || reqUrl.indexOf("ntroduce") != -1) {%>
					<div class="collapse navbar-collapse" style="text-align: center;">
						<ul class="nav navbar-nav"  style="width: 100%">
							<li class="active" style="width: calc(100% / 2)">
								<a href="<%=request.getContextPath() %>/getNoticeList.do?cafeNo=<%=cafeNo%>">
									공지사항
								</a>
							</li>
							<li class="active" style="width: calc(100% / 2)">
								<a href="<%=request.getContextPath() %>/cafeInfo.do">
									이용료 안내
								</a>
							</li>
						</ul>
					</div>
					<hr>
				<%} %>
				
		</div>
	</nav>

