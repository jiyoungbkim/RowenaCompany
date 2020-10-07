<%@ include file="/common_session_info.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>[김지영]JSL 방문을 환영합니다</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">	
<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/etc.css?ver=2" />  
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
	//<![CDATA[
		$(function(){
		  $(".menu1").mouseover(function(){
			$("#s_div_1").stop().slideDown("fast");
		  });
		  $(".menu1").mouseleave(function(){
			$("#s_div_1").stop().slideUp("fast");
		  });
		}); 
		$(function(){
		  $(".menu2").mouseover(function(){
			$("#s_div_2").stop().slideDown("fast");
		  });
		  $(".menu2").mouseleave(function(){
			$("#s_div_2").stop().slideUp("fast");
		  });
		});
		$(function(){
		  $(".menu3").mouseover(function(){
			$("#s_div_3").stop().slideDown("fast");
		  });
		  $(".menu3").mouseleave(function(){
			$("#s_div_3").stop().slideUp("fast");
		  });
		});
		$(function(){
		  $(".menu4").mouseover(function(){
			$("#s_div_4").stop().slideDown("fast");
		  });
		  $(".menu4").mouseleave(function(){
			$("#s_div_4").stop().slideUp("fast");
		  });
		});
		$(function(){
		  $(".menu5").mouseover(function(){
			$("#s_div_5").stop().slideDown("fast");
		  });
		  $(".menu5").mouseleave(function(){
			$("#s_div_5").stop().slideUp("fast");
		  });
		});
		$(function(){
		  $(".menu6").mouseover(function(){
			$("#s_div_6").stop().slideDown("fast");
		  });
		  $(".menu6").mouseleave(function(){
			$("#s_div_6").stop().slideUp("fast");
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
	background : url("/images/header.png");
	//background-size : 100%;
	margin-bottom : 20px;	
}
#menu_bar {
	float : left;
	//display:inline-block;
	width : 100px;
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
	//background : #ff6699;
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
	<% if (sessionLevel.equals("manager")) { %>
	width : 156.66px;
	<% } else { %>
	width : 188px;
	<% } %>
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
#s_div_6 {
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
#s_div_6 ul li a{

	width : 100px;
	background : #5B247A;	
}
.p2{
	color : #fff;
	text-align : justify;
}
.p3 {
	color : #ccc;
}
</style>
</head>
<body>

<div id="con">
	<ul class="top_right">
		<li><a href="/member/member_w.jsp">JOIN</a></li>
	<%
		if(!sessionName.equals("")){
	%>
		<li><a href="/member/member_myinfo.jsp">MYPAGE</a></li>
		<li><a href="/member/member_logout.jsp">LOGOUT</a></li>
	<%
		} else {
	%>
		<li><a href="/member/member_login.jsp">LOGIN</a></li>
	<%
		}
	%>
		<li><a href="/index.jsp">HOME</a></li>
		<li><a>
	<%
		if(!sessionName.equals("")){			
	%>
		[<%=sessionName%>]님
	<%	
		}
	%>
		</a></li>
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
			<li class="menu5"><a href="/notice/notice_r.jsp">커뮤니티</a>
				<div id="s_div_5">
					<ul>
						<li><a href="/notice/notice_r.jsp">NOTICE</a></li>
						<li><a href="/news/news_r.jsp">NEWS</a></li>
						<li><a href="/freeboard/freeboard_r.jsp">FREEBOARD</a></li>
						<li><a href="/qanda/qanda_r.jsp">QNA</a></li>
					</ul>
				</div>
			</li>
			<% if (sessionLevel.equals("manager")) { %>
			<li class="menu6"><a href="/mana/Mmember_r.jsp">관리자메뉴</a>
				<div id="s_div_6">
					<ul>
						<li><a href="/mana/Mmember_r.jsp">MEMBER LIST</a></li>
						<li><a href="/mana/Mmember_r.jsp">STAFF LIST</a></li>
					</ul>
				</div>
			</li>
			<% } %>
		</ul>
	</div>
</div>