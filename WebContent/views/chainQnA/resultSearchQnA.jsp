<%@page import="java.util.List"%>
<%@page import="daily.chainQnA.vo.ChainQnAVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[

<%
List<ChainQnAVO> searchQnAList = (List<ChainQnAVO>)request.getAttribute("searchQnAList");

if(searchQnAList != null) {//해당 조건과 일치하는 결과가 있으면 
	for(int i=0; i < searchQnAList.size(); i++) {
		
		if(i>0){
		%>,<%	
		}
		
	%>
	
		{
			"chainQnaNo" : "<%=searchQnAList.get(i).getChainQnaNo()%>"
			,"writerName" : "<%=searchQnAList.get(i).getWriterName()%>"
			,"chainQnaTitle" : "<%=searchQnAList.get(i).getChainQnaTitle()%>"
			,"chainQnaRegDate" : "<%=searchQnAList.get(i).getChainQnaRegDate()%>"
		}
		 
	<%
	}
	 
}
%>

]