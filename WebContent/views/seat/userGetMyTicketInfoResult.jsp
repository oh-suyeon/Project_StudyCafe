<%@page import="daily.ticket.vo.TicketCafeNameVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="daily.ticket.vo.TicketVO"%>
<%@page import="daily.seat.vo.UserSeatVO"%>
<%@page import="daily.seat.vo.SeatVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[

<%	

	SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd hh:mm");

	TicketCafeNameVO ticketVO = (TicketCafeNameVO)request.getAttribute("ticketVO");

		String buyTicketNo = ticketVO.getBuyTicketNo();
		String ticketNo = ticketVO.getTicketNo();
		String cafeNo = ticketVO.getCafeNo();
		String userId = ticketVO.getUserId();
		Date buyTicketDate1 = ticketVO.getBuyTicketDate();
		String buyTicketDate = dateFm.format(buyTicketDate1);
		String buyCode = ticketVO.getBuyCode();
		int buyAmount = ticketVO.getBuyAmount();
		String userCouponNo = ticketVO.getUserCouponNo();
		int buyCouponAmount = ticketVO.getBuyCouponAmount();
		int buyMileage = ticketVO.getBuyMileage();
		int buyRealAmount = ticketVO.getBuyRealAmount();
		String buyRefundYn = ticketVO.getBuyRefundYn();
		String buyRefundReason = ticketVO.getBuyRefundReason();
		String cafeName = ticketVO.getCafeName();
		
		%>
		{
			"buyTicketNo" : "<%=buyTicketNo %>"
			,"ticketNo" : "<%=ticketNo %>"
			,"cafeNo" : "<%=cafeNo %>"
			,"userId" : "<%=userId %>"
			,"buyTicketDate" : "<%=buyTicketDate %>"
			,"buyCode" : "<%=buyCode %>"
			,"buyAmount" : "<%=buyAmount %>"
			,"buyCouponAmount" : "<%=buyCouponAmount %>"
			,"buyMileage" : "<%=buyMileage %>"
			,"buyRealAmount" : "<%=buyRealAmount %>"
			,"buyRefundYn" : "<%=buyRefundYn %>"
			,"buyRefundReason" : "<%=buyRefundReason %>"
			,"cafeName" : "<%=cafeName %>"
		}

]