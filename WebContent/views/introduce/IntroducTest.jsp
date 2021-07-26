<%@page import="daily.common.vo.AtchFileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

AtchFileVO atchVO = (AtchFileVO)request.getAttribute("atchVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="fmAtchFile">
		<input type="text" name="cafeNo" value="53">
		<button type="button" onclick="func()">실행</button>
	</form>
	<div>
		<%
			if(atchVO != null){
				%>
		<div>
			저장 경로 : <%=atchVO.getFileStreCours() %>
		</div>
		<div>
			파일 실제 이름 : <%=atchVO.getFileOriginalName() %>
		</div>
		<div>
			저장된 이름 : <%=atchVO.getFileName() %>
		</div>
		<div>
			<img src="/image/uploads/<%=atchVO.getFileName() %>">
			<img src="/image/uploads\b543f8c6f5a04a77bf5c819eb88e1b7f">
		</div>
				
				<%
			}
		%>
	</div>
</body>
<script type="text/javascript">
	function func(){
		var fm = document.getElementById("fmAtchFile");
		fm.action="<%=request.getContextPath() %>/imageTest.do";
		fm.method="post";
		fm.enctype="multipart/form-data";
		fm.submit();
		
	}
	
</script>
</html>