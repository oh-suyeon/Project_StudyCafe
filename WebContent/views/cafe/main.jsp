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

</head>
<body>
	
	<nav class="navbar">
		<div class="container marginBottom30">

			<div class="navbar-header">

				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header">
					<a id="logo" class="navbar-brand logo" href="#">DAILY</a>
				</div>

			</div>
	
			<!-- nav 메뉴 -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">홈</a></li>
					<li class="active dropdown">
						<a href="#" class="dropdown-toggle aMainMenu" data-toggle="dropdown" >
							예약<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">개인석</a></li>
							<li><a href="#">스터디룸</a></li>
						</ul>
					</li>
					<li class="active dropdown">
						<a href="#" class="dropdown-toggle aMainMenu" data-toggle="dropdown" >
							공지사항<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">공지사항</a></li>
							<li><a href="#">시설 및 서비스 안내</a></li>
						</ul>
					</li>
					<li class="active"><a href="#">리뷰</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="#"><span class="glyphicon glyphicon-user unLoginState"></span> &nbsp;회원가입</a>
					</li>
					<li>
						<a href="#"><span class="glyphicon glyphicon-log-in unLoginState"></span> &nbsp;로그인</a>
					</li>
					<li>
						<a href="#"><span class="glyphicon glyphicon-ok loginState"></span> &nbsp;로그아웃</a>
					</li>
				</ul>

			</div>
			<hr>
		</div>
	</nav>
	
	<!-- Carousel -->
	<div class="container divPadding">
      	<div>
        	<img src="../../image/cafe.jpeg" class="img-responsive" alt="Image">
      	</div>
	</div>
	  
	<div class="container divPadding">    
		<div style="width: 100%; height: 200px; background-color: silver">
			<h3><%=cafeVO.getCafeRegionName() %> <%=cafeVO.getCafeName() %>☆</h3>
<%-- 			<h4><%=introduceVO.getIntroduceContent() %></h4> --%>
		</div>
	</div>

	<div class="container divPadding">    
		<table id="tb" class="table table-striped table-hover">
			<colgroup>
				<col style="width: 80px;">
				<col style="width: auto;">
				<col style="width: 150px;">
			</colgroup>
			<thead>
				<tr>
					<th class="alignCenter">글번호</th>
					<th>제목</th>
					<th class="alignCenter">게시일</th>
				</tr>
			</thead>
			<tbody class="fontWeight300">
				<tr class="cursorPointer">
					<td class="alignCenter">1</td>
					<td>쿠폰 발행 관련 공지사항</td>
					<td class="alignCenter">2021-06-19</td>
				</tr>
				<!-- 게시물 없을 경우 -->
				<tr>
					<td colspan="3" class="alignCenter">게시물 없음</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	
	<footer class="container text-center">
		<hr class="marginBottom30">
		<div>
		  	<p>대표자 : O O O | 사업자 번호 : 555-86-01317</p>
		  	<p>주소 : 서울시 구로구 디지털로 33길 11 | 연락처 : 02-858-5789</p>
		</div>
	</footer>
	
	
</body>
</html>