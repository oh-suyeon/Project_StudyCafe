<%@page import="daily.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String cafeNo = (String) request.getAttribute("cafeNo");
	String url = "";
	if(cafeNo == null){
		url = request.getContextPath() + "/getNoticeList.do?";
	}else{
		url = request.getContextPath() + "/getNoticeList.do?cafeNo=" + cafeNo;
		
	}
	
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 등록</title>

	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
</head>

<body>

	<%if(cafeNo != null){ %>
		<!-- 네비-->
		<jsp:include page="../include/cafeNav1.jsp"/>
		<!-- 상세 네비-->
		<jsp:include page="../include/cafeNav2.jsp"/>
	<%} else {%>
		<!-- 네비-->
		<jsp:include page="../include/mainNav1.jsp"/>
		<!-- 상세 네비-->
		<jsp:include page="../include/mainNav2.jsp"/>
	<%} %>
	
	<!-- 해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<%if(cafeNo != null){ %>
				<span class="textUnderline fontSize2">지점 공지사항</span>
			<%} else {%>
				<span class="textUnderline fontSize2">전체 공지사항</span>
			<%} %>
		</div>
	
		<form class="form-horizontal divPadding" id="fm" action="<%=request.getContextPath() %>/insertNotice.do" method="post" enctype="multipart/form-data">
			
			<%if(cafeNo != null){ %>
				<input type="hidden" value="<%=cafeNo %>" name="cafeNo">
			<%} %>
			
			<div class="form-group">
				<label for="noticeTitle" class="control-label col-xs-2">제목</label>
				<div class="col-xs-8">
					<input type="text" class="form-control form-inline"
						   id="noticeTitle" name="noticeTitle">
				</div>				
			</div>
			
			<div class="form-group">
				<label for="noticeContent" class="control-label col-xs-2">내용</label>
				<div class="col-xs-8">
					<textarea class="inputContent form-control form-inline" rows="10"
							  id="noticeContent" name="noticeContent"></textarea>
				</div>				
			</div>
			
			<div class="form-group">
				<label for="atchFileId" class="control-label col-xs-2">첨부파일</label>
				<div class="col-xs-8" style="line-height: 40px;">
					<input type="file" id="atchFileId" name="atchFileId" multiple="multiple">
				</div>				
			</div>
			
			<div class="text-center">
				<button type="submit" class="btn btn-info">등록</button>
				<button type="button" class="btn" onclick="location.href='<%=url %>'">취소</button>
			</div>
		</form>	
	</div>
	
	<!-- 풋터-->
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>