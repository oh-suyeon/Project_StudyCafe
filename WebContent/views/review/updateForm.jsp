<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.common.vo.AtchFileVO"%>
<%@page import="daily.review.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ReviewVO reviewVO = (ReviewVO)request.getAttribute("reviewVO");
	List<AtchFileVO> atchFileList = (List<AtchFileVO>)request.getAttribute("atchFileList");
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
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

	<form method="post" action="<%=request.getContextPath() %>/reviewUpdate.do" enctype="multipart/form-data" class="form-horizontal divPadding">
		<input  class="form-control form-inline" type="hidden" name="atchFileId" value="<%=reviewVO.getAtchFileId()%>">
		
		<div class="form-group">
		<label for="reviewTitle" class="control-label col-xs-3">제목</label>
				<div class="col-xs-8">
			<input type="text" name="reviewTitle" value="<%=reviewVO.getReviewTitle() %>">
		</div>
		</div>
		<div class="form-group">
		<label for="reviewUserId" class="control-label col-xs-3">사용자</label>
			<div class="col-xs-8">
			<input type="text" name="userId" value="<%=reviewVO.getUserId() %>" readonly="readonly">
			
		
			</div>
		</div>
		<div class="form-group">
			
			
			<label for="reviewUserId" class="control-label col-xs-3">등록일</label>	
			<div class="col-xs-8">
				<input type="text" name="reviewRegDate" value="<%=reviewVO.getReviewRegDate() %>" readonly="readonly">
			</div>	
		</div>
		<div class="form-group">
				<label for="reviewContent" class="control-label col-xs-3">내용</label>
				<div class="col-xs-8">
			<textarea name="reviewContent" style="width: 50%;" rows="8" class="inputContent form-control form-inline"><%=reviewVO.getReviewContent() %></textarea>
				</div>
			</div>
		<div class="form-group">
			<div class="col-xs-4" style="line-height: 40px;">
					<%if(atchFileList != null){ %>
					
						<%for(AtchFileVO fileVO : atchFileList){ %>
						
						<div>
						<a href="<%=request.getContextPath() %>/filedownload.do?fileId=<%=fileVO.getAtchFileId()%>&fileSn=<%=fileVO.getFileSn()%>">
							<%=fileVO.getFileOriginalName() %>
						</a>
						</div>
						
						<%} %>
					
					<%} %>
			</div>
		
			
				<input type="file" name="atchFile">
				</div> 
		
		<div class="form-group">	
			
			<input type="hidden" name="boardCode" value="<%=reviewVO.getBoardCode() %>">
			
		</div>
		<div class="form-group">
			<div class="col-xs-8" style="line-height: 40px;">
			<input type="hidden" name="cafeNo" value="<%=reviewVO.getCafeNo() %>">
			</div>	
		</div>
		
		<div class="text-center">
		<a href="reviewList.do"><button class="btn" type="button">목록</button></a>	
		<button type="submit" class="btn btn-info" >리뷰 수정</button>
		</div>
			
			

		
		
	</form>
	</div>
	<!-- 풋터-->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>