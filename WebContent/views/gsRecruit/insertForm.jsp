<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% // 로그인 세션 확인
	String loginId = (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  <script src="../../js/lib/jquery-3.6.0.js"></script>
<!--  	 <script src="../../js/gsRecruit/insertForm.js"></script> -->
	<script type="text/javascript" src="../../js/gsRecruit/insertForm.js"></script>

	
	<title>그룹스터디</title>
	
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	
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
		
	<!-- 해당 페이지 내용 -->

		
		<form class="form-horizontal divPadding" id="fm" action="<%=request.getContextPath() %>/gsRecruitInsert.do" method="post" enctype="multipart/form-data">

			<div class="form-group">
<!-- 				<label class="radio-inline" for="Y"><input type="radio" id="Y" value="Y" name="gsOpenYn" id="yes" checked="checked">공개</label> -->
<!-- 				<label class="radio-inline" for="N"><input type="radio" id="N" value="N" name="gsOpenYn" id="no">비공개</label> -->
				<label for="gsRecruitTitle" class="control-label col-xs-2">제목</label>
				<div class="col-xs-8">
					<input type="text" class="form-control form-inline"
						   id="gsRecruitTitle" name="gsBoardTitle">
				</div>				
			</div>
			
			<div class="form-group">
					<label class="control-label col-xs-2" for="gsRecruitName">그룹명:</label>
					<div class="col-xs-8">
						<input type="text" class="form-control" id="gsRecruitName" name="gsName" placeholder="Enter gs name">
					</div>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-2" for="gsRecruitLeader">그룹장:</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" id="gsRecruitLeader" name="gsLeader" value="<%=loginId%>" readonly="readonly">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-2" for="gsMemberCnt">인원수</label>
				<div class="col-xs-8">
					<input type="number" class="form-control" id="gsMemberCnt" name="gsMemberCnt" placeholder="Enter gs Cnt">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-2" for="gsStartDate">시작일:</label>
				<div class="col-xs-8">
					<input type="date" class="form-control" id="gsStartDate" name="gsStartDate" placeholder="Enter StartDate">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-2" for="gsEndDate">종료일</label>
				<div class="col-xs-8">
					<input type="date" class="form-control" id="gsEndDate" name="gsEndDate" placeholder="Enter EndDate">
				</div>
			</div>
			
			<div class="form-group" >
				<label for="gsRecruitComent" class="control-label col-xs-2">내용</label>
				<div class="col-xs-8">
					<textarea class="inputContent form-control form-inline" rows="10" 
							  id="gsRecruitComent" name="gsBoardContent"></textarea>
				</div>				
			</div>
			
<!-- 			<div class="form-group"> -->
<!-- 					<label class="control-label col-xs-2" for="pw">비밀번호</label> -->
<!-- 					<div class="col-xs-8"> -->
<!-- 						<input type="password" class="form-control" id="pw" name="gsPw" placeholder="Enter EndDate"> -->
<!-- 					</div> -->
<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<!-- 				<label for="atchFileId" class="control-label col-xs-2">첨부파일</label> -->
<!-- 				<div class="col-xs-8" style="line-height: 40px;"> -->
<!-- 					<input type="file"  -->
<!-- 						   id="atchFileId" name="atchFileId" multiple="multiple"> -->
<!-- 				</div>				 -->
<!-- 			</div> -->
			
			<div class="text-center">
				<button type="submit" class="btn btn-info">등록</button>
				<a href="gsRecruitList.do"><button type="button" class="btn">취소</button></a>
			</div>
			
		</form>	
		
	</div>
	
		<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	<script type="text/javascript" src="../../js/gsRecruit/insertForm.js"></script>
</body>
</html>