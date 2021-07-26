<%@page import="daily.seat.vo.UserSeatVO"%>
<%@page import="daily.seat.vo.SeatVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[

<%
	List<UserSeatVO> userSeatList = (List<UserSeatVO>)request.getAttribute("userSeatList");

	for(int i=0; i<userSeatList.size(); i++){
		if(i>0){
			%>,<%
		}
		
		UserSeatVO seatVO = userSeatList.get(i);
		
		String userSeatNo = seatVO.getUserSeatNo();
		String cafeSeatNo = seatVO.getCafeSeatNo();
		String buyTicketNo = seatVO.getBuyTicketNo();
		String userSeatStartDate = seatVO.getUserSeatStartDate();
		String userSeatEndDate = seatVO.getUserSeatEndDate();
		String checkInDate = seatVO.getCheckInDate();
		String checkOutDate = seatVO.getCheckOutDate();
		byte[] checkBarcode = seatVO.getCheckBarcode();
		int roomUserCnt = seatVO.getRoomUserCnt();
		String userId = seatVO.getUserId();
		
		%>
		{
			"userSeatNo" : "<%=userSeatNo %>"
			,"cafeSeatNo" : "<%=cafeSeatNo %>"
			,"buyTicketNo" : "<%=buyTicketNo %>"
			,"userSeatStartDate" : "<%=userSeatStartDate %>"
			,"userSeatEndDate" : "<%=userSeatEndDate %>"
			,"checkInDate" : "<%=checkInDate %>"
			,"checkOutDate" : "<%=checkOutDate %>"
			,"checkBarcode" : "<%=checkBarcode %>"
			,"roomUserCnt" : "<%=roomUserCnt %>"
			,"userId" : "<%=userId %>"
		}
		<%
	}
%>

]