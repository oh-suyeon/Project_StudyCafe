<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> DAILY | GUIDANCE </title>

	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=135acb320e353387c9719f66f9a838f1"></script>
	<link href="<%=request.getContextPath() %>/css/introduce/mainIntroduce.css" type="text/css" rel="stylesheet">
</head>
<body>

	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	
	
	<!-- 해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">찾아오시는 길</span>
		</div>
	
		<!-- 지도 표시 영역 -->
		<div class="divPadding">
			<div id="map" style="width:1000px;height:400px;"></div>
		</div>
		<!-- 지도 표시 끝 -->
		<br>
		<hr>
		<div class="divPadding">
		<img alt="찾아오시는 길" src="../../image/wayImage.jpg" style="width: 100%;">
		</div>
		
	</div>
	
	<div class="alignCenter marginBottom30 ">
		<p>주소 : 서울시 구로구 디지털로 33길 11 데일리빌딩 3층</p>
		<p>대표번호 : 02-858-5789</p>
	</div>

	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
</body>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(37.58238212467683, 127.00277432686279), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var markerPosition = new kakao.maps.LatLng(37.58238212467683, 127.00277432686279);
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});
	
	marker.setMap(map);
	map.addOverlayMapTypeId(kakao.map.MapTypeId.TRAFFIC);
	
</script>
</html>