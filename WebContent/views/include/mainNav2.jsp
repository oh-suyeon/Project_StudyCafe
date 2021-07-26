<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String reqUrl = request.getRequestURI();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<nav class="navbar ">
		<div class="container marginBottom30">

				<!-- 커뮤니티 -->
				<%if(reqUrl.indexOf("otice") != -1 
					 || reqUrl.indexOf("gs") != -1 
					 || reqUrl.indexOf("chain") != -1){ %>
					<div class="collapse navbar-collapse" style="text-align: center;">
						<ul class="nav navbar-nav"  style="width: 100%"> 
							<li class="active" style="width: calc(100% / 4)">
								<a href="<%=request.getContextPath() %>/getNoticeList.do">
									전체 공지사항
								</a>
							</li>
							<li class="active" style="width: calc(100% / 4)">
								<a href="<%=request.getContextPath() %>/gsRecruitList.do">
									그룹 스터디
								</a>
							</li>
							<li class="active" style="width: calc(100% / 4)">
								<a href="<%=request.getContextPath() %>/chainQnAList.do">
									1:1 가맹 문의
								</a>
							</li>
							<li class="active" style="width: calc(100% / 4)">
								<a href="<%=request.getContextPath() %>/gsFeedList.do">
									자유게시판
								</a>
							</li>
						</ul>
					</div>
					<hr>
				
				<!-- 소개 안내 -->
				<%}else if(reqUrl.indexOf("ntroduce") != -1) {%>
					<div class="collapse navbar-collapse" style="text-align: center;">
						<ul class="nav navbar-nav"  style="width: 100%">
							<li class="active" style="width: calc(100% / 4)">
								<a href="<%=request.getContextPath() %>/views/introduce/mainIntroduceBrand.jsp">
									브랜드 소개
								</a>
							</li>
							<li class="active" style="width: calc(100% / 4)">
								<a href="<%=request.getContextPath() %>/views/introduce/mainIntroduceInterior.jsp">
									인테리어 소개
								</a>
							</li>
							<li class="active" style="width: calc(100% / 4)">
								<a href="<%=request.getContextPath() %>/views/introduce/mainIntroduceGuidance.jsp">
									매장 이용 안내
								</a>
							</li>
							<li class="active" style="width: calc(100% / 4)">
								<a href="<%=request.getContextPath() %>/views/introduce/mainIntroduceRoute.jsp">
									찾아오시는 길
								</a>
							</li>
						</ul>
					</div>
					<hr>
				<%} %>
				
				<!-- 추후 스터디 -->
				<!-- 추후 마이페이지 -->
		</div>
	</nav>

