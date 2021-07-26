
<%@page import="daily.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	UserVO userVO = (UserVO) request.getAttribute("userVO");  
	if(userVO == null) {//중복된 Id가 없음
		%>
		{"resultCnt" : 0}
		<% 
	}else { //중복된 Id가 있음
		%>
		{"resultCnt" : 1}
		<% 
	}
%>