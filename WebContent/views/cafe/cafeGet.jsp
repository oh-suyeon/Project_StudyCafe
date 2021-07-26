<%@page import="daily.cafe.vo.CafeRegionNameVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CafeRegionNameVO cafeVO = (CafeRegionNameVO) request.getAttribute("cafeVO");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>지점 등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="/js/cafe/cafeCreate.js"></script>
	<link rel="stylesheet" href="/css/join/userJoin.css">
	<script type="text/javascript">
		function remove(){
			if(!confirm("지점 정보를 삭제 하시겠습니까?")){
				return;
			}
			
			location.href="<%=request.getContextPath() %>/cafeDelete.do?cafeNo=<%=cafeVO.getCafeNo() %>";
		}
		
		function update(){
			location.href="<%=request.getContextPath() %>/cafeUpdate.do?cafeNo=<%=cafeVO.getCafeNo() %>";
		}
	
	</script>
</head>
<body>
	<div class="container">
		<h2 class="text-center">지점 상세</h2>
		<br>
		<div>
			<form class="form-horizontal" id="fmCafeCreate">
				<div class="border5">
					<div class="form-group">
						<label class="control-label col-sm-2" for="ownerId">지점주 아이디:</label>
						<div class="col-sm-10 form-inline">
							<%=cafeVO.getOwnerId() %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="cafeName">지점명:</label>
						<div class="col-sm-10 form-inline">
							<%=cafeVO.getCafeName() %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="cafeHp1">지점 <br>전화번호:</label>
						<div class="col-sm-10 form-inline">
	 						<%
							String cafeTel = cafeVO.getCafeTel();
							String tel1 = cafeTel.substring(0, 3);
							String tel2 = cafeTel.substring(3, 7);
							String tel3 = cafeTel.substring(7);
							%>
							<%=tel1 %>-<%=tel2 %>-<%=tel3 %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="ownerAddr">주소:</label>
						<div class="col-sm-10">
							<%=cafeVO.getCafeAddr1() %> <%=cafeVO.getCafeAddr2() %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="cafeRunCode">운영상태코드:</label>
						<div>
							<%=cafeVO.getCafeRunName() %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="cafeRegionCode">지역코드명:</label>
						<div class="col-sm-10 form-inline">
							<%=cafeVO.getCafeRegionName() %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="cafeXPosition">X좌표:</label>
						<div class="col-sm-10 form-inline">
							<%=cafeVO.getCafeXPosition() %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="cafeYPosition">Y좌표:</label>
						<div class="col-sm-10 form-inline">
							<%=cafeVO.getCafeYPosition() %>
						</div>
					</div>
					<div class="form-group lastRow ">
						<div class="btnDiv">
							<button type="button" class="btn btn-primary" onclick="update()">수정</button>
							<button type="button" class="btn btn-info" onclick="remove()">삭제</button>
							<button type="button" class="btn btn-info" onclick="cancel()">목록</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>