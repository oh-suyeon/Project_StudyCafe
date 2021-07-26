<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> DAILY | BRAND </title>

	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
</head>
<body>

	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>

	<!-- 해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">브랜드 소개</span>
		</div>

		<div class="divPadding marginBottom30">
			<div class="col-xs-2 text-center">
				<span class="logo fontSize3">DAILY</span>
			</div>

			<div class="col-xs-10 marginBottom30"  style="text-align: right;">
				<p class="fontWeight300">최적의 학습공간을 고민하여 만들어진 스터디카페입니다.</p>
				<p class="fontWeight300">공부에 집중할 수 있는 방법과 공간이 필요하다는 고민으로,</p>
				<p class="fontWeight300">단순히 공간을 제공하는 독서실이 아닌 "공부 습관을 잡아주는 공간”으로
					런칭하였습니다.</p>
			</div>
		</div>

		<div class="col-xs-12 alignCenter divPadding">
			<img class="imgWidth100" alt="blandSlogan"
				src="../../image/brand.png">
		</div>
	</div>
	
	<div class="container divPadding marginBottom30">

		<div class="divPadding marginBottom30">


			<div class="col-xs-10 marginBottom30" style="text-align: left;">
				<p class="fontWeight300">"인생의 터전을 바로잡아주다."라는 슬로건과 같이</p>
				<p class="fontWeight300">"올바른 공부의 방향과 방법을 바르게 잡아주는 공간"</p>
				<p class="fontWeight300">"편안함과 안락함을 강조하는 공간”으로 런칭하였습니다.</p>
			</div>
			<div class="col-xs-2 text-center">
				<span class="logo fontSize3">DAILY</span>
			</div>
		</div>

		<div class="col-xs-12 alignCenter divPadding">
			<img class="imgWidth100" alt="blandSlogan"
				src="../../image/brand2.png">
		</div>
	</div>

	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>