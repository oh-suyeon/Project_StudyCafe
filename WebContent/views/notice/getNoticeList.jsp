<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<NoticeVO> noticeList = (List<NoticeVO>)request.getAttribute("noticeList");
	NoticeVO noticeVO = (NoticeVO) request.getAttribute("noticeVO");

	if(noticeVO == null){
		noticeVO = new NoticeVO();
	}
	
	String cafeNo = noticeVO.getCafeNo();
	
	String url = "";
	String ownerId = "";
	
	if(cafeNo == null){
		url = request.getContextPath() + "/insertNotice.do?";
	}else{
		url = request.getContextPath() + "/insertNotice.do?cafeNo=" + cafeNo;
		ownerId = (String) request.getAttribute("ownerId");	
	} 
	
	int firstPageNo = noticeVO.getFirstPageNo();
	int countPerPage = noticeVO.getCountPerPage();
	int lastPageNo = noticeVO.getLastPageNo();
	int currentPageNo = noticeVO.getCurrentPageNo();
	int totalPageCount = noticeVO.getTotalPageCount();
	
	// 만약 검색이라면 selectSearch=title&inputSearch=공
	String pagingUrl = "";
	if(request.getAttribute("selectSearch") != null){
		pagingUrl = "&selectSearch=" + (String)request.getAttribute("selectSearch") + "&inputSearch=" + (String)request.getAttribute("inputSearch"); 
	}
	
%>
   
<% // 로그인 확인 작업
	String loginId = (String)session.getAttribute("loginId") == null? "" : (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName") == null? "" : (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType") == null? "" : (String)session.getAttribute("loginType"); //admin, user, owner
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

	<script type="text/javascript">
		console.log("loginType : " + <%=loginType%>);
		console.log("loginName : " + <%=loginName%>);
		console.log("loginId : " + <%=loginId%>);
	</script>
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>공지사항 리스트</title>
	
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
		
		<!-- 검색 -->
		<div class="divPadding text-right fontWeight300">
			<form action="<%=request.getContextPath() %>/searchNoticeList.do" method="get">
				<div class="form-group">
					<div class="inlineBlock" style="display: inline-block;"> <!-- common.css의 inlineBlock이 안 먹힘. 내부 스타일을 씀-->
						<select class="form-control" name="selectSearch">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="inlineBlock" style="display: inline-block;">
						<input type="text" class="form-control form-inline" 
							   id="inputSearch" name="inputSearch">
					</div>
					<div class="inlineBlock" style="display: inline-block;">
						<button type="submit" class="btn">검색</button>
					</div>
				</div>
			</form>
		</div>
		
		<!-- 게시글 목록 출력 -->	
		<div class="divPadding">
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
					<% 
						int noticeSize = noticeList.size();
						if(noticeSize > 0){
							for(int i=0; i<noticeSize; i++){	
					%>
						<tr class="cursorPointer" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/getNotice.do?noticeNo=<%=noticeList.get(i).getNoticeNo() %>'">
							<td class="alignCenter"><%= noticeList.get(i).getNoticeNo()%></td>
							<td><%= noticeList.get(i).getNoticeTitle()%></td>
							<td class="alignCenter"><%= noticeList.get(i).getNoticeRegDate()%></td>
						</tr>
					<%
							} 
						}else{
					%>
						<tr>
							<td colspan="3" class="alignCenter">게시물 없음</td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		
		<!-- 버튼 (메인인 경우 관리자 / 지점인 경우 지점주)-->
		 <%if( (("".equals(cafeNo) || cafeNo == null) && "admin".equals(loginType)) || ((!"".equals(ownerId)) && (loginId.equals(ownerId))) ) { %>
		 		
			<div class="divPadding text-right">
				<button type="button" class="btn btn-info" onclick="location.href='<%=url%>'">등록</button>
			</div>
      	 <%}%>
		
		<!-- 페이징 처리-->
		<div class="text-center fontWeight300">
			
			<ul class="pagination pagination-sm">
				<%if(firstPageNo > countPerPage){ %>
					<li class="page-item">
						<a href="<%=request.getContextPath() %>/searchNoticeList.do?pageNo=<%=firstPageNo - countPerPage%><%=pagingUrl %>">
							이전
						</a>
					</li>
				<%} %>
				<%for(int pNo = firstPageNo; pNo <= lastPageNo; pNo++){ %>
					<li class="page-item">
						<a class="page-link" <%if(pNo == currentPageNo){ %> style="color:gray;"<% } %> href="<%=request.getContextPath() %>/searchNoticeList.do?pageNo=<%=pNo %><%=pagingUrl %>">
							<%=pNo %>
						</a>
					</li>
				<%} %>
				<%if(lastPageNo < totalPageCount){ %>
					<li class="page-item">
						<a href="<%=request.getContextPath() %>/searchNoticeList.do?pageNo=<%=firstPageNo + countPerPage%><%=pagingUrl %>">
							다음
						</a>
					</li>
				<%} %>
			<ul>
		</div>
						
	</div>
	
	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>