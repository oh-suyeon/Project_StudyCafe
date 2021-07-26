/**
 * 카페의 좌석 리스트 정보를 가져온다
 * @returns
 */

$(document).ready(function() { 
	
	var param = {
			flag : "resultSeatList"
			,cafeNo : cafeNo
			,seatCode : seatCode
	}
	
	$.ajax({
		url: contextPath + "/userGetSeatList.do"
		,type: "get"
		,data: param 
		,dataType: "json"
		,success: function(data) {
			console.log(data);
			makeSeatList(data);
		}	
		,error: function(xhr) {
		console.log(xhr);
		alert("오류입니다. 관리자에게 문의하세요." + "\n"
				+ "status : " + xhr.status + "\n"
				+ "statusCode : " + xhr.statusCode + "\n"
				+ "statusText : " + xhr.statusText); 
		}	
	});
	

});

function changeUsingTime() {
	$("#typeOneDay").trigger("click");
}



/**
 * 좌석리스트를 테이블로 뿌려준다
 * @param data
 * @returns
 */
function makeSeatList(obj) {
	
	$("#tb").empty();
	
	var htmlStr = "";
	var cnt = 0;
	var seatNo = 1;
	
	for(var i=0; i<5; i++){
		
		htmlStr += "<tr>";
			
		for(var j=0; j<5; j++){
			
			var cafeSeatNo = obj[cnt].cafeSeatNo;
			
			if(obj[cnt].seatUsableYn == "Y"){
				htmlStr += "<td class='text-center'>"
					+ "<button type='button' class='btn btn-success seatBtn' onclick='putCafeSeatNo(this);' value='"+ cafeSeatNo +"'" 
					+ "data-toggle='modal' data-target='#modalSeat'>"
					+ seatNo
					+ "</button>" 
					+ "</td>";
				seatNo++;
				
			}else{
				htmlStr += "<td class='text-center'>"
					+ "<button type='button' disabled class='btn seatBtn' style='cursor:default'" 
					+ "data-toggle='modal' data-target='#modalSeat'>"
					+ " "	
					+ "</button>" 
					+ "</td>";
			}
			
			cnt++;
		}
		htmlStr += "</tr>";
	}
	$("#tb").html(htmlStr);
}


function putCafeSeatNo(obj) {
	
	var cafeSeatNo = $(obj).val();
	var seatNo = $(obj).text();
	
	$("#cafeSeatNo").val(cafeSeatNo);
	$("#seatNo").val(seatNo);
}

/**
 * 좌석을 클릭했을 때 모달에서 보여줄 좌석의 정보를 가져온다
 * @param obj
 * @returns
 */

function search() {
	
	$("#usingTime").empty();
	
	var reservationDate = $("#reservationDate").val();
	var cafeSeatNo = $("#cafeSeatNo").val();
	
	console.log(cafeSeatNo);
	
	var param = {
	flag : "resultSeatInfo"
	,cafeSeatNo : cafeSeatNo
	,reservationDate : reservationDate
	}
	
	$("#usingTime").css("color", 'black');
	$("#usingTime").css("background", 'white');
	
	for(var i=0; i< 24; i++){
		
		// 선택한 날짜에 시간을 더해 <option> 값으로 부여 
		var date = new Date(reservationDate).setHours(i);
		date = new Date(date);
		
		if(i < 10){
			$("<option>").text("0"+i+":00").val(date).appendTo($("#usingTime"));
		}else{
			$("<option>").text(i+":00").val(date).appendTo($("#usingTime"));;
		}
	}
	
	
	// 당일일 경우 0시부터 현재시간까지 예약 불가
	var today = new Date();
	today = today.getFullYear()
			+"-"+ (today.getMonth()+1) 
			+"-"+ today.getDate();
	
	var reservDate = new Date(reservationDate).getFullYear()
			+"-"+ (new Date(reservationDate).getMonth()+1) 
			+"-"+ new Date(reservationDate).getDate();
	
	if(reservDate == today){
		var todayHour = new Date().getHours();
		for(var i=0; i<=todayHour; i++){
			var time = document.getElementById("usingTime").children[i];
			$(time).attr("disabled", true);
			
			$(time).css("background", 'silver');
			$(time).css("color", 'white');
		}
	}
	
	// 오늘 전의 날짜인 경우 예약 불가
	if(new Date(today) > new Date(reservationDate)){
		alert("오늘 이전의 날짜는 예약할 수 없습니다.");
		$("#usingTime").empty();
		$("#usingTime").append("<option>== 선택 ==</option>");
	}
	
	// 해당 일자 예약 정보를 가져와 불가능 시간대를 표시
	$.ajax({
		url: contextPath + "/userGetSeatList.do"
		,type: "get"
		,data: param 
		,dataType: "json"
		,success: function(data) {
			
			$("#usingTime").css("color", 'black');
			$("#usingTime").css("background", 'white');
			
			$(data).each(function(idx, item) {
				var start = parseInt(new Date(item.userSeatStartDate).getHours());
				var end = parseInt(new Date(item.userSeatEndDate).getHours());
				
				
				for(var i=0; i<end-start; i++){
					var time = document.getElementById("usingTime").children[start + i];
					$(time).attr("disabled", true);

					$(time).css("background", 'silver');
					$(time).css("color", 'white');
				}
			});
			
		}	
		,error: function(xhr) {
		console.log(xhr);
		alert("오류입니다. 관리자에게 문의하세요." + "\n"
				+ "status : " + xhr.status + "\n"
				+ "statusCode : " + xhr.statusCode + "\n"
				+ "statusText : " + xhr.statusText); 
		}	
	});
	
}


