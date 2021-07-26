<%@page import="daily.cafe.vo.CafeRegionNameVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[

<%
	List<CafeRegionNameVO> cafeList = (List<CafeRegionNameVO>)request.getAttribute("cafeList");
for(int i=0; i<cafeList.size(); i++){
	if(i>0){
%>,<%
	}
	CafeRegionNameVO cafeVO = cafeList.get(i);
	
	String cafeNo = cafeVO.getCafeNo();
	String ownerId = cafeVO.getOwnerId();
	String cafeName = cafeVO.getCafeName();
	String cafeTel = cafeVO.getCafeTel();
	String cafeZip = cafeVO.getCafeZip();
	String cafeAddr1 = cafeVO.getCafeAddr1();
	String cafeAddr2 = cafeVO.getCafeAddr2();
	String cafeRunCode = cafeVO.getCafeRunCode();
	String lat = cafeVO.getCafeXPosition();
	String lng = cafeVO.getCafeYPosition();
	String cafeRegionCode = cafeVO.getCafeRegionCode();
	String cafeRegionName = cafeVO.getCafeRegionName();
%>
	{
		"cafeNO" : "<%=cafeNo %>"
		,"ownerId" : "<%=ownerId %>"
		,"cafeName" : "<%=cafeName %>"
		,"cafeTel" : "<%=cafeTel %>"
		,"cafeZip" : "<%=cafeZip %>"
		,"cafeZip" : "<%=cafeZip %>"
		,"cafeAddr1" : "<%=cafeAddr1 %>"
		,"cafeAddr2" : "<%=cafeAddr2 %>"
		,"cafeRunCode" : "<%=cafeRunCode %>"
		,"lat" : "<%=lat %>"
		,"lng" : "<%=lng %>"
		,"cafeRegionCode" : "<%=cafeRegionCode %>"
		,"cafeRegionName" : "<%=cafeRegionName %>"
	}	
	<%
}
%>

]