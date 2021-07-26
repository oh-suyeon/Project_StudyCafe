<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.common.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@page import="daily.review.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>🌸리뷰 글 보기</title>
<jsp:include page="../include/head.jsp"/>
<style>
*{
	margin: 0px;
	padding: 0px;
	
}
</style>
</head>
<body>
<!-- 네비-->
<jsp:include page="../include/cafeNav1.jsp"/>
<!-- 상세 네비-->
<jsp:include page="../include/cafeNav2.jsp"/>

<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">스터디 카페 리뷰</span>
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
						<td><%=reviewVO.getReviewTitle() %></td>
						<th class="text-right">작성일</th>
						<td><%=reviewVO.getReviewRegDate() %></td>
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
						<td colspan="4" style="padding: 20px 90px;"><%=reviewVO.getReviewContent() %></td>
					</tr>
				</tbody>
			</table>
		</div>
	<!-- 버튼 -->
		<div class="divPadding text-right">
			<a href="reviewList.do"><button class="btn" type="button">목록</button></a>
			<a href="reviewUpdate.do?reviewNo=<%=reviewVO.getReviewNo() %>">
			<button class="btn btn-info authorityState"  type="button">리뷰 수정</button></a>
			<a href="reviewDlete.do?reviewNo=<%=reviewVO.getReviewNo() %>">
			<button class="btn btn-warning authorityState"  type="button">리뷰 삭제</button>
			</a>		
		</div>
		
	</div>

	
	
<!-- 풋터 -->
<jsp:include page="../include/footer.jsp"/>
</body>
</html>