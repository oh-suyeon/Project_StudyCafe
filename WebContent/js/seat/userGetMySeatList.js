/**
 * 회원의 좌석 발권 내역을 보여준다
 */


/**
 * 좌석 내역을 가져온다
 * @returns
 */
$(document).ready(function() {
	
	var param = {
		flag : "resultSeatList"
		,userId : loginId
	}
	
	$.ajax({
		url : contextPath + "/userGetMySeatList.do"
		,type: "get"
		,data : param
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


/**
 * 받아온 리스트를 테이블로 뿌려준다
 * @param obj
 * @returns
 */
function makeSeatList(obj) {
	
	$("#tb").empty();
	
	var htmlStr = "";
	
	if(obj.length==0){
		htmlStr = "<tr>"
				+ "<td colspan='6'>" + "발권/결제 내역이 없습니다" + "</td>"
				+ "</tr>";
		$("#tb").html(htmlStr);
		return;
	}
	
	$(obj).each(function(idx, item) {
		
		var inDate = "";
		if(item.checkInDate=="null"){
			inDate = " - - : - - ";
		}
		
		var outDate = "";
		if(item.checkOutDate=="null"){
			outDate = " - - : - - ";
		}
		
		var roomUserCnt = '';
		if(item.cafeSeatNo == 128){
			roomUserCnt = '~ 4';
		}else if(item.cafeSeatNo == 129){
			roomUserCnt = '~ 6';
		}else {
			roomUserCnt = '1';
		}
		
		htmlStr += "<tr onclick='getInfo(" + item.buyTicketNo + ");' " 
				+ "data-toggle='modal' data-target='#modalTicket'>"
				+ "<td>" + item.cafeSeatNo + "</td>"
				+ "<td>" + item.userSeatStartDate + "</td>"
				+ "<td>" + item.userSeatEndDate + "</td>"
				+ "<td>" + inDate + "</td>"
				+ "<td>" + outDate + "</td>"
				+ "<td>" + roomUserCnt + "</td>"
				+ "</tr>";
	});
	
	$("#tb").html(htmlStr);
	
}

/** 
 * 결제 정보를 모달 창에 보여준다
 * @param buyTicketNo
 * @returns
 */
function getInfo(buyTicketNo) {
	
	$("#fm").hide();
	
	var param = {
		buyTicketNo : buyTicketNo
		,flag : "resultTicket"
	}
	
	// 바코드 만들기
	$("#bcTarget").barcode(""+buyTicketNo+"", "datamatrix",{moduleSize:10, showHRI:false});
	
	
	$.ajax({
		url : contextPath + "/userGetMySeatList.do"
		,type: "get"
		,data : param
		,dataType: "json"
		,success: function(data) {
			console.log(data);
			showInfo(data);
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

function showInfo(ticketVO) {
	
	$("#modalTb tbody").empty();
	
	var ticketName = "";
	
	console.log(ticketVO[0].ticketNo);
	
	if(ticketVO[0].ticketNo == 1){
		ticketName = "당일권 2시간";
	}else if(ticketVO[0].ticketNo == 2){
		ticketName = "당일권 4시간";
	}else if(ticketVO[0].ticketNo == 3){
		ticketName = "당일권 6시간";
	}else if(ticketVO[0].ticketNo == 4){
		ticketName = "정기권 1주";
	}else if(ticketVO[0].ticketNo == 5){
		ticketName = "정기권 2주";
	}else if(ticketVO[0].ticketNo == 6){
		ticketName = "정기권 4주";
	}else if(ticketVO[0].ticketNo == "null" || ticketVO[0].ticketNo == ""){
		ticketName = "스터디 룸";
	}
	
	var htmlStr = "<tr>"
			+ "<td>" + ticketVO[0].buyTicketNo + "</td>"
			+ "<td>" + ticketName + "</td>"
			+ "<td>" + ticketVO[0].cafeName + "</td>"
			+ "<td>" + ticketVO[0].buyTicketDate + "</td>"
			+ "<td>" + ticketVO[0].buyCode + "</td>"
			+ "<td>" + ticketVO[0].buyAmount + "</td>"
//			+ "<td>" + ticketVO[0].buyCouponAmount + "</td>"
//			+ "<td>" + ticketVO[0].buyMileage + "</td>"
//			+ "<td>" + ticketVO[0].buyRealAmount + "</td>"
			+ "<td>" + ticketVO[0].buyRefundYn + "</td>"
			+ "<td>" + ticketVO[0].buyRefundReason + "</td>"
			+ "</tr>";
	
	console.log(ticketVO[0].cafeName);
	
	$("#modalTb tbody").html(htmlStr);
	
}


// 결제 취소 조건을 단다
function refund(str) {
	
	var date = new Date(str.substr(0, 10));
	if(date <= new Date()){
		$("#refundBtn").show();
	}
	
}


// 결제 취소 하기
function getRefund() {
	
	if(!confirm("결제를 취소하시겠습니까?")){
		return;
	}
	
	$("#fm").submit();
	
}
















//날짜 형식 설정 함수 // 
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
