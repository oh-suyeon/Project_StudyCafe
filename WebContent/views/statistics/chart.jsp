<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  

%>
   
<% // 로그인 확인 작업
	String loginId = (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType");
%>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>차트</title>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	

	<!-- 차트 링크 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script type="text/javascript">
	$(function() {
	   
		
		$('#chartYear').change(function() {
			var state = $('#chartYear option:selected').val();
			if ( state == '2021' ) {
				$("#chartMonth option[value='3']").remove();
			    $("#chartMonth option[value='4']").remove();
			}
		});
		
	});
	
	</script>
</head>
<body>
	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	<div class="container">
	<div class="row">
		
		<div class="col-md-3">
			
				<select name="chartYear" id="chartYear">
				  <option value="2021" selected="selected">2021</option>
				  <option value="2020">2020</option>
				</select>
				<label for="chartYear">년</label>
				<select name="chartMonth" id="chartMonth">
				  <option value="1">1분기</option>
				  <option value="2" selected="selected">2분기</option>
				  <option value="3" id="rm1">3분기</option>
				  <option value="4" id="rm2">4분기</option>
				</select>	
				<label for="chartMonth">분기</label>
			<button type="button" id="search" >조회</button>
		</div>
		
		<div class="col-md-9">
		</div>
	</div>
	</div>
	<!-- 들어갈 내용 -->
	<div class="container">
		<div  class="col-md-6">
			 <canvas id="myChart1" >
		 	</canvas> 
		 </div>
		 <div  class="col-md-6">	
		 	<canvas id="myChart2" >
		 	</canvas> 
	 	 </div>
	</div>
	<div id="NoSearch">
	</div>
	 
	 


	
	<!-- 1차트 --> 
	<script> 
	var dataVal = [];
	var dataVal2 = [];

	//차트 조정
	$(function() {	
		
		$('#search').click(function(){
			var b = $('#chartYear').val();
			var a = $('#chartMonth').val();
			console.log("a : "+a);
			console.log("b : "+b);
			
			
			if(a == "1" && b == "2020"){
				
				dataVal = [15, 22, 31, 5, 22, 30,5,60,44];
				dataVal2 = [60, 40, 39, 41];
				
			}else if(a == "2" && b == "2020"){
				
				dataVal = [22, 40, 31, 63, 52, 30,5,3,10];
				dataVal2 = [30, 20, 30, 44];
				
			}else if(a == "3" && b == "2020"){
				
				dataVal = [33, 29, 7, 32, 12, 30,16,11,10];
				dataVal2 = [40, 55, 30, 45];
				
			}else if(a == "4" && b == "2020"){
				
				dataVal = [31, 65, 38, 66, 22, 30,11,5,10];
				dataVal2 = [10, 53, 33, 11];
				
			}else if(a == "1" && b == "2021"){
				
				dataVal = [11, 45, 8, 24, 28, 38,11,10,20];
				dataVal2 = [55, 53, 25, 11];
				
			}else if(a == "2" && b == "2021"){
				
				dataVal = [21, 55, 38, 56, 22, 30,41,5,30];
				dataVal2 = [3, 53, 25, 11];
				
			}			
			
			
			chart();
			chart2();
		});
		
	
function chart() {
	

	var ctx = document.getElementById('myChart1');
	var myChart1 = new Chart(ctx, {
		type: 'bar'
		, data: { labels: ['서대전점', '중구청점', '동숭동점', '시청점', '용문점', '문화점','신당점','장충점','삼성동점']
	, datasets: [{ label: '매출 조회', data: dataVal
	, backgroundColor: [ 
			'rgba(255, 99, 132, 0.2)'
			, 'rgba(54, 162, 235, 0.2)'
			, 'rgba(255, 206, 86, 0.2)'
			, 'rgba(75, 192, 192, 0.2)'
			, 'rgba(153, 102, 255, 0.2)'
			, 'rgba(255, 159, 64, 0.2)'
			, 'rgba(75, 192, 192, 0.2)'
			, 'rgba(153, 102, 255, 0.2)'
			, 'rgba(255, 159, 64, 0.2)'
			],
		borderColor: [
			'rgba(255, 99, 132, 1)'
			, 'rgba(54, 162, 235, 1)'
			, 'rgba(255, 206, 86, 1)'
			, 'rgba(75, 192, 192, 1)'
			, 'rgba(153, 102, 255, 1)'
			, 'rgba(255, 159, 64, 1)' 
			, 'rgba(72, 222, 133, 1)'
			, 'rgba(133, 22, 255, 1)'
			, 'rgba(244, 188, 90, 1)'
			]
		, borderWidth: 1 
		}]
	},
	options: { 
		scales: {
			yAxes: [{
				ticks: {
					beginAtZero: true
					}
				}]
			} 
		}	 
	}); 
	console.log("★★★★★★★★★★★★★★★★★★★"+dataVal);
	
}	
	});//제이쿼리 기능

	</script>


	<!-- 차트2 --> 
	 <script> 
	 function chart2() {
		
	
	 var ctx = document.getElementById('myChart2').getContext('2d');
	 var chart = new Chart(ctx, {
		 // 챠트 종류를 선택 
		 type: 'line', 
		 // 챠트를 그릴 데이타 
		 data: { 
		 labels: ['1분기', '2분기', '3분기', '4분기']	
	 	,datasets: [
	 		{ 
	 		label: '전국 방문자 수'
	 		,backgroundColor: 'transparent'
	 		,borderColor: 'red'
	 		,data: dataVal2
	 		}
	 	]
	 }
	 
	 , 
		 // 옵션 options: {} 
	 }); 
	 
	 }
	 </script>
	
	
	
		
	
	
	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>