<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.user.vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daily.common.vo.PagingVO"%>
<%@page import="daily.chainQnA.vo.ChainQnAVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ChainQnAVO> chainQnAList = (List<ChainQnAVO>) request.getAttribute("chainQnAList");
	if(chainQnAList == null) {
		chainQnAList = new ArrayList<ChainQnAVO>();
	}

	PagingVO pagingVO = (PagingVO) request.getAttribute("pagingVO");
	
	AdminVO adminVO = (AdminVO)session.getAttribute("adminVO")==null?null:(AdminVO)session.getAttribute("adminVO");
	OwnerVO ownerVO = (OwnerVO)session.getAttribute("ownerVO")==null?null:(OwnerVO)session.getAttribute("ownerVO");
	UserVO userVO = (UserVO)session.getAttribute("userVO")==null?null:(UserVO)session.getAttribute("userVO");
	
/* 	// 만약 검색이라면 selectSearch=title&inputSearch=공
	String pagingUrl = "";
	if(request.getAttribute("selectSearch") != null){
		pagingUrl = "&selectSearch=" + (String)request.getAttribute("selectSearch") + "&inputSearch=" + (String)request.getAttribute("inputSearch"); 
	} */
	
	 // 로그인 확인 작업
	String loginId = (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>가맹문의 리스트</title>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<link href="../../css/chainQnA/chainQnAList.css" rel="stylesheet">

	<script type="text/javascript">
		console.log("loginType : " + <%=loginType%>);
		console.log("loginName : " + <%=loginName%>);
		console.log("loginId : " + <%=loginId%>);
		
 		function chkPw(qnaNo) {
			<%if((userVO == null && adminVO == null && ownerVO == null) || userVO != null) {%> //비회원이거나 회원이면
				var inputPw = prompt("비밀번호를 입력하세요.");
				$("#inputPw").val(inputPw);
				$("#qnaNo").val(qnaNo);
				
				$.ajax({
					url : "/chainQnAChkPw.do"
						,type : "post"
						,data : $("#fm2").serialize()
						,dataType : "json"
						,success : function(data) {
							// data = {resultCnt : 1}
							//비교했을 때 일치하는 경우
							if(data.resultCnt == 1) { //해당 게시글번호와 비밀번호가 일치하는게 있으면
								location.href = "/chainQnADetail.do?chainQnaNo=" + qnaNo; //해당 게시글 페이지로
							}else {
								alert("비밀번호가 일치하지 않습니다.");
								location.href = "/chainQnAList.do"; //목록 화면으로
							}
						}
						,error : function(xhr) {
							console.log(xhr);
							alert("오류입니다. 관리자에게 문의하세요.");
						}
				});
			<%}else if(ownerVO != null) { %>//지점주면 이용 못하게..
				alert("지점주는 가맹문의를 조회할 수 없습니다.");
				location.href = "/chainQnAList.do"; //목록 화면으로
			<%}else if(adminVO != null) {%>
				location.href = "/chainQnADetail.do?chainQnaNo=" + qnaNo; //관리자는 비밀번호 입력 없이 바로 이동 가능
			<%}%>
		}
 		
 			/* 검색못함 */
<%--   		function search() {
  			
  			$.ajax({
				url : "/searchQnA.do"
					,type : "post"
					,data : $("#fm").serialize()
					,dataType : "json"
					,success : function(data) {
						console.log(data);
						//비교했을 때 일치하는 경우
						if(data.length > 0) { //검색 조건과 일치하는 결과가 있으면
							$("#resultBody").empty();
							var strHtml = "";
							
							for(var i=0; i < data.lenth; i++) {
								var chainQnaNo = data[i].chainQnaNo;
								var writerName = data[i].writerName;
								var chainQnaTitle = data[i].chainQnaTitle;
								var chainQnaRegDate = data[i].chainQnaRegDate;
								
							strHtml += "<tr class="cursorPointer" style="cursor: pointer;">"
									+ "<td class="alignCenter">" + chainQnaNo + "</td>" 
									+ "<td>"
									+ "<a style="display: block; width: 100%;" onclick="chkPw('<%=chainQnAList.get(i).getChainQnaNo()%>')">" 
									+ "🔒nbsp;" + chainQnaTitle + "</a>" 
									+"</td>" 
									+ "<td>" + writerName + "</td>"
									+ "<td class="alignCenter">" + chainQnaRegDate + "</td>"
									+ "</tr>";							
							}
							
						}else {
							//검색 조건과 일치하는 결과가 존재하지 않습니다.
							strHtml += "<tr>"
									+ "<td colspan="4" class="alignCenter">게시물이 없습니다.</td>"
									+ "</tr>"
						}
						
						$("#tb tbody").html(strHtml);
					}
					,error : function(xhr) {
						console.log(xhr);
						alert("오류입니다. 관리자에게 문의하세요.");
					}
			});

		} --%>
	</script>
</head>
<body>
<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>	
	<!-- 해당 페이지 내용 -->
	
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter">
			<span class="textUnderline fontSize2">1:1가맹문의</span>
		</div>
		
		<!-- 검색 구현 못함!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="divPadding text-right fontWeight300">
			<form action="<%=request.getContextPath()%>/searchQnA.do%>" method="get" id="fm" name="fm">
				<div class="form-group">
					<div class="inlineBlock" style="display: inline-block;">
						<select class="form-control" name="selectSearch">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="inlineBlock" style="display: inline-block;">
						<input type="text" class="form-control form-inline" 
							   id="inputSearch" name="inputSearch">
					</div>
					<div class="inlineBlock" style="display: inline-block;">
						<button type="submit" class="btn" onclick="search()">검색</button>
					</div>
				</div>
			</form>
		</div>
		
	<form id="fm2" name="fm2">		
		<div class="divPadding">
			<table id="tb" class="table table-striped table-hover">
				<colgroup>
					<col style="width: 80px;">
					<col style="width: auto;">
					<col style="width: 150px;">
				</colgroup>
				<thead>
					<tr>
						<th class="alignCenter">글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th class="alignCenter">게시일</th>
					</tr>
				</thead>
				<%
				int chainQnAListSize = chainQnAList.size();
				if(chainQnAListSize > 0) {
					for(int i=0; i < chainQnAListSize; i++) {
			
				%>
				
				<tbody id="resultBody" class="fontWeight300">
					<tr class="cursorPointer" style="cursor: pointer;">
						<td class="alignCenter"><%=chainQnAList.get(i).getChainQnaNo() %></td>
						<td><a style="display: block; width: 100%;" onclick="chkPw('<%=chainQnAList.get(i).getChainQnaNo()%>')">🔒 &nbsp;<%=chainQnAList.get(i).getChainQnaTitle() %></a></td>
						<td><%=chainQnAList.get(i).getWriterName()%></td>
						<td class="alignCenter"><%=chainQnAList.get(i).getChainQnaRegDate() %></td>
					</tr>
					<%
					} //for문 끝
					%>
	
				<%}else { %>
					<tr>
						<td colspan="4" class="alignCenter">게시물이 없습니다.</td>
					</tr>
					<%} %>
				</tbody>
			</table>
			
			<div class="divPadding text-right">
			<%if(adminVO == null && ownerVO == null) {%>
			<a href="<%=request.getContextPath() %>/chainQInsert.do"><button type="button" class="btn btn-default">가맹문의 등록</button></a>
			<%} %>
		</div>
						<!-- 페이징 처리 -->
				<div class="text-center fontWeight300">
					<ul class="pagination pagination-sm">
					
					<%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) { %>
						<li class="page-item">
							<a href="chainQnAList.do?pageNo=<%= pagingVO.getFirstPageNo() - pagingVO.getPageSize() %>" style="color: black;">이전</a>
						</li>
					<%} %>		
									
					<%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++) {%>
						<li class="page-item">
							<a 
							<%if(pNo == pagingVO.getCurrentPageNo()) {%>
							style="font-weight: bold;"
							<%}%>
							href="chainQnAList.do?pageNo=<%=pNo%>" class="page-link" style="color: black;"><%=pNo %></a>
						</li>
					<%} %>
						
					<%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) { %>						
						<li class="page-item">
							<a href="chainQnAList.do?pageNo=<%= pagingVO.getFirstPageNo() + pagingVO.getPageSize() %>" style="color: black;">다음</a>
						</li>
					<%} %>							
					</ul>
				</div>
			
		</div>
		<input type="hidden" id="inputPw" name="inputPw">
		<input type="hidden" id="qnaNo" name="qnaNo">
	</form>
		
	</div>
	
	<!-- footer -->
	<footer class="container text-center">
		<hr class="marginBottom30">
		<div>
		  	<p>대표자 : O O O | 사업자 번호 : 555-86-01317</p>
		  	<p>주소 : 서울시 구로구 디지털로 33길 11 | 연락처 : 02-858-5789</p>
		</div>
	</footer>
</body>
</html>