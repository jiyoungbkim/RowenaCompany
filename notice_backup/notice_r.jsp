<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<jsp:useBean id="dao" class="dao.Member_DAO" scope="page" />
<%	
	String id = dao.getMaxId();
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>JSL 방문을 환영합니다</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">	
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/base.css" /> 
<script type="text/javascript" src="../js/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	//<![CDATA[
		$(function(){
		  $(".menu1").mouseover(function(){
			$("#s_div_1").stop().slideDown("slow");
		  });
		  $(".menu1").mouseleave(function(){
			$("#s_div_1").stop().slideUp("slow");
		  });
		}); 
		$(function(){
		  $(".menu2").mouseover(function(){
			$("#s_div_2").stop().slideDown("slow");
		  });
		  $(".menu2").mouseleave(function(){
			$("#s_div_2").stop().slideUp("slow");
		  });
		});
		$(function(){
		  $(".menu3").mouseover(function(){
			$("#s_div_3").stop().slideDown("slow");
		  });
		  $(".menu3").mouseleave(function(){
			$("#s_div_3").stop().slideUp("slow");
		  });
		});
		$(function(){
		  $(".menu4").mouseover(function(){
			$("#s_div_4").stop().slideDown("slow");
		  });
		  $(".menu4").mouseleave(function(){
			$("#s_div_4").stop().slideUp("slow");
		  });
		});
		$(function(){
		  $(".menu5").mouseover(function(){
			$("#s_div_5").stop().slideDown("slow");
		  });
		  $(".menu5").mouseleave(function(){
			$("#s_div_5").stop().slideUp("slow");
		  });
		});
	//]]>
</script>
<style>

body {
	font : 12px "고딕", Gothic ;
	background : url("images/bg_grid.gif");
	}
#con {
	width : 940px ;
	margin: 0px auto;
	//height : 880px;
	//background : #ff6699;
	padding : 20px;
	clear : both;
}
#header {	
	width : 940px ;
	height : 140px ;
	//padding : 20px;
	background : url("../images/header.png");
	//background-size : 100%;
	margin-bottom : 20px;	
}
#menu_bar {
	float : left;
	//display:inline-block;
	width : 110px;
	//height : 460px;
	padding : 20px;
	//background : #996699;	
}
#contents {	
	float : right;
	width : 748px;
	//height : 460px;
	padding : 20px;
	//background : #3366ff;
	margin-bottom : 20px;
}
#footer {
	content:"";
	display:block;
	clear:both;
	width : 900px;
	//height : 60px;
	padding : 20px;
	background : #ff6699;
}

.top_right {
	position : relative;
	top : -20px;
}
.top_right li {
	float : right;
	border-right : 1px solid #6E6E6E;
}
.top_right li a {
	display : inline-block;
	width : 50px;
	text-align : center;
	color : #848484;
	font-size : 10px;
}

.header_menu li{
	float : left;
	
}
.header_menu li a{
	display : inline-block;
	//padding-top : 5px;
	width : 188px;
	height : 20px;
	//background : linear-gradient( to right, #5B247A, #1BCEDF);
	color  : white;	
	//opacity : 0.8;
	text-align : center;
	line-height : 20px;
}
#header{
	position : relative;
}
.header_menu{
	background : linear-gradient( to right, #5B247A, #1BCEDF);
	opacity : 0.8;
	position : absolute;
	top : 120px;
}
#s_div_1, #s_div_2, #s_div_3, #s_div_4{
	position : absolute;
	display : none;
}
#s_div_5 {
	position : absolute;
	right : 0;
}
#s_div_1 ul li a{
	width : 100px;
	background : #5B247A;	
}
#s_div_2 ul li a{
	width : 100px;
	background : #5B247A;	
}
#s_div_3 ul li a{
	width : 100px;
	background : #5B247A;	
}
#s_div_4 ul li a{
	width : 100px;
	background : #5B247A;	
}
#s_div_5 ul li a{

	width : 100px;
	background : #5B247A;	
}
.p2{
	color : #fff;
	text-align : justify;
}
#menu_bar ul li i{
	color : #666;
	vertical-align: middle;
	size : 5px;
	line-height : 40px;
}
#menu_bar ul li{
	border-bottom : #999 1px;
}
.p3 {
	color : #ccc;
}
</style>
</head>
<body>
<div id="con">
<%=id%>

	<ul class="top_right">
		<li><a href="">JOIN</a></li>
		<li><a href="">LOGIN</a></li>
		<li><a href="../index.jsp">HOME</a></li>
	</ul>
	<div id="header">
		<ul class="header_menu">
			<li class="menu1"><a href="#">회사소개</a>
				<div id="s_div_1">
					<ul>
						<li><a href="">CEO GREETING</a></li>
						<li><a href="">SALES</a></li>
						<li><a href="">VISION</a></li>
						<li><a href="">ROUTE</a></li>
					</ul>
				</div>
			</li>
			<li class="menu2"><a href="#">제품안내</a>
				<div id="s_div_2">
					<ul>
						<li><a href="">DESKTOP</a></li>
						<li><a href="">NOTEBOOK</a></li>
						<li><a href="">PRINTER</a></li>
						<li><a href="">PROJECTER</a></li>
						<li><a href="">ETC</a></li>
					</ul>
				</div>
			</li>
			<li class="menu3"><a href="#">판매안내</a>
				<div id="s_div_3">
					<ul>
						<li><a href="">ONLINE</a></li>
						<li><a href="">OFFLINE</a></li>
					</ul>
				</div>
			</li>
			<li class="menu4"><a href="#">주문안내</a>
				<div id="s_div_4">
					<ul>
						<li><a href="">배송안내</a></li>
						<li><a href="">환불안내</a></li>
					</ul>
				</div>
			</li>
			<li class="menu5"><a href="notice_r.jsp">커뮤니티</a>
				<div id="s_div_5">
					<ul>
						<li><a href="notice_r.jsp">NOTICE</a></li>
						<li><a href="">NEWS</a></li>
						<li><a href="">FREEBOARD</a></li>
						<li><a href="">QNA</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>

	<div id="menu_bar">
		
		<ul>
			<li><i class="fas fa-bell fa-lg"></i><a href="notice_r.jsp">&nbsp; NOTICE</a></li>
			<li><i class="fas fa-bullhorn fa-lg"></i><a href="">&nbsp; NEWS</a></li>
			<li><i class="fas fa-file-alt fa-lg"></i><a href="">&nbsp; FREEBOARD</a></li>
			<li><i class="fab fa-quora fa-lg"></i><a href="">&nbsp; QNA</a></li>
		</ul>
	</div>
