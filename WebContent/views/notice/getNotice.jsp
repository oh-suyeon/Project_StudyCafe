<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.notice.vo.NoticeVO"%>					
<%@page import="daily.common.vo.AtchFileVO" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<AtchFileVO> atchFileList = (List<AtchFileVO>)request.getAttribute("atchFileList");
	NoticeVO noticeVO = (NoticeVO) request.getAttribute("noticeVO");
	
	if(noticeVO == null)
		noticeVO = new NoticeVO();

	String cafeNo = noticeVO.getCafeNo();
	
	String url = "";
	String ownerId = "";
	
	if(noticeVO.getCafeNo() == null){
		url = request.getContextPath() + "/getNoticeList.do?";
	}else{
		url = request.getContextPath() + "/getNoticeList.do?cafeNo=" + noticeVO.getCafeNo();
		ownerId = (String) request.getAttribute("ownerId");	
	}
	
	// 삭제 url  
	String urlDelete = request.getContextPath() + "/deleteNotice.do?noticeNo=" + noticeVO.getNoticeNo();
			
	// 수정 url 
	String urlUpdate = request.getContextPath() + "/updateNotice.do?noticeNo=" + noticeVO.getNoticeNo();
%>

<% // 로그인 세션 확인
	
	String loginId = (String)session.getAttribute("loginId") == null? "" : (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName") == null? "" : (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType") == null? "" : (String)session.getAttribute("loginType"); //admin, user, owner
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title> DAILY | NOTICE </title>

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
		
		<div class="divPadding">
			<table id="tb" class="table table-striped">
				<colgroup>
					<col style="width: 80px;">
					<col style="width: 70%;">
					<col style="width: 80px;">
					<col style="width: auto;">
				</colgroup>
				<tbody class="fontWeight300">
					<tr>
						<th class="text-right">제목</th>
						<td><%=noticeVO.getNoticeTitle() %></td>
						<th class="text-right">작성일</th>
						<td><%=noticeVO.getNoticeRegDate() %></td>
					</tr>
					<tr>
						<th class="text-right">첨부파일</th>
						<td colspan="3">
						
						<%if(atchFileList != null) {%>
							<%for(AtchFileVO fileVO : atchFileList){ %>
								<div>
									<a href="<%=request.getContextPath()%>/filedownload.do?fileId=<%=fileVO.getAtchFileId() %>&fileSn=<%=fileVO.getFileSn() %>">
										<%=fileVO.getFileOriginalName() %>
									</a>
								</div>
							<%} %>
						<%} %>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="padding: 20px 90px;"><%=noticeVO.getnoticeContent() %></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 버튼 -->
		<div class="divPadding text-right">
			<button type="button" class="btn" onclick="location.href='<%=url %>'">목록</button>
		 <%if( (("".equals(cafeNo) || cafeNo == null) && "admin".equals(loginType)) || ((!"".equals(ownerId)) && (loginId.equals(ownerId))) ) { %>
			<button type="button" class="btn btn-info authorityState" onclick="location.href='<%=urlUpdate %>'">수정</button>
			<button type="button" class="btn btn-warning authorityState" onclick="location.href='<%=urlDelete %>'">삭제</button>
      	 <%}%>
		</div>
		
		
		
		
	</div>
	
	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>