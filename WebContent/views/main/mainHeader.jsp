<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%
AdminVO adminVO = (AdminVO)session.getAttribute("adminVO")==null?null:(AdminVO)session.getAttribute("adminVO");
OwnerVO ownerVO = (OwnerVO)session.getAttribute("ownerVO")==null?null:(OwnerVO)session.getAttribute("ownerVO");
UserVO userVO = (UserVO)session.getAttribute("userVO")==null?null:(UserVO)session.getAttribute("userVO");
String loginId = "";
String loginName = "";
if(adminVO!=null){
	loginId = adminVO.getAdminId();
	loginName = adminVO.getAdminName();
}else if(ownerVO!=null){
	loginId = ownerVO.getOwnerId(); 
	loginName = ownerVO.getOwnerName();
}else if(userVO!=null) {
	loginId = userVO.getUserId();
	loginName = userVO.getUserName();
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>메인화면 header</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main/main.css">
    <script type="text/javascript">
    <%if(userVO != null || adminVO != null || ownerVO !=null) { %>
    alert("<%=loginName %>" + "님 환영합니다.");
    <%} %>
    </script>
</head>
<body>
	<nav class="navbar">
	  <div class="container-fluid ">
	  
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="#">
	      	<img alt="" src="../../image/logo.png" style="height: 25px;">
	      </a>
	    </div>
	    
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	         <li class="active dropdown">
			      <a href="#" class="dropdown-toggle" data-toggle="dropdown">
				    	소개	&#38;안내<span class="caret"></span>
				  </a>
			  	  <ul class="dropdown-menu">
			  	  	<li><a href="#">브랜드 소개</a></li>
					<li><a href="#">인테리어 소개</a></li>
					<li><a href="#">매장 이용 안내</a></li>
					<li><a href="#">찾아오시는 길</a></li>
			  	  </ul>
			  </li>
			  
			  <li class="active dropdown">
			  	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					지점찾기&#38;예약<span class="caret"></span>
				</a>
	<!-- 			<ul class="dropdown-menu">
				안에 아무것도 없음
				</ul> -->
			 </li>
			 
			  <li class="active dropdown">
			  	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					커뮤니티<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">전체 공지사항</a></li>
					<li><a href="#">그룹 스터디</a></li>
					<li><a href="#">1:1 가맹 문의</a></li>
				</ul>
			 </li>		 
	      </ul>
	      
	      <ul class="nav navbar-nav navbar-right">
	      	 <%if(userVO != null || adminVO != null || ownerVO !=null) { %>
	  		<li><a href="#" ><span class="glyphicon glyphicon-user"></span><%=loginName%> 님</a></li>
	      	<li><a href="<%=request.getContextPath() %>/logout.do" id="logOut"><span class="glyphicon glyphicon-ok loginState"></span> &nbsp;로그아웃</a></li>  
	      	 
	      	 <%} else {%>
		    <li><a href="<%=request.getContextPath() %>/userJoin.do" id="join"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
	  		<li><a href="<%=request.getContextPath() %>/login.do" id="logIn"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	      	 <%}%>
	      </ul>
	      
	    </div>
	  </div>
	</nav>
</body>
</html>