<style>
.board_list { padding-top:10px; }
.board_table{ width: 100%; font-size : 12px;}

.board_list th{
	border-top:1px solid #848484;
	border-bottom: 1px solid #848484;
	padding: 10px;
}
.board_table td{
	text-align:center;
	padding : 7px;
	border-bottom:1px solid #e0e0e0;
}
td.title{
	text-align : left;
}
.home_icon{
	width : 13px;
}
#contents p {
	font-size : 11px;
}
#contents tr, a{
	font : 11px;
	color : #848484;
}

.search{
	float: right;
	margin-bottom: 5px;
}
.search select, input {
	color:#666;
	vertical-align:top;
	height : 23px;
}
.paging {
	padding-top:30px; 
	text-align:center;
}
.paging a {
	padding:10px; 
	border:1px solid #e0e0e0;
}
.paging a.active {
	background:#007dc6;
	color:#fff
}
.paging .btn_write{
	background : #123454;
	padding : 10px 16px;
	color : #fff;
	float : right;
}
</style>
	<div id="contents">
		<p>
			<img src="../images/home3.png" class="home_icon">
			 HOME | COMMUNITY | NOTICE
			<div class="search">
				<select>
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
				</select>
				<input type="text" style="height:19px">
				<input type="button" value=" 검 색 " style="width: 60px"/>
			</div>
			
		</p>
		<p>
			
		</p>
		
		<div class="board_list">
			<table class="board_table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>10</td>
						<td class="title"><a href="notice_v.jsp">구매절차</a></td>
						<td>관리자</td>
						<td>19-09-17</td>
						<td>125</td>
					</tr>
					<tr>
						<td>9</td>
						<td class="title"><a href="">구매절차</a></td>
						<td>관리자</td>
						<td>19-09-17</td>
						<td>125</td>
					</tr>
					<tr>
						<td>8</td>
						<td class="title"><a href="">구매절차</a></td>
						<td>관리자</td>
						<td>19-09-17</td>
						<td>125</td>
					</tr>
					<tr>
						<td>7</td>
						<td class="title"><a href="">구매절차</a></td>
						<td>관리자</td>
						<td>19-09-17</td>
						<td>125</td>
					</tr>
					<tr>
						<td>6</td>
						<td class="title"><a href="">구매절차</a></td>
						<td>관리자</td>
						<td>19-09-17</td>
						<td>125</td>
					</tr>
					<tr>
						<td>5</td>
						<td class="title"><a href="">구매절차</a></td>
						<td>관리자</td>
						<td>19-09-17</td>
						<td>125</td>
					</tr>
					<tr>
						<td>4</td>
						<td class="title"><a href="">구매절차</a></td>
						<td>관리자</td>
						<td>19-09-17</td>
						<td>125</td>
					</tr>
					<tr>
						<td>3</td>
						<td class="title">구매절차</td>
						<td>관리자</td>
						<td>19-09-17</td>
						<td>125</td>
					</tr>
					<tr>
						<td>2</td>
						<td class="title">구매절차</td>
						<td>관리자</td>
						<td>19-09-17</td>
						<td>125</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="title">구매절차</td>
						<td>관리자</td>
						<td>19-09-17</td>
						<td>125</td>
					</tr>
				</tbody>
			</table>
			<div class="paging">
				<a href=""><i class="fa fa-angle-double-left"></i></a>
				<a href=""><i class="fa fa-angle-left"></i></a>
				<a href="" class="active">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
				<a href=""><i class="fa fa-angle-right"></i></a>
				<a href=""><i class="fa fa-angle-double-right"></i></a>
				<a href="notice_w.jsp" class="btn_write">글쓰기</a>
			</div>
		</div>
	</div>
<style>
#footer{
	background :#42464d;
	padding-top:10px;
	//padding-bottom:10px;
}
#footer .address {
	font-style:normal;
	color:#ababb1;
	margin-bottom:10px;
}
#footer .address .title{
	font-size:14px;
	margin-bottom:8px;
	color:#fff;
}
#footer .copyright{
	color:#fff;
}

</style>
	<div id="footer">
		<address class="address">
			<p class="title">본사</p>
			(우)12345 대전광역시 중구 계롱로 825
			(용두동, 희영빌딩) 5층, 6층/ 고객센터: 042-242-4412
			<br>사업자등록번호: 305-86-06709
		</address>
		<p class="copyright">Copyright &copy;
		JSL 전자개발주식회사. All rights reserved.</p>
	</div>
</div>
</body>
</html>