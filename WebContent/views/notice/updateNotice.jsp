<%@page import="daily.common.vo.AtchFileVO"%>
<%@page import="daily.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	NoticeVO noticeVO = new NoticeVO();
	noticeVO = (NoticeVO) request.getAttribute("noticeVO");

	String cafeNo = noticeVO.getCafeNo();
	
	String url = "";
	if(cafeNo == null){
		url = request.getContextPath() + "/getNoticeList.do?";
	}else{
		url = request.getContextPath() + "/getNoticeList.do?cafeNo=" + cafeNo;
	}
	
	// 파일 처리
	List<AtchFileVO> atchFileList = (List<AtchFileVO>)request.getAttribute("atchFileList");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 수정</title>

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
	
		<form class="form-horizontal divPadding" id="fm" action="<%=request.getContextPath() %>/updateNotice.do" method="post" enctype="multipart/form-data">
			
			<input type="hidden" value="<%=noticeVO.getAtchFileId()%>" name="atchFileId">
			<input type="hidden" value="<%=noticeVO.getNoticeNo()%>" name="noticeNo">
			
			<%if(cafeNo != null){ %>
				<input type="hidden" value="<%=cafeNo %>" name="cafeNo">
			<%} %>
			
			<div class="form-group">
				<label for="noticeTitle" class="control-label col-xs-2">제목</label>
				<div class="col-xs-8">
					<input type="text" class="form-control form-inline"
						   id="noticeTitle" name="noticeTitle" value="<%=noticeVO.getNoticeTitle()%>">
				</div>				
			</div>
			
			<div class="form-group">
				<label for="noticeContent" class="control-label col-xs-2">내용</label>
				<div class="col-xs-8">
					<textarea class="inputContent form-control form-inline" rows="10" 
							  id="noticeContent" name="noticeContent"><%=noticeVO.getnoticeContent() %>
					</textarea>
				</div>				
			</div>
			
			<div class="form-group">
				<label for="atchFileId" class="control-label col-xs-2">기존 첨부파일</label>
				<div class="col-xs-8" style="line-height: 40px;">
					<%if(atchFileList != null) {%>
						<%for(AtchFileVO fileVO : atchFileList) {%>
							<div>
								<a href="<%=request.getContextPath() %>/filedownload.do?fileId=<%=fileVO.getAtchFileId() %>&fileSn=<%=fileVO.getFileSn() %>">
									<%=fileVO.getFileOriginalName() %>
								</a>
							</div>
						<%} %>
					<%} %>
				</div>				
			</div>
			
			<div class="form-group">
				<label for="atchFileId" class="control-label col-xs-2">새로운 첨부파일</label>
				<div class="col-xs-8" style="line-height: 40px;">
					<input type="file" id="atchFileId" name="atchFileId" multiple="multiple">
				</div>				
			</div>
			
			<div class="text-center">
				<button type="submit" class="btn btn-info">수정</button>
				<button type="button" class="btn" onclick="location.href='<%=url %>'">취소</button>
			</div>
		</form>	
	</div>
	
	<!-- 풋터-->
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>