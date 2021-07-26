<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.gsRecruit.vo.GsRecruitVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GsRecruitVO grv = (GsRecruitVO)request.getAttribute("grv");
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
	
	<div class="container divPadding marginBottom30">
		
		<form class="form-horizontal divPadding" id="fm" action="<%=request.getContextPath() %>/gsRecruitUpdate.do" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<input type="hidden" class="form-control" id="gsRecruitNo" name="gsRecruitNo" value="<%=grv.getGsRecruitNo()%>">
			</div>
			<div class="form-group">

			<div class="form-group">
				<label class="radio-inline" for="Y"><input type="radio" id="Y" value="Y" name="gsOpenYn" id="yes" checked="checked">공개</label>
				<label class="radio-inline" for="N"><input type="radio" id="N" value="N" name="gsOpenYn" id="no">비공개</label>
				<label for="gsRecruitTitle" class="control-label col-xs-2">제목</label>
				<div class="col-xs-8">
					<input type="text" class="form-control form-inline"
						   id="gsRecruitTitle" name="gsBoardTitle" value="<%=grv.getGsBoardTitle()%>">
				</div>				
			</div>
			
					<label class="control-label col-xs-2" for="gsRecruitName">그룹명:</label>
					<div class="col-xs-8">
						<input type="text" class="form-control" id="gsRecruitName" name="gsName" value="<%=grv.getGsName()%>">
					</div>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-2" for="gsRecruitLeader">그룹장 <%=grv.getGsLeader() %></label>
				<div class="col-xs-8">
					<input type="text" class="form-control" id="gsRecruitLeader" name="gsLeader" value="<%=grv.getGsLeader()%>">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-2" for="gsMemberCnt">인원수</label>
				<div class="col-xs-8">
					<input type="number" class="form-control" id="gsMemberCnt" name="gsMemberCnt" value="<%=grv.getGsMemberCnt()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-2" for="gsStartDate">시작일:</label>
				<div class="col-xs-8">
					<input type="date" class="form-control" id="gsStartDate" name="gsStartDate" value="<%=grv.getGsStartDate()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-2" for="gsEndDate">종료일</label>
				<div class="col-xs-8">
					<input type="date" class="form-control" id="gsEndDate" name="gsEndDate" value="<%=grv.getGsEndDate()%>">
				</div>
			</div>
			
			<div class="form-group" >
				<label for="gsRecruitComent" class="control-label col-xs-2">내용</label>
				<div class="col-xs-8">
					<textarea class="inputContent form-control form-inline" rows="10" 
							  id="gsRecruitComent" name="gsBoardContent" ><%=grv.getGsBoardContent()%></textarea>
				</div>				
			</div>
			
			<div class="form-group">
					<label class="control-label col-xs-2" for="pw">비밀번호</label>
					<div class="col-xs-8">
						<input type="password" class="form-control" id="pw" name="gsPw" value="<%=grv.getGsPw()%>">
					</div>
			</div>
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
	</div>
		<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	<script type="text/javascript" src="../../js/gsRecruit/insertForm.js"></script>
</body>
</html>