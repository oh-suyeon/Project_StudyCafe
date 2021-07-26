<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="daily.common.vo.AtchFileVO"%>
<%@page import="daily.common.vo.PagingVO"%>
<%@page import="daily.gsFeed.vo.GsFeedVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<GsFeedVO> gsFeedList = (List<GsFeedVO>)request.getAttribute("gsFeedList");

	// 	String msg = request.getParameter("msg") == null ?

// 	PagingVO pagingVO = (PagingVO) request.getAttribute("pagingVO");
	
// 	List<AtchFileVO> atchFileList = (List<AtchFileVO>)request.getAttribute("atchFileList");
%>
<% // 로그인 확인 작업
	String loginId = (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	

    <meta charset="UTF-8">
    <title>자유게시판 목록</title>

    <meta name="author" content="3team">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1, minimum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <meta property="og:type" content="website">
    <meta property="og:site_name" content="wehouse">
    <meta property="og:title" content="Introduce your home, together">
    <meta property="og:description" content="Deadock MiddleProject">
    <meta property="og:image" content="img/logo__github.png">
    <meta property="og:url" content="https://wehouse.com">

    <link rel="stylesheet" href="../../css/gsFeed/reset.css">
    <link rel="stylesheet" href="../../css/gsFeed/home.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

    
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
</head>
<body>
	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">자유게시판</span>
		</div>

    <!-- 메인 배너 -->
  
        <section class="section section--category">
        <div class="inner">
            <div class="dropdown">
                <button type="button" class="category--type btn">자유게시판
                    <i style="margin-left: 10px;"class="fas fa-angle-down"></i>
                </button>
                	<a href=gsFeedInsert.do><button type="button" class="btn btn-default" id="writeBtn">글작성</button></a>
<!--                 <div class="dropdown-content"> -->
<!--                     <a href="#">토익</a> -->
<!--                     <a href="#">자바</a>                -->
<!--                 </div> -->
            </div>
    	</div>
  		</section>
 	</section>
    <!-- 카테고리 -->
 
    <section class="section section--board" style="width: 100%">
	<%
	int gsFeedSize = gsFeedList.size();
	for (int i = 0; i < gsFeedSize; i++) {
		if(i%4 == 0){%>
        <div class="inner">
		<%}%>
		
            <div class="grid_test">

                <div class="profile">
                    <ul class="user">
                        <li class="user_info">
                            <div class="follow">
                                <span class="user-id"><%=gsFeedList.get(i).getUserId()%></span>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="thumnail">
                    <div class="mask">
                		<a href="gsFeedDetail.do?gsFeedNo=<%=gsFeedList.get(i).getGsFeedNo()%>">
							<img src="<%=request.getContextPath() %>/image/uploads/<%=gsFeedList.get(i).getFileName() %>" alt="" onclick="detail()">
                   		</a>
                    </div>
                </div>
                <div class="user-description">
                   <%=gsFeedList.get(i).getGsFeedTitle()%>
                </div>
			</div>
		
		<%if(i%4 == 3 || i == (gsFeedSize-1)){%>
        </div>
		<%}
		}// for문
		%>
	
	</section>
	</div>
    <script src="../../js/gsFeed/gsFeedList.js"></script>
    
    		<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>












