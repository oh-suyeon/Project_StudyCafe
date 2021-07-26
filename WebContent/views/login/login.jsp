<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인 화면</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstdtrap.min.js"></script>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<link rel="stylesheet" href="/css/login/login.css">
	<script src="/js/login/login.js"></script>
</head>
<body>
	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	<div class="container">
	    <div class="h-100">
	        <div class="card">
	            <div class="card-header">
	                <h3>로그인</h3>
	            </div>
	            <div class="card-body">
	            	<form class="form-horizontal" id="fm" action="<%=request.getContextPath() %>/login.do" method="post">
		               <div class="input-group form-group">
							<div class="input-group-prepend">
								<span>아이디</span>
							</div>
							<input type="text" class="form-control" placeholder="아이디를 입력하세요." id="commonId" name="commonId">
							
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span>비밀번호</span>
							</div>
							<input type="password" class="form-control" placeholder="비밀번호를 입력하세요." id="commonPw" name="commonPw">
						</div>
						<div class="row align-items-center remember">
							<input type="radio" id="code1" name="gubunCode" value="code1" checked="checked">
							<label for="code1">회원</label>
							<input type="radio" id="code2" name="gubunCode" value="code2">
							<label for="code2">지점주</label>
						</div>
						<div class="form-group">
							<button type="submit" class="btn float-right login_btn">로그인</button>
						</div>
	                </form>
	            </div>
	            <div class="card-footer">
				<div class="d-flex justify-content-center links">
					<a href="<%=request.getContextPath() %>/userJoin.do">회원 가입</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="<%=request.getContextPath() %>/searchId.do">아이디 찾기</a>
					<a href="<%=request.getContextPath() %>/selectIdEmail.do">비밀번호 찾기</a>
				</div>
				</div>
	        </div>
	    </div>
	</div>
	<!-- footer -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>