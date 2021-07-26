<%@page import="daily.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int resultCount = (Integer) request.getAttribute("resultCount");
	UserVO userVO = (UserVO)request.getAttribute("userVO");
	session.setAttribute("userVO", userVO);
	String loginName = userVO.getUserName();
	session.setAttribute("loginName", loginName);
%>
{"resultCnt" : <%=resultCount %>}