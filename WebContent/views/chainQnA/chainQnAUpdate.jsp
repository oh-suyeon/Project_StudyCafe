<%@page import="daily.chainQnA.vo.ChainQnAVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ChainQnAVO chainQnAVO = (ChainQnAVO)request.getAttribute("chainQnAVO");
	String chainQnaHp = chainQnAVO.getChainQnaHp();
	String chainQnaHp1 = chainQnaHp.substring(0, 3);
	String chainQnaHp2 = chainQnaHp.substring(3, 7);
	String chainQnaHp3 = chainQnaHp.substring(7);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>가맹 문의 수정</title>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<script src="<%= request.getContextPath() %>/js/chainQnA/chainQnAUpdate.js"></script>
	<script type="text/javascript">
<%-- 		$(function () {
			if(userVO != null) {
				$("#userId").val("<%=loginId%>");
				$("#userName").val("<%=loginName%>");
				$("#chainQpw").prop("readonly", true);
				//회원인 경우 비밀번호가 유저세션 비밀번호랑 일치하는지 확인해야됨..
			}
		}); --%>
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
			<span class="textUnderline fontSize2">가맹 문의 수정</span>
		</div>
		
		<form class="form-horizontal divPadding" id="fm" name="fm" action="<%=request.getContextPath() %>/chainQnAUpdate.do" method="post">

			<div class="form-group">
				<label for="chainQnaTitle" class="control-label col-xs-2">제목</label>
				<div class="col-xs-8">
					<input type="text" class="form-control form-inline"
						   id="chainQnaTitle" name="chainQnaTitle" value="<%=chainQnAVO.getChainQnaTitle()%>">
				</div>				
			</div>
			<div class="form-group">
				<label for="userId" class="control-label col-xs-2">아이디</label>
				<div class="col-xs-3"><!-- 작성자 아이디 자동 입력 세션 사용 //작성자 아이디는 회원만-->
					<input type="text" class="form-control form-inline"
						   id="userId" name="userId" readonly="readonly" placeholder="비회원은 입력✖" value="<%=chainQnAVO.getUserId()%>">
				</div>
				<label for="writerName" class="control-label col-xs-2">이름</label>
				<div class="col-xs-3"><!-- 작성자 이름 자동 입력 세션 사용//비회원 직접 입력 -->
					<input type="text" class="form-control form-inline"
						   id="writerName" name="writerName" value="<%=chainQnAVO.getWriterName()%>">
				</div>								
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
							  id="chainQnaContent" name="chainQnaContent"><%=chainQnAVO.getChainQnaContent() %></textarea>
				</div>				
			</div>
			<div class="form-group" >
				<label class="control-label col-sm-2">연락처</label>
				<div class="col-sm-10 form-inline">
					<input type="text" class="form-control" id="chainQnaHp1" name="chainQnaHp1" style="width: 80px;"
						placeholder="010" value="<%=chainQnaHp1%>">
						<span>-</span>
						<input type="text" class="form-control" id="chainQnaHp2" name="chainQnaHp2" style="width: 80px;"
						placeholder="1234" value="<%=chainQnaHp2%>">
						<span>-</span>
						<input type="text" class="form-control" id="chainQnaHp3" name="chainQnaHp3" style="width: 80px;"
						placeholder="5678" value="<%=chainQnaHp3%>">
				</div>				
			</div>
			
			<div class="text-center">
					<button type="button" class="btn btn-primary" onclick="save()">저장</button>
					<button type="reset" class="btn btn-info">초기화</button>
					<a href="/chainQnADetail.do?chainQnaNo=<%=chainQnAVO.getChainQnaNo()%>"><button type="button" class="btn btn-info">취소</button></a>
			</div>
			
			<div>
				<input type="hidden" name="chainQnaNo" value="<%=chainQnAVO.getChainQnaNo() %>">
			</div>
		</form>	
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>