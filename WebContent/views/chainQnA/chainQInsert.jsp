<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 로그인 세션 확인
	AdminVO adminVO = (AdminVO)session.getAttribute("adminVO")==null?null:(AdminVO)session.getAttribute("adminVO");
	OwnerVO ownerVO = (OwnerVO)session.getAttribute("ownerVO")==null?null:(OwnerVO)session.getAttribute("ownerVO");
	UserVO userVO = (UserVO)session.getAttribute("userVO")==null?null:(UserVO)session.getAttribute("userVO");
	
	// 로그인 확인 작업
	String loginId = (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType");
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
	<title>가맹 문의 등록</title>
	
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<script src="<%= request.getContextPath() %>/js/chainQnA/chainQInsert.js"></script>
</head>
<body>
	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	
	<!-- 해당 페이지 내용 -->
	
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">가맹 문의 등록</span>
		</div>
		
		<form class="form-horizontal divPadding" id="fm" name="fm" action="<%=request.getContextPath() %>/chainQInsert.do" method="post">

			<div class="form-group">
				<label for="chainQnaTitle" class="control-label col-xs-2">제목</label>
				<div class="col-xs-8">
					<input type="text" class="form-control form-inline"
						   id="chainQnaTitle" name="chainQnaTitle">
				</div>				
			</div>
			<div class="form-group">
				<label for="userId" class="control-label col-xs-2">아이디</label>
				<div class="col-xs-3"><!-- 작성자 아이디 자동 입력 세션 사용 //작성자 아이디는 회원만-->
				<%if(userVO != null) { %>
					<input type="text" class="form-control form-inline"
						   id="userId" name="userId" readonly="readonly" value="<%=loginId%>">
					
				<%} else {%>
					<input type="text" class="form-control form-inline"
						   id="userId" name="userId" readonly="readonly" placeholder="비회원은 입력✖">
				<%} %>
				</div>
				<label for="writerName" class="control-label col-xs-2">이름</label>
				<div class="col-xs-3"><!-- 작성자 이름 자동 입력 세션 사용//비회원 직접 입력 -->
				
				<%if(userVO != null) { %>
					<input type="text" class="form-control form-inline"
						   id="writerName" name="writerName" value="<%=loginName%>">
					
				<%} else {%>
					<input type="text" class="form-control form-inline"
						   id="writerName" name="writerName">
				<%} %>
				</div>								
			</div>
			<div class="form-group"><!-- 비밀번호는 비회원만 입력// 회원은 회원 비밀번호입력 -->
				<label for="chainQnaPw" class="control-label col-xs-2">비밀번호</label>
				<div class="col-xs-4">
					<input type="password" class="form-control form-inline"
						   id="chainQnaPw" name="chainQnaPw">
				</div>				
				<div class="col-xs-4">비밀번호는 문의글 조회시 사용됩니다.</div>
			</div>
			<div class="form-group">
				<label for="chainQnaSido" class="control-label col-xs-2">문의할 지역</label>
				<div class="col-xs-8">
					<select class="control-label col-sm-4" id="chainQnaSido" name="chainQnaSido" style="height: 40px;">
						<option>서울특별시</option>
						<option>부산광역시</option>
						<option>대구광역시</option>
						<option>인천광역시</option>
						<option>광주광역시</option>
						<option selected="selected">대전광역시</option>
						<option>울산광역시</option>
						<option>세종특별자치시</option>
						<option>경기도</option>
						<option>강원도</option>
						<option>충청북도</option>
						<option>충청남도</option>
						<option>전라북도</option>
						<option>전라남도</option>
						<option>경상북도</option>
						<option>경상남도</option>
						<option>제주특별자치도</option>
					</select>
				</div>				
			</div>

			<div class="form-group" >
				<label for="chainQnaContent" class="control-label col-xs-2">내용</label>
				<div class="col-xs-8">
					<textarea class="inputContent form-control form-inline" rows="10" 
							  id="chainQnaContent" name="chainQnaContent"></textarea>
				</div>				
			</div>
			<div class="form-group" >
				<label class="control-label col-sm-2">연락처</label>
				<div class="col-sm-10 form-inline">
					<input type="text" class="form-control" id="chainQnaHp1" name="chainQnaHp1" style="width: 80px;"
						placeholder="010" maxlength="3">
						<span>-</span>
						<input type="text" class="form-control" id="chainQnaHp2" name="chainQnaHp2" style="width: 80px;"
						placeholder="1234" maxlength="4">
						<span>-</span>
						<input type="text" class="form-control" id="chainQnaHp3" name="chainQnaHp3" style="width: 80px;"
						placeholder="5678" maxlength="4">
				</div>				
			</div>
			
			<div class="text-center">
					<button type="button" class="btn btn-primary" onclick="save()">저장</button>
					<button type="reset" class="btn btn-info">초기화</button>
					<a href="<%=request.getContextPath() %>/chainQnAList.do"><button type="button" class="btn btn-info">취소</button></a>
			</div>
			
		</form>	
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>