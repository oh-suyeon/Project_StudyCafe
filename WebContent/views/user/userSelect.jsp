<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.notice.vo.NoticeVO"%>					
<%@page import="daily.common.vo.AtchFileVO" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	UserVO userVO = (UserVO) request.getAttribute("userVO");
	Boolean chk =(Boolean)request.getAttribute("chk");
	
	String yn = "";
	if(chk){
		yn = "Y";
	}else{
		yn = "N";
	}
%>

<% 

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>회원 관리업데이트</title>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<script type="text/javascript">
	$(document).ready(function() {
		$('#blacklistChoice').click(function() {
			$("#fm").submit();
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
			<span class="textUnderline fontSize2">전체 공지사항</span>
		</div>
		
		<div class="divPadding">
			<table id="tb" class="table table-striped">
				<colgroup>
					<col style="width: auto;">
				</colgroup>
				
				<tbody class="fontWeight300">
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
						<th class="alignCenter">블랙리스트</th>
								
					</tr>
					<tr>
						<td class="alignCenter"><%= userVO.getUserId() %></td>		
						<td class="alignCenter"><%= userVO.getUserName() %></td>	
						<td class="alignCenter"><%= userVO.getUserBirth() %></td>	
						<td class="alignCenter"><%= userVO.getUserHp() %></td>	    
						<td class="alignCenter"><%= userVO.getUserEmail() %></td>	
						<td class="alignCenter"><%= userVO.getUserZip() %>          
						<td class="alignCenter"><%= userVO.getUserMileage() %></td>	
						<td class="alignCenter"><%= userVO.getUserDeleteYn() %></td>
						<td class="alignCenter"><%= userVO.getUserRegDate() %></td>	
						<td class="alignCenter"><%= yn %></td>	
					</tr>
					
				</tbody>
			</table>
		</div>
		
		<!-- 버튼 -->
		<div class="divPadding text-right">
						<a href="userList.do"><button class="btn" type="button">목록</button></a>
						<button class="btn btn-info authorityState"  type="button" id="blacklistChoice">블랙리스트 지정</button>
						<a href="blacklistDelete.do?userId=<%=userVO.getUserId() %>">
						<button class="btn btn-info authorityState"  type="button" id="blacklistChoice">블랙리스트 해제</button></a>
						
						
						
		</div>
		
	</div>
	
	<form id="fm" method="post" action="<%=request.getContextPath() %>/blacklistInsert.do">
		<input type="hidden" name="userId1" value="<%=userVO.getUserId() %>">
		<input type="hidden" name="cafeNo" value="1">
		<input type="hidden" name="userId2" value="<%=userVO.getUserId() %>">
		<input type="hidden" name="blacklistReason" value="자리비움">
		<input type="hidden" name="blacklistDeleteYn" value="N">
	</form>
	
	
	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>