/**
 * 수정한 좌석 정보를 저장한다
 * @returns
 */
function save() {
	
	if(!confirm("발권하시겠습니까?")){
		return;
	}
	
	// 값 검증 작업 현재 없음
	
	$("#hiddenTicketType").val($("[name='ticketType']:checked").val());
	$("#hiddenTicketPrice").val( $("[name='ticketPrice']:checked").val());
	
	$("#fm").submit();
	
}


/**
 * 이용권 선택 
 * @param event
 * @returns
 */
$(document).on("click", "input[name='ticketType']", function(event){
	
	$("#result").empty();
	
	var ticketType = $(event.target).val();
	
	$("#divTicketPrice").empty();
	
	var strHtml = "";
	if(ticketType == 02){
		strHtml += "<input type='radio' name='ticketPrice' id='ticketTime2' value='3000' checked='checked'/>"
				+ "<label for='ticketTime2'>2시간/3,000원</label><br>"
				+ "<input type='radio' name='ticketPrice' id='ticketTime4' value='5000'/>" 
			 	+ "<label for='ticketTime4'>4시간/5,000원</label><br>" 
			 	+ "<input type='radio' name='ticketPrice' id='ticketTime6' value='7000'/>"
			 	+ "<label for='ticketTime6'>6시간/7,000원</label>" ;
	}else if(ticketType ==03){
		strHtml += "<input type='radio' name='ticketPrice' id='ticketWeek1' value='50000' checked='checked'/>"
			 	+ "<label for='ticketWeek1'>1주/50,000원</label><br>"
		 		+ "<input type='radio' name='ticketPrice' id='ticketWeek2' value='80000' />"
			 	+ "<label for='ticketWeek2'>2주/80,000원</label><br>"
		 		+ "<input type='radio' name='ticketPrice' id='ticketWeek4' value='160000' />"
			 	+ "<label for='ticketWeek4'>4주/160,000원</label>";
	}
	$("#divTicketPrice").html(strHtml);
	
});

/** 
 * 이용권 선택 시 종료 시간 표시
 * @param event
 * @returns
 */
