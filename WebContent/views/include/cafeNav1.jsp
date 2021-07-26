<%@page import="daily.cafe.vo.CafeRegionNameVO"%>
<%@page import="daily.cafe.vo.CafeVO"%>
<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	}
	if(cafeNoTemp != null){
		cafeNo = (String)request.getAttribute("cafeNo");
	}else{
// 		cafeNo = "1";
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<nav class="navbar">
		<div class="container">

			<div class="navbar-header">

				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header">
					<a id="logo" class="navbar-brand logo" href="<%=request.getContextPath() %>/views/main/main.jsp">DAILY</a>
				</div>

			</div>

			<!-- nav 메뉴 -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="<%=request.getContextPath() %>cafeMain.do?cafeNo=<%=cafeNo%>">홈</a></li>
					<li class="active dropdown">
						<a href="#" class="dropdown-toggle aMainMenu" data-toggle="dropdown" >
							예약<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="<%=request.getContextPath() %>/userGetSeatList.do?cafeNo=<%=cafeNo%>&seatCode=01">개인석</a></li>
							<li><a href="<%=request.getContextPath() %>/getRoomList.do?cafeNo=<%=cafeNo%>&seatCode=02">스터디룸</a></li>
						</ul>
					</li>
					<li class="active dropdown">
						<a href="#" class="dropdown-toggle aMainMenu" data-toggle="dropdown" >
							공지사항<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="<%=request.getContextPath() %>/getNoticeList.do?cafeNo=<%=cafeNo%>">공지사항</a></li>
							<li><a href="<%=request.getContextPath() %>/cafeInfo.do">이용료 안내</a></li>
						</ul>
					</li>
					<li class="active"><a href="<%=request.getContextPath() %>/reviewList.do">리뷰</a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<%if(!"".equals(loginId) && loginId != null){ %>
				  		  <li class="active dropdown">
							<a href="#" class="dropdown-toggle aMainMenu" data-toggle="dropdown" >
								<span class="glyphicon glyphicon-user"></span>
								<%=loginName%> 님
								<span class="caret"></span>
							</a>
							<%if("user".equals(loginType)) { %>
								<ul class="dropdown-menu">
									<li onclick="chkInfoPw()"><a href="<%=request.getContextPath() %>/myInfoUpdate.do">내 정보 관리</a></li>
<!-- 									<li><a href="#">입퇴실 관리</a></li> -->
<!-- 									<li><a href="#">자리/이용시간 관리</a></li> -->
									<li><a href="<%=request.getContextPath() %>/userGetMySeatList.do">발권/결제내역 확인</a></li>
								</ul>
							<%}else if("owner".equals(loginType)) { %>
								<ul class="dropdown-menu">
									<li><a href="<%=request.getContextPath() %>/ownerUpdate.do?ownerId=<%=loginId %>">내 정보 관리</a></li>
<!-- 									<li><a href="#">시설 및 서비스 관리</a></li> -->
<!-- 									<li><a href="#">운영 관리</a></li> -->
									<li><a href="<%=request.getContextPath() %>/getSeatList.do?ownerId=<%=loginId %>">좌석 관리</a></li>
<!-- 									<li><a href="#">입퇴실 관리</a></li> -->
<!-- 									<li><a href="#">지점 통계</a></li> -->
								</ul>
							<%}else if("admin".equals(loginType)) { %>
								<ul class="dropdown-menu">
									<li><a href="<%=request.getContextPath() %>/userList.do">회원 정보 관리</a></li>
									<li><a href="<%=request.getContextPath() %>/ownerManage.do">지점주 관리</a></li>
									<li><a href="<%=request.getContextPath() %>/cafeManage.do">지점 관리</a></li>
<!-- 									<li><a href="#">지점 통계</a></li> -->
<!-- 									<li><a href="#">이용 체계 관리</a></li> -->
<!-- 									<li><a href="#">쿠폰 관리</a></li> -->
<!-- 									<li><a href="#">배너 관리</a></li> -->
								</ul>
							<%} %>
						 </li>
				      	 <li><a href="<%=request.getContextPath() %>/logout.do" id="logOut"><span class="glyphicon glyphicon-ok loginState"></span> &nbsp;로그아웃</a></li>  
			      	 
			      	 <%} else {%>
					     <li><a href="<%=request.getContextPath() %>/userJoin.do" id="join"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
				  		 <li><a href="<%=request.getContextPath() %>/login.do" id="logIn"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
			      	 <%}%>
				</ul>

			</div>
			<hr>
		</div>
	</nav>
	<script type="text/javascript">
		function chkInfoPw(){
			
		}
	</script>
