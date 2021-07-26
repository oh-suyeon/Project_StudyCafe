<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.review.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

List<ReviewVO> revList = (List<ReviewVO>)request.getAttribute("revList");

%>

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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신규회원 등록</title>
<jsp:include page="../include/head.jsp"/>
</head>
<body>
<!-- 네비-->
<jsp:include page="../include/cafeNav1.jsp"/>
<!-- 상세 네비-->
<jsp:include page="../include/cafeNav2.jsp"/>

		<!-- 해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">스터디 카페 리뷰</span>
		</div>
	
		<form class="form-horizontal divPadding"method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/reviewInsert.do">
			
			<input type="hidden" value="<%=userVO.getUserId()%>" name="userId">
			<!-- 기타 입력 -->
			<input type="hidden" name="boardCode" value="03">
			<input type="hidden" name="cafeNo" value="1">
			
			<div class="form-group">
				<label for="reviewTitle" class="control-label col-xs-2">제목</label>
				<div class="col-xs-8">
					<input type="text" class="form-control form-inline"
						   id="reviewTitle" name="reviewTitle">
				</div>				
			</div>
			
			<div class="form-group">
				<label for="reviewContent" class="control-label col-xs-2">내용</label>
				<div class="col-xs-8">
					<textarea class="inputContent form-control form-inline" rows="10"
							  id="reviewContent" name="reviewContent"></textarea>
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
				<button type="button" class="btn btn-warning" onclick="location.href='<%=request.getContextPath() %>/reviewList.do'">취소</button>
				<button type="reset" class="btn">초기화</button>
			</div>
		</form>	
	</div>
	
	
	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>	
</body>
</html>