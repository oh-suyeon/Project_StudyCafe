<%@page import="daily.cafe.vo.CafeIntroduceVO"%>
<%@page import="daily.cafe.vo.CafeRegionNameVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CafeRegionNameVO cafeVO = (CafeRegionNameVO)request.getAttribute("cafeVO");
// CafeIntroduceVO introduceVO = (CafeIntroduceVO)request.getAttribute("introduceVO");

// 로그인 세션 확인
	String loginId = (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType");
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
	<footer class="container text-center">
		<hr class="marginBottom30">
		<div>
		  	<p>대표자 : O O O | 사업자 번호 : 555-86-01317</p>
		  	<p>주소 : 서울시 구로구 디지털로 33길 11 | 연락처 : 02-858-5789</p>
		</div>
	</footer>
</body>
</html>