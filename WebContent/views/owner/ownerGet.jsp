<%@page import="daily.owner.vo.OwnerCafeInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
OwnerCafeInfoVO ownerVO = (OwnerCafeInfoVO)request.getAttribute("ownerVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>지점주 상세정보</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="/js/owner/ownerCreate.js"></script>
	<link rel="stylesheet" href="/css/join/userJoin.css">
	<script type="text/javascript">
		function remove(){
			if(!confirm("지점주 계정을 삭제 하시겠습니까?")){
				return;
			}
<%-- 			var ownerId = "<%=ownerVO.getOwnerId() %>"; --%>
			
			location.href="<%=request.getContextPath() %>/ownerDelete.do?ownerId=<%=ownerVO.getOwnerId() %>";
		}
		
		function update(){
			
<%-- 			var ownerId = "<%=ownerVO.getOwnerId() %>"; --%>
			
			location.href="<%=request.getContextPath() %>/ownerUpdate.do?ownerId=<%=ownerVO.getOwnerId() %>";
		}
	
	</script>
</head>
<body>
	<div class="container">
		<h2 class="text-center">지점주 상세정보</h2>
		<br>
		<div>
			<form class="form-horizontal" id="fm">
				<div class="border5">
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerId">아이디:</label>
					<div class="col-sm-10 fontSize3">
						<%=ownerVO.getOwnerId() %>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerName">이름:</label>
					<div class="col-sm-10">
						<%=ownerVO.getOwnerName() %>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerHp1">휴대폰 <br>번호:</label>
					<div class="col-sm-10">
						<%
						String ownerHp = ownerVO.getOwnerHp();
						String hp1 = ownerHp.substring(0, 3);
						String hp2 = ownerHp.substring(3, 7);
						String hp3 = ownerHp.substring(7);
						%>
						<%=hp1 %>-<%=hp2 %>-<%=hp3 %>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerEmail">이메일:</label>
					<div class="col-sm-10">
						<%=ownerVO.getOwnerEmail() %>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerAddr">주소:</label>
					<div class="col-sm-10">
						<%=ownerVO.getOwnerAddr1() %> <%=ownerVO.getOwnerAddr2() %>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="ownerBirth">생년월일:</label>
					<div class="col-sm-10">
						<%=ownerVO.getOwnerBirth() %>
					</div>
				</div>
				<div class="form-group lastRow ">
					<div class="btnDiv">
						<button type="button" class="btn btn-primary" onclick="update()">수정</button>
						<button type="button" class="btn btn-danger" onclick="remove()">삭제</button>
						<button type="button" class="btn btn-info" onclick="cancel()">목록</button>
					</div>
			</form>
		</div>
	</div>
</body>
</html>