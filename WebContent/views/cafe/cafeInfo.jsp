<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

table, tr, td{border:0; box-sizing:border-box}
.subtab{width:100%;  text-align:center;box-sizing:border-box; border:0px solid #ddd}
.subtab td{width:50%; float:left}
.subtab td a{display:block; width:100%; color:#000}
.subtab td a.white{color:#fff}
.sub_content{position:relative}
.sub_content h3{color:#9f5e1e; font-family: 'Montserrat', sans-serif; margin-top:100px; font-size:30px}
.sub_content h2{text-align:center; margin-bottom:80px}


.pointli{width:33.33333%; float:left; margin-bottom:50px}
.pointli img{padding:0px 6px; margin-bottom:24px}
.pointli img:hover{opacity:.7}
.pointli p{padding:0px 6px;margin-bottom: 0;}
.pointli h2{font-size: 35px;padding:0px 6px;margin-bottom:40px; font-weight:600}

.formmail_fix{margin-top:0 !important}
.sub_content table tr td{text-align:center;color:#252525 !important;}
.sub_content table {margin-bottom:80px}
.table-tit{font-size: 25px;    line-height: 2;}
.table-tit:before{content: '';
    /* width: 2px; */
    padding: 2px;
    background-color: #9f5e1e;
    margin-right: 21px;
    height: 17px;
    display: inline-block;
	}
.use_con .container h2{text-align:center; margin-bottom:40px; padding-bottom:40px; border-bottom:1px solid #fff}
.use_con{ color:#fff}
.use_con .table-tit:before{background-color:#fff}
.use_con .container{padding: 120px 0;}
.sub_content .container{margin-bottom: 120px;}
.m_container{display:none}

@media (max-width: 768px){

.con_header{width: 100%;padding: 60px;padding-top: 100px;background-attachment: inherit;}
.con_header h1 {font-size: 1.4em;margin-top: 0 !important;}

.sub_content h2{margin-bottom:30px}
.sub_content h3{  font-size: 1.2em;  margin-top: 50px;}
.sub_content h2{font-size: 1.5em;}
.sub_content {padding: 16px;}
.viewwrap{padding:0;}
.tabli{padding:10px}
.tabli a {font-size:0.8em;   width: 33.3333%;}
.tabli a:nth-child(4){border-left:1px solid #9f5e1e;    border-top: 0px;}
.tabli a:nth-child(5){  border-top: 0px; }
.gallery-thumbs{display:none}
.table-tit {font-size: 1.2em;    padding-top: 10px;
    border-top: 1px solid #f3f3f3;}
.sub_content table tr td {font-size: 0.9em;}
.sub_content td {padding: 11px 5px;}
.sub_content table {margin-bottom: 30px;}
.sub_content .container{margin-bottom: 20px;}
.use_con .container{padding: 40px 16px;}
.use_con h2 {font-size:1.5em;}
.use_con h3{font-size: 1.2em;font-family: 'Montserrat', sans-serif;}
.use_con .table-tit {border-top: 0}
.container p{font-size:0.9em}
.container table span{display:block}
}

</style>
	<jsp:include page="../include/head.jsp"/>
</head>
<body>
	<jsp:include page="../include/cafeNav1.jsp"/>
	<!-- 	상세 네비 -->
	<jsp:include page="../include/cafeNav2.jsp"/>
	
	
	<div class="container divPadding marginBottom30" style="width: 100%; height:100vh; text-align: center;">
		<h3>Usage Fee</h3>
		<h2>이용요금</h2>
		<div class="container">
			<h1 class="table-tit">개인좌석</h1>
			<br>
			<table style="width: 100%; height:30vh; text-align: center;">
				<tr>
					<td colspan="2" style="background-color:#484848;"><b style=" color:#fff !important">당일권</b></td>
					<td colspan="2" style="background-color:#484848;"><b style=" color:#fff !important">정기권</b></td>
				</tr>
				<tr>
					<td><b>2시간</b></td><td>3,000원</td>
					<td><b>1주</b></td><td>50,000원</td>
				</tr>
				<tr>
					<td><b>4시간</b></td><td>5,000원</td>
					<td><b>2주</b></td><td>80,000원</td>
				</tr>
				<tr>
					<td><b>6시간</b></td><td>7,000원</td>
					<td><b>4주</b></td><td>160,000원</td>
			</table>

			<h1 class="table-tit">스터디룸</h1>
			<p>스터디룸은 최대 6인까지 이용 가능합니다.</p>
			<br>
			<table style="width: 100%; height:30vh; text-align: center;">
				<tr>
					<td colspan="2" style="background-color:#484848;"><b style=" color:#fff !important">스터디룸</b></td>
				</tr>
				<tr>
					<td><b>1시간</b></td><td>8,000원</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td><b>2시간</b></td><td>16,000원</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td><b>3시간</b></td><td>24,000원</td>
					<td colspan="2"></td>
				</tr>
			</table>
			</div>
			</div>
			
	<jsp:include page="../include/footer.jsp"/>			
</body>
</html>