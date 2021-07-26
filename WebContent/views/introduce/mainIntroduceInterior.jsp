<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> DAILY | INTERIOR </title>

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
			<span class="textUnderline fontSize2">인테리어 소개</span>
		</div>
	
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" role="listbox">
		    
		      <div class="item active">
		        <img src="../../image/interior1.png" class="img-responsive" alt="Image">
		      </div>
		
		      <div class="item">
		        <img src="../../image/interior2.png" class="img-responsive"  alt="Image">
		      </div>

		      <div class="item">
		        <img src="../../image/interior3.png" class="img-responsive"  alt="Image">
		      </div>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		      <span class="sr-only">Next</span>
		    </a>
		</div>
		<br>
		<hr>
		<br>
		<div class="marginBottom30" style="text-align: left; display: flex;">
			<div style="margin-right: 20px;">
				<img alt="클래식아트" src="../../image/interiorClassic.png" style="width: 100%;">
			</div>
			
			<div>
				<h1>클래식아트</h1>
				<span>
					' 단순한 것이 가장 수려하다!'
					그루스터디카페의 클래식아트의 컨셉은 '심플함' 입니다. 깨끗한 화이트 컬러에
					블랙과 네이비로 포인트를 주고, 따뜻한 색상의 조명과 거울을 조화롭게 연출하여
					자칫 단조로울 수 있는 부분은 '식물'을 포인트로 한 플랜테리어가 돋보이는
					컨셉입니다. 이제 현대적 느낌에 따뜻함을 더한 그루의 공간미학을 만나보세요.
				</span>
			</div>
		</div>
		
		<br>
		<hr>
		<br>
		
		<div class="marginBottom30" style="text-align: left; display: flex;">
			<div style="margin-right: 20px;">
				<img alt="로열트리" src="../../image/interiorRoyal.png" style="width: 100%;">
			</div>
			<div>
				<h1>로열트리</h1>
				<span>
					'스터디카페, 프리미엄을 말하다!'
					그루스터디카페의 로열트리의 컨셉은 '고급스러움'입니다.
					디자인을 이루는 고급마감재와 친환경 도장, 고급 샹들리에를 포인트로
					마치 호텔 속 카페에 온 것 같은 감성을 느끼게 하는 인테리어 구성요소들로
					타 브랜드에서는 볼 수 없는 프리미엄 컨셉입니다.
					이제 공부하는 공간도 품격있는 프리미엄 스터디카페를 경험해보세요.
				</span>
			</div>
		</div>
		
		<br>
		<hr>
		<br>
		
		<div class="marginBottom30" style="text-align: left; display: flex;">
			<div style="margin-right: 20px;">
				<img alt="모던플레이스" src="../../image/interiorModern.png" style="width: 100%;">
			</div>
			<div>
				<h1>모던플레이스</h1>
				<span>
					'스터디카페, 모던을 더하다!'
					그루 스터디 카페의 모던플레이스 컨셉은 ‘편안함' 입니다.
					디자인을 이루는 부드러운 베이지 컬러에 우드 소재와 다크 그레이 컬러로 포인트를 주고,
					따뜻한 색상의 조명과 패턴유리를 조화롭게 연출하여 답답할 수 있는 공간에 개방감을 더해
					편안하고 안락함을 느낄 수 있는 공부 환경에 최적화된 모던 컨셉입니다.
					이제 현대적 모던에 편안함을 더한 그루의 공간미학을 만나보세요.
				</span>
			</div>
		</div>
	</div>

	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>