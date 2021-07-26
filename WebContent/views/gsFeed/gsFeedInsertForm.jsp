<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			<span class="textUnderline fontSize2">자유게시판</span>
		</div>
	<!-- 해당 페이지 내용 -->
	
	<div class="container divPadding marginBottom30">

		<form class="form-horizontal divPadding" id="fm" action="<%=request.getContextPath() %>/gsFeedInsert.do" method="post" enctype="multipart/form-data">

			<div class="form-group">
				
				<label for="gsFeedTitle" class="control-label col-xs-2">제목</label>
				<div class="col-xs-8">
					<input type="text" class="form-control form-inline"
						   id="gsFeedTitle" name="gsFeedTitle">
				</div>				
			</div>
			
			<div class="form-group">
			<label for="gsFeedUserId" class="control-label col-xs-2">작성자</label>
				<div class="col-xs-8">
					<input type="text" class="form-control form-inline"
						   id="gsFeedUserId" name="userId" value="<%=loginId%>" readonly="readonly">
				</div>				
			</div>
					
			<div class="form-group" >
				<label for="gsFeedContent" class="control-label col-xs-2">내용</label>
				<div class="col-xs-8">
					<textarea class="inputContent form-control form-inline" rows="10" 
							  id="gsFeedContent" name="gsFeedContent"></textarea>
				</div>				
			</div>
			
			<div class="form-group">
				<label for="atchFileId" class="control-label col-xs-2">첨부파일</label>
				<div class="col-xs-8" style="line-height: 40px;">
					<input type="file" 
						   id="atchFileId" name="atchFileId" multiple="multiple">
				</div>				
			</div>
			
			<div class="text-center">
				<button type="submit" class="btn btn-info">등록</button>
				<a href="gsFeedList.do"><button type="button" class="btn">취소</button></a>
			</div>
		</form>	
		
	</div>
	</div>
		<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>