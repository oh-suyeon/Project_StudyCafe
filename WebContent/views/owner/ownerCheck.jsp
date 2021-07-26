<%@page import="daily.owner.vo.OwnerCafeInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	OwnerCafeInfoVO ownerVO = (OwnerCafeInfoVO) request.getAttribute("ownerVO");  
	if(ownerVO == null) {//중복된 Id가 없음
		%>
		{"resultCnt" : 0}
		<% 
	}else { //중복된 Id가 있음
		%>
		{"resultCnt" : 1}
		<% 
	}
%>