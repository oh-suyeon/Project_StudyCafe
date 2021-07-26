<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.common.vo.PagingVO"%>
<%@page import="daily.review.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<% // 로그인 세션 확인
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

<%

	List<UserVO> userList = (List<UserVO>)request.getAttribute("userList");
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
	PagingVO pagingVO = (PagingVO)request.getAttribute("pagingVO");
	
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리 리스트</title>
<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
  //SHC 스크립트
  $(document).ready(function() {
	  
	var a = 	  $("#test option:selected").val();
	
	var c = "uesrView.do?userTitle="+$("#inputVal").val();
	$("button").click(function(){
		$('.change').prop('href', c);
		});
  });
  
  	 
  </script>
  
  
</head>


<body>
	

<!-- 네비-->
<jsp:include page="../include/mainNav1.jsp"/>
<!-- 상세 네비-->
<jsp:include page="../include/mainNav2.jsp"/>




<!-- 해당 페이지 내용 -->
<div class="container divPadding marginBottom30">
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">회원 관리</span>
		</div>
			<!-- 검색 -->
		<div class="divPadding text-right fontWeight300">
			<form action="<%=request.getContextPath() %>/searchUserList.do" method="get">
				<div class="form-group">
					<div class="inlineBlock" style="display: inline-block;"> <!-- common.css의 inlineBlock이 안 먹힘. 내부 스타일을 씀-->
						<select class="form-control" name="selectSearch">
							<option value="userId">회원ID</option>
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
					<col style="width: auto;">
					<col style="width: auto;">
					<col style="width: auto;">
					<col style="width: auto;">
					<col style="width: auto;">
					<col style="width: auto;">
					<col style="width: auto;">
					<col style="width: auto;">
					<col style="width: auto;">
					<col style="width: auto;">
					<col style="width: auto;">
					
				</colgroup>
				<thead>
					<tr>
						<th class="alignCenter">아이디</th>
						<th class="alignCenter">이름</th>
						<th class="alignCenter">생일</th>
						<th class="alignCenter">전화번호</th>
						<th class="alignCenter">이메일</th>
						<th class="alignCenter">주소</th>
						<th class="alignCenter">마일리지</th>
						<th class="alignCenter">탈퇴여부</th>
						<th class="alignCenter">가입일자</th>
					</tr>
				</thead>
				<tbody class="fontWeight300">
					<% 
						int userSize = userList.size();
						if(userSize > 0){
							for(int i=0; i<userSize; i++){	
					%>
						<tr class="cursorPointer" style="cursor: pointer;" onclick="location.href='/userSelect.do?userId=<%=userList.get(i).getUserId() %>'">
							<td class="alignCenter"><%= userList.get(i).getUserId() %></td>	
							<td class="alignCenter"><%= userList.get(i).getUserName() %></td>	
							<td class="alignCenter"><%= userList.get(i).getUserBirth() %></td>	
							<td class="alignCenter"><%= userList.get(i).getUserHp() %></td>	
							<td class="alignCenter"><%= userList.get(i).getUserEmail() %></td>	
							<td class="alignCenter"><%= userList.get(i).getUserZip() %>
							<td class="alignCenter"><%= userList.get(i).getUserMileage() %></td>	
							<td class="alignCenter"><%= userList.get(i).getUserDeleteYn() %></td>	
							<td class="alignCenter"><%= userList.get(i).getUserRegDate() %></td>
							
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
					<!-- 페이징 처리 시작 -->
	
						<tr>
							<td colspan="9" align="center">
								<%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) { %>
								<a href="userList.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize() %>">[이전]</a>
								<%} %>
								<%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++){ %>
								<a <%if(pNo == pagingVO.getCurrentPageNo()){ %> style="color:orange;" <%} %> href="userList.do?pageNo=<%=pNo %>"><button type="button"><%=pNo %></button> </a>
								<%} %>
								<%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) { %>
								<a  href="userList.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize() %>">[다음]</a>
								<%} %>
							</td>
							
						</tr>
					<!-- 페이징 처리 끝 -->	
				</tbody>
			</table>
			
		</div>

</div>
	<div class="divPadding">
<%
if(msg.equals("성공")){
%>	
<script type="text/javascript">
	alert('정상적으로 처리 되었습니다.')
</script>	
<%
}
%>


	</div>


	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>

</body>
</html>