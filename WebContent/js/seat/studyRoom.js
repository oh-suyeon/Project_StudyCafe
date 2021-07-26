



/**
 * 검색을 클릭했을 때 스터디룸 타입(4인, 6인)별 예약 가능 시간이 검색됨
 * @param obj
 * @returns
 */

function search() {
	
	$("#sixRoomTime1").prop("disabled", false);
	$("#sixRoomTime2").prop("disabled", false);
	$("#sixRoomTime3").prop("disabled", false);
	
	$("#usingTime").empty();
	
	var reservationDate = $("#reservationDate").val();
	
	// 티켓타입
	
	// 스터디룸 좌석정보(4인룸:128, 6인룸:129)
	var cafeSeatNo = $("[name='typeRoom']:checked").val();
	// input cafeSeatNo 히든 태그에 값 설정
	
//	$("#seatNo").val(cafeSeatNo);
	
	$("#cafeSeatNo").val(cafeSeatNo);
	// input ticketType 히든 태그에 값 설정
	if(cafeSeatNo == '128'){
		$("#hiddenTicketType").val('05');
	}else if(cafeSeatNo == '129'){
		$("#hiddenTicketType").val('06');
	}
	
	console.log($("#cafeSeatNo").val());
	console.log($("#hiddenTicketType").val());
	
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
		url: contextPath + "/getRoomList.do"
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
					var time = document.getElementById("usingTime").children[start + i + 1];
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
 * @return
 */
function save() {
	
	if(!confirm("발권하시겠습니까?")){
		return;
	}
	
	// 값 검증 작업 현재 없음
	
//	$("#cafeSeatNo").val($("[name='typeRoom']:checked").val());
	$("#hiddenTicketPrice").val( $("[name='ticketPrice']:checked").val());
	
//	alert($("#cafeSeatNo").val());
//	alert($("#hiddenTicketType").val());
//	alert($("#hiddenTicketType").val());
	
	
	$("#fm").submit();
	
//	if(!confirm("발권하시겠습니까?")){
//		return;
//	}
//	
//	var startTime = new Date($("#usingTime option:selected").val());
//	var endTime = startTime.setHours(startTime.getHours() + parseInt($("[name='ticketPrice']:checked").attr('id').substr(10)));
//	
//	startTime = startTime.format('yyyyMMddhh');
//	endTime = new Date(endTime).format('yyyyMMddhh');
//	
//	var param = {
//		// 자리 예약에 필요한 정보
//		cafeSeatNo : $("#cafeSeatNo").val()	
//		,userSeatStartDate : startTime
//		,userSeatEndDate : endTime
//		
//		// 티켓 결제에 필요한 정보
//		,cafeNo : cafeNo
//		,ticketType : $("[name='ticketType']:checked").val()
//		,ticketPrice : $("[name='ticketPrice']:checked").val()
//	}
//	
//	console.log(param);
//	console.log();
//	
//	$.ajax({
//		url: contextPath + "/userInsertSeat.do" // 결제 창으로 리다이렉트
//		,type: "post"
//		,data: param
//		,dataType: "json"
//		,success: function(data) {
//			$("#modalSeat").modal("hide");
//		}	
//		,error: function(xhr) {
//			console.log(xhr);
//			alert("오류입니다. 관리자에게 문의하세요." + "\n"
//					 + "status : " + xhr.status + "\n"
//					 + "statusCode : " + xhr.statusCode + "\n"
//					 + "statusText : " + xhr.statusText); 
//		}	
//	});
}


/**
 * 스터디룸 선택 
 * @param event
 * @returns
 */
$(document).on("click", "input[name='typeRoom']", function(event){
	$("#result").empty();
	
	var typeRoom = $(event.target).val();
	
	$("#divTicketPrice").empty();
	
	var strHtml = "";
	if(typeRoom == '128'){
		strHtml += "<input type='radio' name='ticketPrice' id='fourRoomTime1' value='8000' checked='checked'/>"
				+ "<label for='fourRoomTime1'>1시간/8,000원</label><br>"
				+ "<input type='radio' name='ticketPrice' id='fourRoomTime2' value='16000'/>" 
			 	+ "<label for='fourRoomTime2'>2시간/16,000원</label><br>" 
			 	+ "<input type='radio' name='ticketPrice' id='fourRoomTime3' value='24000'/>"
			 	+ "<label for='fourRoomTime3'>3시간/24,000원</label>" ;
	}else if(typeRoom == '129'){
		strHtml += "<input type='radio' name='ticketPrice' id='sixRoomTime1' value='10000' checked='checked'/>"
			 	+ "<label for='sixRoomTime1'>1시간/10,000원</label><br>"
		 		+ "<input type='radio' name='ticketPrice' id='sixRoomTime2' value='20000' />"
			 	+ "<label for='sixRoomTime2'>2시간/20,000원</label><br>"
		 		+ "<input type='radio' name='ticketPrice' id='sixRoomTime3' value='30000' />"
			 	+ "<label for='sixRoomTime3'>3시간/30,000원</label>";
	}
	$("#divTicketPrice").html(strHtml);
});



/** 
 * 이용권 선택 시 종료 시간 표시
 * @param event
 * @returns
 */
$(document).on("click", "input[name='ticketPrice']", function(event){
	
	console.log(event.target);
	var ticketTime = event.target.nextSibling.innerHTML.substr(0, 1);
	console.log(ticketTime);
//	console.log($(event.target).sibling());
	
	$("#timeInput").empty();
	$("#timeResult").empty();
//	var selectTime = $("#usingTime option:selected").val();
	
	var typeRoom = $("input[name='typeRoom']:checked").val();
	
//	if(typeRoom == '129'){
		
		// 예약 스케줄에 따라 이용권 disable
		var timeIdx = $("#usingTime option:selected").text();
		timeIdx = parseInt(timeIdx.substr(0, 2));
		
		console.log(timeIdx);
		
		var timeCnt = 0;
		
		var timeSelected = document.getElementById("usingTime");
		
		while($(timeSelected.children[timeIdx + 1]).prop("disabled") == false){
			timeCnt++;
			timeIdx++;
		}
		
		
		
		if(timeCnt < 1){
//			$("#sixRoomTime1").prop("disabled", true);
			$("#sixRoomTime2").prop("disabled", true);
			$("#sixRoomTime3").prop("disabled", true);
		}else if(timeCnt < 2){
//			$("#sixRoomTime2").prop("disabled", true);
			$("#sixRoomTime3").prop("disabled", true);
		}
		
		
		// 종료시간 계산
		var startTime = new Date($("#usingTime option:selected").val());
		var endTime = new Date(startTime.setHours(startTime.getHours() + parseInt(ticketTime)));
		
		$("#timeResult").html("종료 시간 :" + new Date(endTime).toLocaleString());
		
		$("#hiddenStartTime").val(new Date($("#usingTime option:selected").val()).format('yyyyMMddHH'));
		$("#hiddenEndTime").val(new Date(endTime).format('yyyyMMddHH'));
		
		console.log("당일권");
		console.log($("#hiddenStartTime").val());
		console.log($("#hiddenEndTime").val());
		
//	}else if(typeRoom == '129'){
//		$("<label>이용 시간 </label>").appendTo($("#timeInput"));
//		$("<input type='number' name='endTime' min='1'>").appendTo($("#timeInput"));
//		$("<label> 시간</label>").appendTo($("#timeInput"));
//		
//		var timeIdx = $("#usingTime option:selected").text();
//		timeIdx = parseInt(timeIdx.substr(0, 2));
//		
//		var timeCnt = 0;
//		
//		var timeSelected = document.getElementById("usingTime");
//		
//		while($(timeSelected.children[timeIdx + 1]).prop("disabled") == false){
//			timeCnt++;
//			timeIdx++;
//		}
//		
//		$("input[name='endTime']").attr('max', timeCnt);
//		
//	}
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





// 날짜 형식 설정 함수
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