<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.gsFeed.vo.GsFeedVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	GsFeedVO gsFeedVO = (GsFeedVO)request.getAttribute("gsFeedVO");

%>
<% // 로그인 세션 확인
	String loginId = (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	
	<title>그룹스터디</title>
	
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	
</head>

<body>	

	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">그룹스터디</span>
		</div>
	<!-- 해당 페이지 내용 -->
	
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">나의 스터디</span>
		</div>
		
		<div class="divPadding">
			<table id="tb" class="table table-striped">
				<colgroup>
					<col style="width: 80px;">
					<col style="width: auto;">
					<col style="width: 80px;">
					<col style="width: auto;">
				</colgroup>
				<tbody class="fontWeight300">
					<tr>
						<th class="text-right">제목</th>
						<td><%=gsFeedVO.getGsFeedTitle() %></td>
						<th class="text-right">작성일</th>
						<td><%=gsFeedVO.getGsFeedDate()%></td>
					</tr>
					<tr>
						<th class="text-right">작성자</th>
						<td colspan="4"><%=gsFeedVO.getUserId()%></td>
					</tr>
					<tr>
						<th class="text-right">첨부파일</th>
						<td colspan="3">
						<img src="<%=request.getContextPath() %>/image/uploads/<%=gsFeedVO.getFileName()%>" alt="">
						
						</td>
					</tr>
					<tr>
						<td colspan="4" style="padding: 20px 90px;"><%=gsFeedVO.getGsFeedContent()%></td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
		
		<!-- 버튼 --class를 추가해 접근을 제어-->
<%
			if( loginId.equals(gsFeedVO.getUserId())) {%>
			
				<button type="button" class="btn" onclick="location.href='<%=request.getContextPath() %>/gsFeedList.do'">목록</button></a>
				<button type="button" class="btn btn-info" onclick="location.href='<%=request.getContextPath() %>/gsFeedUpdate.do?gsFeedNo=<%=gsFeedVO.getGsFeedNo() %>'">수정</button>																		
				<button type="button" class="btn btn-warning" onclick="location.href='<%=request.getContextPath() %>/gsFeedDelete.do?gsFeedNo=<%=gsFeedVO.getGsFeedNo() %>'">삭제</button>
		<%}else{%>
				<button type="button" class="btn" onclick="location.href='<%=request.getContextPath() %>/gsFeedList.do'">목록</button></a>
		<%} %>

	</div>
	
		<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>