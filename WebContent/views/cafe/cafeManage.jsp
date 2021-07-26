<%@page import="daily.cafe.vo.CafeRegionNameVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<CafeRegionNameVO> cafeList = (List<CafeRegionNameVO>)request.getAttribute("cafeList");

CafeRegionNameVO pagingVO = (CafeRegionNameVO) request.getAttribute("cafeVO");

String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

String regionCode = request.getParameter("regionCode") == null ? "" : request.getParameter("regionCode");
String selectDong = request.getParameter("selectDong") == null ? "" : request.getParameter("selectDong");
String txtValue = request.getParameter("txtValue") == null ? "" : request.getParameter("txtValue");
String queryString = "&regionCode=" + regionCode + "&selectDong=" + selectDong + "&txtValue=" + txtValue;

//로그인 확인 작업
String loginId = (String)session.getAttribute("loginId");
String loginName = (String)session.getAttribute("loginName");
String loginType = (String)session.getAttribute("loginType");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Daily 메인(관리자-관리-지점관리-지점정보)</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=135acb320e353387c9719f66f9a838f1"></script>
	<link href="../../css/common/common.css" type="text/css" rel="stylesheet">
	<link href="../../css/common/navNFooter.css" type="text/css" rel="stylesheet">
	<link href="../../css/cafe/cafeList.css" type="text/css" rel="stylesheet">
	<script>
	// *************************************************************
	
	// 검색 함수
	function searchCafe(){
		var fm = document.getElementById("fmCafe");
		fm.action = "<%=request.getContextPath() %>/cafeManage.do";
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
			<span class="textUnderline fontSize2">지점정보</span>
		</div>
		
		<!-- 게시판 카테고리 시작 { -->
	    
	    <hr>
	    
	    <div class="divPadding">
		    <form id="fmCafe" class="form-group">
				<div class="col-sm-2">
					<select name="regionCode" class="form-control">
						<option value='ALL'>전체</option> 
				   		<option value='01'>서울특별시</option>
				   		<option value='02'>인천광역시</option>
				   		<option value='03'>대전광역시</option>
				   		<option value='04'>울산광역시</option>
				   		<option value='05'>대구광역시</option>
				   		<option value='06'>부산광역시</option>
				   		<option value='07'>광주광역시</option>
				   		<option value='08'>세종특별자치시</option>
				    	<option value='09'>경기도</option>
				   		<option value='10'>강원도</option>
				   		<option value='11'>충청북도</option>
				   		<option value='12'>충청남도</option>
				   		<option value='13'>경상북도</option>
				   		<option value='14'>경상남도</option>
				   		<option value='15'>전라북도</option>
				   		<option value='16'>전라남도</option>
				   		<option value='17'>제주도</option>
				   	</select>
			    </div>		
			    <div class="col-sm-2">
			    	<select name="selectDong" class="form-control">
			    		<option>동이름</option>
			    		<option>지점명</option>
			    	</select>
			    </div>
			    <div class="col-sm-6  form-inline">
			    	<input type="text" name="txtValue" class="form-control">
			    	<button type="button" class="btn" onclick="searchCafe()">검색</button>
			    </div>
		    </form>
	    	<div class="col-sm-2">
	    		<button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/cafeCreate.do'">지점생성</button>
	    	</div>
	    </div>
	    
	    <div class="divPadding">
		    <table id="tbCafeList" class="table table-striped table-hover alignCenter">
		    	<colgroup>
		    		<col style="width: 100px;">
		    		<col style="width: 300px;">
		    		<col style="width: 300px;">
		    		<col style="width: 600px;">
		    		<col style="width: 300px;">
		    		<col style="width: 200px;">
		    	</colgroup>
		    	<thead>
		    		<tr>
		    			<th>번호</th>
			    		<th>지역</th>
			    		<th>카페이름</th>
			    		<th>주소</th>
			    		<th>전화번호</th>
			    		<th>운영상태</th>
		    		</tr>
		    	</thead>
		    	<tbody>
		    	<% 
		    	if(cafeList.size() > 0){
			    	for(int i=0; i<cafeList.size(); i++){
			    		%>
		    				<tr>
		    					<td><%=cafeList.get(i).getCafeNo() %></td>
		    					<td><%=cafeList.get(i).getCafeRegionName() %></td>
		    					<td><%=cafeList.get(i).getCafeName() %></td>
		    					<td><a href="<%=request.getContextPath() %>/cafeGet.do?cafeNo=<%=cafeList.get(i).getCafeNo() %>" >
		    							<%=cafeList.get(i).getCafeAddr1() + " " + cafeList.get(i).getCafeAddr2() %></a>
		    					</td>
		    					<td><%=cafeList.get(i).getCafeTel() %></td>
		    					<td><%=cafeList.get(i).getCafeRunName() %></td>
			    			</td>
			    		<%
			    	}
		    	}else {
		    		%>
		    		<tr>
						<td colspan="4">검색된 지점결과가 없습니다.</td>
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
					<a href="<%=request.getContextPath() %>/cafeManage.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize() %><%=queryString %>" style="color: black;">이전</a>
				</li>
				<%} %>
				<%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++){ %>
				<li class="page-item">
					<a href="<%=request.getContextPath() %>/cafeManage.do?pageNo=<%=pNo %><%=queryString %>" class="page-link" 
					<%if(pNo == pagingVO.getCurrentPageNo()){ %> style="color: orange;" <%} %>"><%=pNo %></a>
				</li>
				<%} %>
				<%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) {%>
				<li class="page-item disabled">
					<a href="<%=request.getContextPath() %>/cafeManage.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize() %><%=queryString %>" style="color: black;">다음</a>
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