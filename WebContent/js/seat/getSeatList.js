/**
 * 카페의 좌석 리스트 정보를 가져온다
 * @returns
 */

$(document).ready(function() {
	var param = {
			flag : "result"
			,ownerId : loginId
			,seatCode : "01"
	}
	
	$.ajax({
		url: contextPath + "/getSeatList.do"
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
			// 만약 usableYN가 N면 회색, Y면 초록색
			
			var value = JSON.stringify(obj[cnt]);
			
			if(obj[cnt].seatUsableYn == "Y"){
				htmlStr += "<td class='text-center'>"
					+ "<button type='button' class='btn btn-success seatBtn' onclick='showInfo(this)' value='"+ value +"'" 
					+ "data-toggle='modal' data-target='#modalSeat'>"
					+ seatNo
					+ "</button>" 
					+ "</td>";
				
				seatNo++;
			}else{
				htmlStr += "<td class='text-center'>"
					+ "<button type='button' class='btn seatBtn' onclick='showInfo(this)' value='"+ value +"'" 
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


/**
 * 좌석을 클릭했을 때 해당 좌석의 정보를 띄운다
 * @param obj
 * @returns
 */
function showInfo(obj) {
	
	// 알림 숨기기
	$("#seatUsingYn").hide();
	$("#saveBtn").prop("disabled", false);
	
	var vals = $(obj).val();
	vals = JSON.parse(vals);
	var seatNo = $(obj).text();
	
	// usingYN 업데이트 먼저 해주기
//	$("#cafeSeatNoInput").val(vals.cafeSeatNo);
//	$("#fm").submit();
	
	var usingStr = "";
	var usingFlag = false;
	
	// 현재 이용자의 예약이 있는 자리인가? - 알림 보이기
	if(vals.seatUsingYn == "Y"){
		usingStr = "현재 이용자의 예약이 존재하는 좌석입니다.";
		usingFlag = true;
		$("#seatUsingYn").text(usingStr).prependTo($(".modal-body"));
		$("#seatUsingYn").show();
		$("#saveBtn").prop("disabled", true);
	}
	
	// cafeSeatNo, cafeNo 값을  hidden input에 넣어주기
	$("#cafeSeatNo").val(vals.cafeSeatNo);
	$("#cafeNo").val(vals.cafeNo);
	
	// 발권 가능 여부
	if(vals.seatUsableYn == "Y"){
		$("#seatUsableY").prop("checked", true);
		$("#seatUsableN").prop("checked", false);
	}else{
		$("#seatUsableY").prop("checked", false);
		$("#seatUsableN").prop("checked", true);
	}
	
}

/**
 * 완료 버튼 누르면 모든 seatNo가 저장된다 
 * @returns
 */
$(document).on('click', '#saveAll', function() {
	
	var sqlString = "";
	
	var trArr = $("#tb").children();
	
	$(trArr).each(function(idx, item) {
		var tdArr = $(item).children();
		
		$(tdArr).each(function(idx2, item2) {
			var seatNo = $(item2).text();
			
			var val = $(item2).children(0).val();
			val = JSON.parse(val);
			var cafeSeatNo = val.cafeSeatNo;
			
			if(seatNo != " "){
				sqlString += "UPDATE TB_SEAT SET SEAT_NO = " + seatNo 
						  + " WHERE CAFE_SEAT_NO=" + cafeSeatNo + "; ";
			}
		});
		
	});
	
	$("#sqlString").val(sqlString);
	
	console.log(sqlString);
//	$("#fm").submit();
});

/**
 * 수정한 좌석 정보를 저장한다 
 * @returns
 */
function save() {
	
	// 값 검증 seatUsingYN가 Y면 이용자의 예약이 있는 자리라는 의미
	// 좌석을 비활성화할 수 없다.
	
	
	if(!confirm("저장하시겠습니까?")){
		return;
	}
	
	var param = {
		cafeSeatNo : $("#cafeSeatNo").val()	
		,cafeNo : $("#cafeNo").val()	
		,ownerId : $("#ownerId").val()	
		,seatUsableYn : $("input[name='seatUsableYn']:checked").val()
	}
	
	console.log(param.seatUsableYn);
	
	$.ajax({
		url: contextPath + "/updateSeat.do"
		,type: "post"
		,data: param
		,dataType: "json"
		,success: function(data) {
			alert("정보가 저장되었습니다.");
			$("#modalSeat").modal("hide");
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
}


