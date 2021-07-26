<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<% // 로그인 확인 작업
	String loginId = (String)session.getAttribute("loginId")==null?"":(String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName")==null?"":(String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType")==null?"":(String)session.getAttribute("loginType");
	
// 	out.print("loginId : " + loginId + "<br />");
// 	out.print("loginName : " + loginName + "<br />");
// 	out.print("loginType : " + loginType + "<br />");
%>
	

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
					<li class="active dropdown">
						<a href="#" class="dropdown-toggle aMainMenu" data-toggle="dropdown" >
							소개&#38;안내<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="<%=request.getContextPath() %>/views/introduce/mainIntroduceBrand.jsp">브랜드 소개</a></li>
							<li><a href="<%=request.getContextPath() %>/views/introduce/mainIntroduceInterior.jsp">인테리어 소개</a></li>
							<li><a href="<%=request.getContextPath() %>/views/introduce/mainIntroduceGuidance.jsp">매장 이용 안내</a></li>
							<li><a href="<%=request.getContextPath() %>/views/introduce/mainIntroduceRoute.jsp">찾아오시는 길</a></li>
						</ul>
					</li>

					<li class="active"><a href="<%=request.getContextPath() %>/searchCafelist.do"> 지점찾기&#38;예약 </a></li>

					<li class="active dropdown">
						<a href="<%=request.getContextPath() %>/getNoticeList.do" class="dropdown-toggle" data-toggle="dropdown">
							커뮤니티<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="<%=request.getContextPath() %>/getNoticeList.do">전체 공지사항</a></li>
							<li><a href="<%=request.getContextPath() %>/gsRecruitList.do">그룹 스터디</a></li>
							<li><a href="<%=request.getContextPath() %>/chainQnAList.do">1:1 가맹 문의</a></li>
							<li><a href="<%=request.getContextPath() %>/gsFeedList.do">자유게시판</a></li>
<!-- 							<li><a href="#">카페 리뷰</a></li> -->
						</ul>
					</li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
			      	 <%if(!"".equals(loginId) && loginId != null) { %>
			      	 
			      	 	<%if("user".equals(loginType)) { %>
							<li class="active dropdown">
								<a href="<%=request.getContextPath() %>/studyPlan.do">스터디 캘린더</a></li>
							</li>
			      	 	<%} %>
			      	 
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
				      	 <li>
				      	 	<a href="<%=request.getContextPath() %>/logout.do" id="logOut">
				      	 		<span class="glyphicon glyphicon-ok loginState"></span>
				      	 	 	&nbsp;로그아웃
				      	 	 </a>
				      	 </li>  
			      	 	
			      	 <%} else {%>
					     <li><a href="<%=request.getContextPath() %>/userJoin.do" id="join"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
				  		 <li><a href="<%=request.getContextPath() %>/login.do" id="logIn"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
			      	 <%}%>
		     	</ul>

			</div>
			<hr>
		</div>
	</nav>
	
	
	
