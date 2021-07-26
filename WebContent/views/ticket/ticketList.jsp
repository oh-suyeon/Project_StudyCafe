<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="daily.ticket.vo.TicketVO"%>
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
	List<TicketVO> ticketList = (List<TicketVO>)request.getAttribute("ticketList");
	List<UserVO> userList = (List<UserVO>)request.getAttribute("userList");
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
	PagingVO pagingVO = (PagingVO)request.getAttribute("pagingVO");
	
	String store ="";
	Date time;
	for(int i = 0;i<ticketList.size();i++){
		store = ticketList.get(i).getCafeNo();
	}
	
	if(store.equals("1")){
		store="중구청점";
	}else if(store.equals("2")){
		store="서대전점";
	}else if(store.equals("3")){
		store="중구청점";
	}else if(store.equals("4")){
		store="중구청점";
	}else if(store.equals("5")){
		store="신당점";
	}else if(store.equals("6")){
		store="중구청점";
	}else if(store.equals("7")){
		store="중구청점";
	}else if(store.equals("8")){
		store="중구청점";
	}else if(store.equals("12")){
		store="서대전점";
	}else if(store.equals("13")){
		store="중구청점";
	}
	
	
	
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 내역</title>
<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  
</head>


<body>
	

<!-- 네비-->
<jsp:include page="../include/mainNav1.jsp"/>
<!-- 상세 네비-->
<jsp:include page="../include/mainNav2.jsp"/>




<!-- 해당 페이지 내용 -->
<div class="container divPadding marginBottom30">
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">결제 내역</span>
		</div>
			<!-- 검색 -->

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
					
				</colgroup>
				<thead>
					<tr>
						<th class="alignCenter">결제 번호</th>
						<th class="alignCenter">구매자ID</th>
						<th class="alignCenter">지점명</th>
						<th class="alignCenter">구매 일자</th>
						<th class="alignCenter">좌석</th>
						<th class="alignCenter">환불</th>
					</tr>
				</thead>
				<tbody class="fontWeight300">
					<% 
						int userSize = userList.size();
						if(userSize > 0){
							for(int i=0; i<userSize; i++){	
					%>
						<tr class="cursorPointer" >
							<td class="alignCenter"><%= ticketList.get(i).getBuyTicketNo() %></td>	
							<td class="alignCenter"><%= ticketList.get(i).getUserId() %></td>	
							<td class="alignCenter"><%= store %></td>
							<td class="alignCenter"><%= ticketList.get(i).getBuyTicketDate() %></td>	
							<td class="alignCenter"><%= ticketList.get(i).getBuyTicketNo() %></td>	
							<td class="alignCenter"><a href="#"><button type="button" class="btn btn-warning authorityState">신청</button></a></td>
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