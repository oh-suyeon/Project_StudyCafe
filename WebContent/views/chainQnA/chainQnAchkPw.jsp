<%@page import="daily.chainQnA.vo.ChainQnAVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ChainQnAVO chainQnAVO = (ChainQnAVO)request.getAttribute("chainQnAVO");
	if(chainQnAVO == null) {//게시글번호와 비밀번호가 일치하는 게 없으면
		%>
		{"resultCnt" : 0}
		<% 
	}else { //게시글 번호와 비밀번호가 일치하는게 있으면
		%>
		{"resultCnt" : 1}
		<% 
	}
%>