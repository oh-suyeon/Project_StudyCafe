<%@page import="daily.ticket.vo.ChoiceTicketInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	ChoiceTicketInfoVO ticketInfoVO = (ChoiceTicketInfoVO) request.getAttribute("ticketInfoVO");

	String seatCode       = ticketInfoVO.getSeatCode()     ;
	String ticketTime     = ticketInfoVO.getTicketTime()     ;
	String ticketPrice    = ticketInfoVO.getTicketPrice()       ;
	String ticketType     = ticketInfoVO.getTicketType()     ;
	String ticketTypeTime = ticketInfoVO.getTicketTypeTime()    ;
	
%>
	{
		"seatCode"       :  "<%=seatCode %>"
		,"ticketTime"     :  "<%=ticketTime %>"
		,"ticketPrice"    :  "<%=ticketPrice %>"
		,"ticketType"     :  "<%=ticketType %>"
		,"ticketTypeTime" :  "<%=ticketTypeTime %>"     
		             
	}
