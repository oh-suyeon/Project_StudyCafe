
<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.common.vo.PagingVO"%>
<%@page import="daily.gsRecruit.vo.GsRecruitVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<GsRecruitVO> gsRecruitList = (List<GsRecruitVO>) request.getAttribute("gsRecruit");

	// 	String msg = request.getParameter("msg") == null ?

	PagingVO pagingVO = (PagingVO) request.getAttribute("pagingVO");
%>

<% // 로그인 세션 확인
UserVO userVO = (UserVO)session.getAttribute("userVO");
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
	<style type="text/css">
		a{
			color: black;
		}
	</style>
	
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
		
		<!-- 검색 -->
		<div class="divPadding text-right fontWeight300">
			<form action="<%=request.getContextPath() %>/gsRecruitList.do" method="get">
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
		
	<div class="divPadding">	
		<table id="tb" class="table table-striped table-hover">
    		<colgroup>
				<col style="width: 80px;">
				<col style="width: auto;">
				<col style="width: 150px;">
			</colgroup>
	    	<thead>
		      <tr>
		        <th class="alignCenter">번호</th>
		        <th>제목</th>
		        <th class="alignCenter">작성자</th>
		        <th  class="alignCenter">작성일</th>
		      </tr>
		    </thead>
			<tbody  class="fontWeight300">
				<%
					int gsRecruitSize = gsRecruitList.size();
					if (gsRecruitSize > 0) {
						for (int i = 0; i < gsRecruitSize; i++) {
				%>
				<tr class="cursorPointer" style="cursor: pointer;">
					<td class="alignCenter"><%=gsRecruitList.get(i).getGsRecruitNo() %></td>
					<td><a style="display: block; width: 100%;" href="gsRecruitDetail.do?gsRecruitNo=<%=gsRecruitList.get(i).getGsRecruitNo()%>"><%=gsRecruitList.get(i).getGsBoardTitle() %></a></td>
					<td class="alignCenter"><%=gsRecruitList.get(i).getGsLeader()%></td>
					<td class="alignCenter"><%=gsRecruitList.get(i).getGsRegDate() %></td>
				</tr>	
		
				<%
						}// for문
					}else {
				%>
				<tr>
					<td colspan="4">조회결과가 없습니다.</td>
				</tr>
				<%
					} 
				%>			
			</tbody>
		</table>

				<div class="divPadding text-right">
				<button type="button" class="btn btn-default" id="writeBtn" onclick="location.href='<%=request.getContextPath() %>gsRecruitInsert.do'">글작성</button></a>
				</div>

		
			<!-- 페이징 처리-->
			<div class="text-center fontWeight300">
				<ul class="pagination pagination-sm">
					<%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) {%>
					<li class="page-item">
					<a href="gsRecruitList.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize()%>">[이전]</a>
					</li>
					<%} %>
					
					<%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++) {%>
					<li class="page-item">
					<a <%if(pNo == pagingVO.getCurrentPageNo()) {%> style="font-weight: bold;"<%} %> href="gsRecruitList.do?pageNo=<%=pNo %>">[<%=pNo %>]</a>
					</li>
					<%} %>
					
					<%if(pagingVO.getLastPageNo() > pagingVO.getTotalCount()) {%>
					<li class="page-item">
					<a href="gsRecruitList.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize()%>">[다음]</a>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
	</div>	
		<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>