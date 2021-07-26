<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.chainQnA.vo.ChainQnAVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ChainQnAVO chainQnAVO = (ChainQnAVO)request.getAttribute("chainQnAVO");
List<ChainQnAVO> chainAList = (List<ChainQnAVO>)request.getAttribute("chainAList");
if(chainAList == null) {
	chainAList = new ArrayList<ChainQnAVO>();
}

// 로그인 세션 확인
AdminVO adminVO = (AdminVO)session.getAttribute("adminVO")==null?null:(AdminVO)session.getAttribute("adminVO");
OwnerVO ownerVO = (OwnerVO)session.getAttribute("ownerVO")==null?null:(OwnerVO)session.getAttribute("ownerVO");
UserVO userVO = (UserVO)session.getAttribute("userVO")==null?null:(UserVO)session.getAttribute("userVO");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>가맹 문의 상세 조회</title>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>

	<script type="text/javascript">
		function save(idx) {
			$("#selectModify").val($("#modifyT"+idx).val()); //수정한 내용 가져오기
			$("#fm2").submit();
		}
		function remove() {
			if(!confirm("삭제하시겠습니까?")) {
				alert("취소하셨습니다.");
				return;
			}
			alert("완료되었습니다.");
			location.href= "<%=request.getContextPath()%>/chainQnADelete.do?chainQnaNo=<%=chainQnAVO.getChainQnaNo()%>";
		}
		
		function changeTb(idx) {
			$("#hideT"+idx).hide(); //원래 내용 써있던 span태그 숨기기
			$("#modifyT"+idx).prop("type", "text"); //내용 수정하는 input 태그 text로 해서 보이기
			$("#modifyBtn"+idx).hide(); //수정버튼 누르면 수정버튼 사라지기
			$("#deleteBtn"+idx).hide(); //수정버튼 누르면 삭제버튼 사라지기
			$("#save"+idx).prop("type", "button"); //수정버튼 누르면 hidden이던 저장버튼 submit으로 변경하기
			$("#cancel" +idx).prop("type", "button"); //수정버튼 누르면 hidden이던 취소버튼 button으로 변경하기
			$("#chainQnaNo").val($("#selectChainQnaNo"+idx).val()); //수정한 내용의 글 번호 가져오기
			/* $("#chainQnaQNo").val($(obj7).val()); //수정한 내용의 댓글이 있는 문의 글 번호 가져오기 */
		}
		
		function removeA() {
			if(!confirm("삭제하시겠습니까?")) {
				$("#aTag").prop("href", "<%=request.getContextPath()%>/chainQnADetail.do?chainQnaNo=<%=chainQnAVO.getChainQnaNo()%>");
				alert("취소하셨습니다.");
				return;
			}
			alert("완료되었습니다.");
		}
		
		function cancel(idx) {
			$("#hideT" +idx).show(); //원래 내용 써있던 span태그 보이기
			$("#modifyT" +idx).prop("type", "hidden"); //내용 수정하는 input 태그 hidden으로 해서 숨기기
			$("#modifyBtn" +idx).show(); //취소버튼 누르면 수정버튼 보이기
			$("#deleteBtn" +idx).show(); //취소버튼 누르면 삭제버튼 보이기
			$("#save" +idx).prop("type", "hidden"); //취소버튼 누르면 submit이던 저장버튼 hidden으로 변경하기
			$("#cancel" +idx).prop("type", "hidden"); //취소버튼 누르면 button이던 취소버튼 hidden으로 변경하기
			
		}
		
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
			<span class="textUnderline fontSize2">1:1가맹문의</span>
		</div>
		
		<div class="divPadding">
			<table id="tb" class="table table-striped">
				<colgroup>
					<col style="width: 80px;">
					<col style="width: auto;">
					<col style="width: 80px;">
					<col style="width: auto;">
				</colgroup>
				<tbody class="fontWeight300">
					<tr>
						<th class="text-right">번호</th>
						<td><%=chainQnAVO.getChainQnaNo()%></td>
						<th class="text-right">제목</th>
						<td><%=chainQnAVO.getChainQnaTitle() %></td>
						<th class="text-right">작성일</th>
						<td><%=chainQnAVO.getChainQnaRegDate() %></td>
					</tr>
					<tr>
						<th class="text-right">아이디</th>
						<td><%=chainQnAVO.getUserId() %></td>
						<th class="text-right">이름</th>
						<td><%=chainQnAVO.getWriterName() %></td>
					</tr>
					<tr>
						<th class="text-right">연락처</th>
						<td colspan="6"><%=chainQnAVO.getChainQnaHp() %></td>
					</tr>
					<tr>
						<td colspan="6" style="padding: 20px 90px;"><%=chainQnAVO.getChainQnaContent() %></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		
		
		<!-- 버튼 --class를 추가해 접근을 제어-->
		<%if(adminVO == null && ownerVO == null) { %>
		<div class="divPadding text-center">
			<a href="<%=request.getContextPath()%>/chainQnAList.do"><button type="button" class="btn">목록</button></a>
			<a href="<%=request.getContextPath()%>/chainQnAUpdate.do?chainQnaNo=<%=chainQnAVO.getChainQnaNo()%>"><button type="button" class="btn btn-info">수정</button></a>
			<button type="button" class="btn btn-warning" onclick="remove()">삭제</button>
		</div>
		<%} %>
		<br>
		

	</div>
		<div class="container divPadding">
			<div class="text-left" style="margin-bottom: 10px;">
				<span style="font-size: 1.5rem;">답변</span>
			</div>
		</div>
	
	<%if(adminVO != null)  {%>
	<form class="form-horizontal divPadding" id="fm" name="fm" action="<%=request.getContextPath() %>/chainAInsert.do" method="post">
		<div class="container divPadding">
			<div class="card-body">
				<ul class="list-group list-group-flush">
				    <li class="list-group-item">
				    <input type="hidden" id="chainQnaQNo" name="chainQnaQNo" value="<%=chainQnAVO.getChainQnaNo()%>">
					<textarea class="form-control" id="chainQnaTitle" name="chainQnaTitle" rows="3"></textarea>
					<br>
					<div class="text-right">
					<button type="submit" class="btn btn-dark mt-3">등록</button>
					</div>
				    </li>
				</ul>
			</div>
		</div>
	</form>
	<%} %>
	<form class="form-horizontal divPadding" id="fm2" name="fm2" action="<%=request.getContextPath() %>/chainAUpdate.do" method="post">	
		<input type="hidden" name="selectModify" id="selectModify">
		<input type="hidden" name="chainQnaNo" id="chainQnaNo">
		<input type="hidden" name="chainQnaQNo" id="chainQnaQNo" value="<%=chainQnAVO.getChainQnaNo()%>">
		<div class="container divPadding">
		<hr>
		<div class="card-body">
			<table style="width: 100%; background-color: lightgray" id="tb">
				<% int chainAListSize = chainAList.size();
				
					if(chainAListSize > 0) {
						for(int i=0; i < chainAListSize; i++) {%>
							<tr class="align-middle" style="background-color: lightgray;">
								<td class="ml" style="padding: 20px;"><%=chainAList.get(i).getWriterName() %></td>
								<td class="ml" style="padding: 20px;">
									<span id="hideT<%=i+1 %>"><%=chainAList.get(i).getChainQnaTitle() %></span>
									<input type="hidden" id="selectChainQnaNo<%=i+1 %>" value="<%=chainAList.get(i).getChainQnaNo()%>">
									<%-- <input type="hidden" id="selectChainQnaQNo<%=i+1 %>" value="<%=chainAList.get(i).getChainQnaQNo()%>"> --%>
									<input id="modifyT<%=i+1 %>" name="modifyT" type="hidden" value="<%=chainAList.get(i).getChainQnaTitle() %>">
								</td>
								<td class="ml" style="padding: 20px;"><%=chainAList.get(i).getChainQnaRegDate() %></td>
								
								<%if(adminVO != null) { %>
									<td class="ml text-center">
											<button id="modifyBtn<%=i+1 %>" class="btn" type="button" onclick="changeTb(<%=i+1 %>)">수정</button>
											<input type="hidden" class="btn" id="save<%=i+1%>" value="저장" onclick="save(<%=i+1%>)">
									</td>
									<td class="ml text-center">
										<a id="aTag" href="<%=request.getContextPath()%>/chainADelete.do?chainQnaNo=<%=chainAList.get(i).getChainQnaNo()%>&chainQnaQNo=<%=chainQnAVO.getChainQnaNo()%>">
											<button class="btn" type="button" id="deleteBtn<%=i+1 %>" onclick="removeA()">삭제</button>
										</a>
										<input type="hidden" class="btn" id="cancel<%=i+1%>" value="취소" onclick="cancel(<%=i+1%>)">
										
									</td>
								<%} %>
								
							</tr>
	
						<%} %>
					<%}else { %>
						<tr  class="align-middle" style="background-color: lightgray;">
							<td class="ml" style="padding: 20px;">답변이 존재하지 않습니다.</td>
						</tr>
					<%} %>
					
				
			</table>
			<br>
			<%if(adminVO != null) { %>
			<div class="divPadding text-center">
			<a href="<%=request.getContextPath()%>/chainQnAList.do"><button type="button" class="btn">목록</button></a>
			</div>
			<%} %>
		</div>
		</div>
		</form>

	<!-- footer -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>