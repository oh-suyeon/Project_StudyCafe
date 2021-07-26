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
	String loginType = (String)session.getAttribute("loginType");
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

	List<ReviewVO> revList = (List<ReviewVO>)request.getAttribute("revList");
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
	
	PagingVO pagingVO = (PagingVO)request.getAttribute("pagingVO");
	
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰</title>
<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
  //SHC 스크립트
  $(document).ready(function() {
	  
	var a = 	  $("#test option:selected").val();
	
	var c = "reviewView.do?reviewTitle="+$("#inputVal").val();
	$("button").click(function(){
		$('.change').prop('href', c);
		});
  });
  
  </script>
  <style type="text/css">
  	a{
  		color: black;
  	}
  </style>
  
  
</head>


<body>
	

<!-- 네비-->
<jsp:include page="../include/cafeNav1.jsp"/>
<!-- 상세 네비-->
<jsp:include page="../include/cafeNav2.jsp"/>




<!-- 해당 페이지 내용 -->


		

<!-- 리뷰 페이지 내용 -->
		<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">스터디 카페 리뷰</span>
		</div>



<!-- 검색 -->

<div class="divPadding fontWeight300">

	<div class="form-group  text-right">
		<div class="inlineBlock" style="display: inline-block;"> <!-- common.css의 inlineBlock이 안 먹힘. 내부 스타일을 씀-->
							<select class="form-control" name="selectSearch">
								<option value="reviewTitle">제목</option>
								<option value="reviewContent">내용</option>
							</select>
		</div>
<!-- 	<input type="text" id="inputVal" >
	<a href="#" class="change"><button type="button">🔎</button></a> -->
		<div class="inlineBlock" style="display: inline-block;">
			<input type="text" class="form-control form-inline" id="inputSearch" name="inputSearch">
		</div>
		<div class="inlineBlock" style="display: inline-block;">
			<button type="submit" class="btn">검색</button>
		</div>
	</div>
		
	
	<!-- 게시글 목록 출력 -->
	<div class="divPadding">
	<table  id="tb" class="table table-striped table-hover">
		<colgroup>
			<col style="width: 80px;">
			<col style="width: auto;">
			<col style="width: 150px;">
		</colgroup>		
		<tr>
			<th class="alignCenter">글 번호</th>
			<th>글 제목</th>
<!-- 			<th>작성자 아이디</th> -->
			<th class="alignCenter">등록 일자</th>
<!-- 			<td>글 내용</td> -->
<!-- 			<td>첨부파일 그룹 번호</td> -->
<!-- 			<td>게시판 유형</td> -->
<!-- 			<td>지점 번호</td> -->
			
		</tr>
		<!--  -->
	<% 
		int reviewSize = revList.size();
			
		if(reviewSize > 0) {
			for(int i=0; i<reviewSize; i++){
	%>	
		<tr>
			<td class="alignCenter"><%= revList.get(i).getReviewNo() %></td>			
			<td><a href="reviewView.do?reviewNo=<%= revList.get(i).getReviewNo()%>"><%= revList.get(i).getReviewTitle() %></a></td>			
			<td class="alignCenter"><%= revList.get(i).getReviewRegDate() %></td>			
<%-- 			<td><%= revList.get(i).getUserId() %></td>			 --%>
<%-- 			<td><%= revList.get(i).getReviewContent() %></td>			 --%>
<%-- 			<td><%= revList.get(i).getAtchFileId() %></td>			 --%>
<%-- 			<td><%= revList.get(i).getBoardCode() %></td>			 --%>
<%-- 			<td><%= revList.get(i).getCafeNo() %></td>			 --%>
		</tr>
	<%
		 } // for문
	%>

	
			
	<!-- 페이징 처리 시작 -->
	
	<tr>
		<td colspan="2" align="center">
			<%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) { %>
			<a href="reviewList.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize() %>">[이전]</a>
			<%} %>
			<%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++){ %>
			<a <%if(pNo == pagingVO.getCurrentPageNo()){ %> style="color:orange;" <%} %> href="reviewList.do?pageNo=<%=pNo %>"><button type="button"><%=pNo %></button> </a>
			<%} %>
			<%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) { %>
			<a  href="reviewList.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize() %>">[다음]</a>
			<%} %>
		</td>
		 
		<td >
			<a href="reviewInsert.do"><button type="button" class="btn btn-info"> 등록</button> </a>
		</td>
		
	</tr>
	
	
	
	
		
	<!-- 페이징 처리 끝 -->	
		
			
	<% 		
		}else{ // 회원정보가 존재하지 않으면...
	%>
		
		<tr>
			<td colspan="5">회원정보가 없습니다.</td>
		</tr>
	
	<%
		}
	%>
		
	
	</table>
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
</div>
	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>

</body>
</html>