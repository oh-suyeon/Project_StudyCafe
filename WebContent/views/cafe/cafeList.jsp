<%@page import="daily.cafe.vo.CafeRegionNameVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<CafeRegionNameVO> cafeList = (List<CafeRegionNameVO>)request.getAttribute("cafeList");

CafeRegionNameVO pagingVO = (CafeRegionNameVO) request.getAttribute("cafeVO");

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
	<title>Daily 지점찾기&예약</title>
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
</head>

<body>
	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	
<!-- 	해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">지점찾기&예약</span>
		</div>
		<!-- 지도 표시 영역 -->
		<div class="divPadding">
			<div id="map" style="width:1000px;height:400px;"></div>
		</div>
		<!-- 지도 표시 끝 -->
		<br>
		<!-- 게시판 카테고리 시작 { -->
		<div id="btnRegion" class="divPadding alignCenter">
			<div class="btn-group">
				<button type="button" class="btn btn-default" onclick="searchCafe('ALL')">전체</button> 
		   		<button type="button" class="btn btn-default" onclick="searchCafe('01')">서울특별시</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('02')">인천광역시</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('03')">대전광역시</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('04')">울산광역시</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('05')">대구광역시</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('06')">부산광역시</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('07')">광주광역시</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('08')">세종특별자치시</button>
			</div>                                  
		    <div class="btn-group">                 
		    	<button type="button" class="btn btn-default" onclick="searchCafe('09')">경기도</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('10')">강원도</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('11')">충청북도</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('12')">충청남도</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('13')">경상북도</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('14')">경상남도</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('15')">전라북도</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('16')">전라남도</button>
		   		<button type="button" class="btn btn-default" onclick="searchCafe('17')">제주도</button>
		    </div>		
		</div>
	    
	    <br>
	    <hr>
	    <div class="divPadding">
		    <form id="fmCafe" class="form-group">
			    <div class="col-sm-2">
			    	<input type="hidden"  name="regionCode" id="regionCode">
			    	<select name="selectDong" class="form-control">
			    		<option>동이름</option>
			    		<option>지점명</option>
			    	</select>
			    </div>
			    <div class="col-sm-5  form-inline">
			    	<input type="text" name="txtValue" class="form-control">
			    	<button type="button" class="btn" onclick="searchCafe2()">검색</button>
			    </div>
		    </form>
	    </div>
	    
	    <div class="divPadding">
		    <table id="tbCafeList" class="table table-striped table-hover alignCenter">
		    	<colgroup>
		    		<col style="width: 200px;">
		    		<col style="width: 300px;">
		    		<col style="width: 500px;">
		    		<col style="width: 500px;">
		    	</colgroup>
		    	<thead>
		    		<tr>
			    		<th>지역</th>
			    		<th>카페이름</th>
			    		<th>주소</th>
			    		<th>전화번호</th>
		    		</tr>
		    	</thead>
		    	<tbody>
		    	<% 
		    	if(cafeList.size() > 0){
			    	for(int i=0; i<cafeList.size(); i++){
			    		%>
		    				<tr>
		    					<td><%=cafeList.get(i).getCafeRegionName() %></td>
		    					<td><%=cafeList.get(i).getCafeName() %></td>
		    					<td><a href="<%=request.getContextPath() %>/cafeMain.do?cafeNo=<%=cafeList.get(i).getCafeNo() %>" target="_blank">
		    							<%=cafeList.get(i).getCafeAddr1() + " " + cafeList.get(i).getCafeAddr2() %></a>
		    					</td>
		    					<td><%=cafeList.get(i).getCafeTel() %></td>
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
<!-- 			<tr> -->
<!-- 				<td colspan="4" align="center"> -->
<%-- 					<%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) { // 첫페이지보다 페이지 사이즈가 작으니까 이전 버튼이 생김%> --%>
<%-- 					<a href="<%=request.getContextPath() %>/searchCafelist.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize() %>">[이전]</a> --%>
<%-- 					<%} %> --%>
<%-- 					<%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++){ %> --%>
<%-- 					<a <%if(pNo == pagingVO.getCurrentPageNo()){ %> style="color: orange;" <%} %> href="<%=request.getContextPath() %>/searchCafelist.do?pageNo=<%=pNo %>">[<%=pNo %>]</a> --%>
<%-- 					<%} %> --%>
<%-- 					<%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) {%> --%>
<%-- 					<a href="<%=request.getContextPath() %>/searchCafelist.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize() %>">[다음]</a> --%>
<%-- 					<%} %> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
			
		<div class="text-center fontWeight300">
			<ul class="pagination pagination-sm">
				<%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) { %>
				<li class="page-item disabled">
					<a href="<%=request.getContextPath() %>/searchCafelist.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize() %><%=queryString %>" style="color: black;">이전</a>
				</li>
				<%} %>
				<%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++){ %>
				<li class="page-item">
					<a href="<%=request.getContextPath() %>/searchCafelist.do?pageNo=<%=pNo %><%=queryString %>" class="page-link" 
					<%if(pNo == pagingVO.getCurrentPageNo()){ %> style="color: orange;" <%} %>"><%=pNo %></a>
				</li>
				<%} %>
				<%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) {%>
				<li class="page-item disabled">
					<a href="<%=request.getContextPath() %>/searchCafelist.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize() %><%=queryString %>" style="color: black;">다음</a>
				</li>
				<%} %>
			</ul>
		</div>
			<!-- 페이징 처리 끝 -->
	   
    </div>
    
    <!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
</body>
<script>

	// *************************************************************
	// 지역검색 함수 
	function searchCafe(data){
		$("#regionCode").val(data);
		var fm = $("#fmCafe");
		fm.action = "<%=request.getContextPath() %>/searchCafelist.do";
		fm.method = "get";
		fm.submit();
	}
	
	// 동검색 함수
	function searchCafe2(){
		var fm = $("#fmCafe");
		fm.action = "<%=request.getContextPath() %>/searchCafelist.do";
		fm.method = "get";
		fm.submit();
	}
	// *************************************************************

	// 지도 시작####################################################
	<%
	if(cafeList.size() > 0){
	%>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(<%=cafeList.get(0).getCafeXPosition() %>, <%=cafeList.get(0).getCafeYPosition() %>), // 지도의 중심좌표
		        level: 7 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		 
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
		<%
			for(int i=0; i<cafeList.size(); i++){
				CafeRegionNameVO vo = cafeList.get(i);
				String cafeName = vo.getCafeName();
				String x = vo.getCafeXPosition();
				String y = vo.getCafeYPosition();
				
				if(i>0){
					%>,<%
				}
				%>
				{
					content: '<div><%=cafeName %></div>', 
		 	        latlng: new kakao.maps.LatLng(<%=x %>, <%=y %>)
				}
				<%
			}
		%>
		];
		
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
	<%
	}else{
	%>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.55509104905299, 126.97032463974418), // 지도의 중심좌표 
	        level: 7 // 지도의 확대 레벨
	    };

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
	<%
	}
	%>
	// 지도 끝 ###################################################	
	
</script>
</html>