$(document).on("click", "input[name='ticketPrice']", function(event){
	
	$("#timeInput").empty();
	$("#timeResult").empty();
	
	var ticketType = $("input[name='ticketType']:checked").val();
	
	if(ticketType == '02'){
		
		// 예약 스케줄에 따라 이용권 disable
		var timeIdx = $("#usingTime option:selected").text();
		timeIdx = parseInt(timeIdx.substr(0, 2));
		
		var timeCnt = 0;
		
		var timeSelected = document.getElementById("usingTime");
		
		while($(timeSelected.children[timeIdx + 1]).prop("disabled") == false){
			timeCnt++;
			timeIdx++;
		}
		
		if(timeCnt < 2){
			$("#ticketTime2").prop("disabled", true);
			$("#ticketTime4").prop("disabled", true);
			$("#ticketTime6").prop("disabled", true);
		}else if(timeCnt < 4){
			$("#ticketTime4").prop("disabled", true);
			$("#ticketTime6").prop("disabled", true);
		}else if(timeCnt < 6){
			$("#ticketTime6").prop("disabled", true);
		}
		
		
		// 종료시간 계산
		var startTime = new Date($("#usingTime option:selected").val());
		var endTime = new Date(startTime.setHours(startTime.getHours() + parseInt($("[name='ticketPrice']:checked").attr('id').substr(10))));
		
		$("#timeResult").html("종료 시간 : " + new Date(endTime).toLocaleString());
		
		$("#hiddenStartTime").val(new Date($("#usingTime option:selected").val()).format('yyyyMMddHH'));
		$("#hiddenEndTime").val(new Date(endTime).format('yyyyMMddHH'));
		
		console.log("당일권");
		console.log($("#hiddenStartTime").val());
		console.log($("#hiddenEndTime").val());
		
	}else if(ticketType == '03'){
		$("<label>이용 시간 :&nbsp;&nbsp;</label>").appendTo($("#timeInput"));
		$("<input type='number' name='endTime' min='1'>").appendTo($("#timeInput"));
		$("<label> &nbsp;&nbsp;시간</label>").appendTo($("#timeInput"));
		
		var timeIdx = $("#usingTime option:selected").text();
		timeIdx = parseInt(timeIdx.substr(0, 2));
		
		var timeCnt = 0;
		
		var timeSelected = document.getElementById("usingTime");
		
		while($(timeSelected.children[timeIdx + 1]).prop("disabled") == false){
			timeCnt++;
			timeIdx++;
		}
		
		$("input[name='endTime']").attr('max', timeCnt);
		
	}
});


// 시간 변경 시 종료 시간 변경
$(document).on("click", "input[name='endTime']", function(event){
	
	$("#timeResult").empty();
	
	// 종료시간 계산
	var startTime = new Date($("#usingTime option:selected").val());
	var endTime = new Date(startTime.setHours(startTime.getHours() + parseInt($("input[name='endTime']").val())));
	
	$("#timeResult").html("종료 시간 : " + new Date(endTime).toLocaleString());
	
	$("#hiddenStartTime").val(new Date($("#usingTime option:selected").val()).format('yyyyMMddHH'));
	$("#hiddenEndTime").val(new Date(endTime).format('yyyyMMddHH'));
	
	console.log("기간권");
	console.log($("#hiddenStartTime").val());
	console.log($("#hiddenEndTime").val());
	
});



// 모달 창 초기화
//function resetModal() {
//	
//	$('form').each(function() {
//	      this.reset();
//	 });
//}


































// 날짜 형식 설정 함수 // 
Date.prototype.format = function(f) {

	if (!this.valueOf())
		return " ";

	var weekKorName = [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ];

	var weekKorShortName = [ "일", "월", "화", "수", "목", "금", "토" ];

	var weekEngName = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
			"Friday", "Saturday" ];

	var weekEngShortName = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ];

	var d = this;

	return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi,
			function($1) {

				switch ($1) {

				case "yyyy":
					return d.getFullYear(); // 년 (4자리)

				case "yy":
					return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

				case "MM":
					return (d.getMonth() + 1).zf(2); // 월 (2자리)

				case "dd":
					return d.getDate().zf(2); // 일 (2자리)

				case "KS":
					return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

				case "KL":
					return weekKorName[d.getDay()]; // 요일 (긴 한글)

				case "ES":
					return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

				case "EL":
					return weekEngName[d.getDay()]; // 요일 (긴 영어)

				case "HH":
					return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

				case "hh":
					return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

				case "mm":
					return d.getMinutes().zf(2); // 분 (2자리)

				case "ss":
					return d.getSeconds().zf(2); // 초 (2자리)

				case "a/p":
					return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

				default:
					return $1;

				}

			});

};

String.prototype.string = function(len) {
	var s = '', i = 0;
	while (i++ < len) {
		s += this;
	}
	return s;
};

String.prototype.zf = function(len) {
	return "0".string(len - this.length) + this;
};

Number.prototype.zf = function(len) {
	return this.toString().zf(len);
};