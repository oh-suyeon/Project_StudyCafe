<%@page import="daily.owner.vo.OwnerCafeInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<OwnerCafeInfoVO> ownerList = (List<OwnerCafeInfoVO>)request.getAttribute("ownerList");

OwnerCafeInfoVO pagingVO = (OwnerCafeInfoVO)request.getAttribute("ownerCafeVO");

String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

String radioVal = request.getParameter("radioSrchOwner") == null ? "" : request.getParameter("radioSrchOwner");
String inputVal = request.getParameter("inputRadioTxt")  == null ? "" :request.getParameter("inputRadioTxt");
String regionVal = request.getParameter("selectRegion")  == null ? "" : request.getParameter("selectRegion");
String cafeRunVal = request.getParameter("selectCafeRun")  == null ? "" : request.getParameter("selectCafeRun");
String queryString = "&radioSrchOwner=" + radioVal + "&inputRadioTxt=" + inputVal + "&selectRegion=" + regionVal +  "&selectCafeRun=" + cafeRunVal;

//로그인 확인 작업
String loginId = (String)session.getAttribute("loginId");
String loginName = (String)session.getAttribute("loginName");
String loginType = (String)session.getAttribute("loginType");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Daily 메인(관리자-관리-지점관리-지점주정보)</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link href="../../css/common/common.css" type="text/css" rel="stylesheet">
	<link href="../../css/common/navNFooter.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	
// 	검색을 통한 지점주 리스트 조회 함수
	function srchOwner(){
		var fm = document.getElementById("fmOwner");
		fm.action = "<%=request.getContextPath() %>/ownerManage.do";
		fm.method = "get";
		fm.submit();
	}
	

</script>
</head>
<body>
	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>

	<!-- 	해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">지점주 정보</span>
		</div>
		
		<div class="divPadding">
		<!-- 지점주 상세 정보 핸들러에 지점주 아이디 파라미터 전달 -->
			<form id="fmOwnerId">
				<input type="hidden" name="ownerIdVal">
			</form>
			
		<!-- 지점주 리스트 검색 파라미터 -->
			<form id="fmOwner" class="form-group">
				<div class="col-sm-5 form-inline">
					<input type="radio" id="radioOwnerName" name="radioSrchOwner" value="ownerName" checked="checked">
					<label for="radioOwnerName">이름</label>
					<input type="radio" id="radioCafeName" name="radioSrchOwner" value="cafeName">
					<label for="radioCafeName">지점명</label>
					<input type="text" name="inputRadioTxt" class="form-control">
				</div>
				<div class="col-sm-5 form-inline">
					<select name="selectRegion" class="form-control">
						<option>가맹지역</option>
						<option>서울특별시</option>
						<option>인천광역시</option>
						<option>대전광역시</option>
						<option>울산광역시</option>
						<option>대구광역시</option>
						<option>부산광역시</option>
						<option>광주광역시</option>
						<option>세종특별자치시</option>
						<option>경기도</option>
						<option>강원도</option>
						<option>충청북도</option>
						<option>충청남도</option>
						<option>경상북도</option>
						<option>경상남도</option>
						<option>전라북도</option>
						<option>전라남도</option>
						<option>제주도</option>
					</select>	
				
					<select name="selectCafeRun" class="form-control">
						<option>운영상태</option>
						<option>오픈 예정</option>
						<option>영업 중</option>
						<option>영업 중지</option>
					</select>
					<button type="button" onclick="srchOwner()" class="btn">검색</button>
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/ownerCreate.do'">지점주 계정등록</button>
				</div>
			</form>
		</div>
		
		<hr>
		
		<div class="divPadding">
			<table id="tbOwnerList" class="table table-striped table-hover alignCenter">
				<colgroup>
<!-- 					<col style="width: 50px;"> -->
					<col style="width: 100px;">
					<col style="width: 100px;">
					<col style="width: 150px;">
					<col style="width: 150px;">
					<col style="width: 150px;">
					<col style="width: 100px;">
					<col style="width: 100px;">
				</colgroup>
				<thead>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>휴대폰번호</th>
						<th>이메일</th>
						<th>가맹지역</th>
						<th>가맹지점명</th>
						<th>운영상태</th>
					</tr>
				</thead>
				<tbody>
				<%
				if(ownerList.size() > 0){
					for(int i=0; i<ownerList.size(); i++){
						%>
						<tr>
							<td><%=ownerList.get(i).getOwnerName() %></td>
							<td>
								<a href="<%=request.getContextPath() %>/ownerGet.do?ownerId=<%=ownerList.get(i).getOwnerId() %>">
									<%=ownerList.get(i).getOwnerId() %></a>
							</td>
							<td><%=ownerList.get(i).getOwnerHp() %></td>
							<td><%=ownerList.get(i).getOwnerEmail() %></td>
							<td><%=ownerList.get(i).getRegionName() %></td>
							<td><%=ownerList.get(i).getCafeName() %></td>
							<td><%=ownerList.get(i).getRunName() %></td>
						</tr>
						<%
				  	}
		    	}else {
				%>
					<tr>
						<td colspan="6">검색된 결과가 없습니다.</td>
					</tr>
		    		
		    		<%
		    	}
		    	%>
				</tbody>
			</table>
		</div>
		<!-- 페이징 처리 시작 -->
		
		<div class="text-center fontWeight300">
			<ul class="pagination pagination-sm">
				<%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) { %>
				<li class="page-item disabled">
					<a href="<%=request.getContextPath() %>/ownerManage.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize() %><%=queryString %>" style="color: black;">이전</a>
				</li>
				<%} %>
				<%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++){ %>
				<li class="page-item">
					<a href="<%=request.getContextPath() %>/ownerManage.do?pageNo=<%=pNo %><%=queryString %>" class="page-link" 
					<%if(pNo == pagingVO.getCurrentPageNo()){ %> style="color: orange;" <%} %>"><%=pNo %></a>
				</li>
				<%} %>
				<%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) {%>
				<li class="page-item disabled">
					<a href="<%=request.getContextPath() %>/ownerManage.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize() %><%=queryString %>" style="color: black;">다음</a>
				</li>
				<%} %>
			</ul>
		</div>
		<!-- 페이징 처리 끝 -->
		
	</div>
	
	 <!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
</body>

<%
	if("success".equals(msg)){
		%>
		<script type="text/javascript">
			alert("정상적으로 처리 되었습니다.");			
		</script>
		
		<%
	}
%>
</html>
    