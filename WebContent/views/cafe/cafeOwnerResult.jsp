<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[

<%
	List<OwnerVO> ownerList = (List<OwnerVO>)request.getAttribute("ownerList");
for(int i=0; i<ownerList.size(); i++){
	if(i>0){
%>,<%
	}
	OwnerVO ownerVO = ownerList.get(i);
	
	String ownerId = ownerVO.getOwnerId();
	String ownerName = ownerVO.getOwnerName();
%>
	{
		"ownerId" : "<%=ownerId %>"
		,"ownerName" : "<%=ownerName %>"
	}	
	<%
}
%>

]