<%@page import="daily.seat.vo.SeatVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[

<%
	List<SeatVO> seatList = (List<SeatVO>)request.getAttribute("seatList");

	for(int i=0; i<seatList.size(); i++){
		if(i>0){
			%>,<%
		}
		
		SeatVO seatVO = seatList.get(i);
		
		String cafeSeatNo = seatVO.getCafeSeatNo();
		String cafeNo = seatVO.getCafeNo();
		String seatNo = seatVO.getSeatNo();
		String seatXPosition = seatVO.getSeatXPosition();
		String seatYPosition = seatVO.getSeatYPosition();
		String seatCode = seatVO.getSeatCode();
		String seatUsableYn = seatVO.getSeatUsableYn();
		String seatUsingYn = seatVO.getSeatUsingYn();
		%>
		{
			"cafeSeatNo" : "<%=cafeSeatNo %>"
			,"cafeNo" : "<%=cafeNo %>"
			,"seatNo" : "<%=seatNo %>"
			,"seatXPosition" : "<%=seatXPosition %>"
			,"seatYPosition" : "<%=seatYPosition %>"
			,"seatCode" : "<%=seatCode %>"
			,"seatUsableYn" : "<%=seatUsableYn %>"
			,"seatUsingYn" : "<%=seatUsingYn %>"
		}
		<%
	}
%>

]