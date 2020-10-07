<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_session_info.jsp"%>
<%@ page import="java.util.*,dao.Notice_DAO,dto.Notice_DTO,dao.News_DAO,dto.News_DTO,dao.Freeboard_DAO,dto.Freeboard_DTO,dao.QandA_DAO,dto.QandA_DTO,common.CommonUtil"%>
<%	
	request.setCharacterEncoding("UTF-8");
	Notice_DAO dao = new Notice_DAO();
	News_DAO daoW = new News_DAO();
	Freeboard_DAO daoF = new Freeboard_DAO();
	QandA_DAO daoQ = new QandA_DAO();
	
	ArrayList<Notice_DTO> arrN = dao.getNoticeIndex();	
	ArrayList<News_DTO> arrW = daoW.getNewsIndex();	
	ArrayList<Freeboard_DTO> arrF = daoF.getFreeboardIndex();	
	ArrayList<QandA_DTO> arrQ = daoQ.getQandaIndex();	
	
	int	total_countN;
	int	total_countW;
	int	total_countF;
	int	total_countQ;

	if(arrN == null) total_countN =0;
	else total_countN = arrN.size(); 
	
	if(arrW == null) total_countW =0;
	else total_countW = arrW.size(); 
	
	if(arrF == null) total_countF =0;
	else total_countF = arrF.size(); 
	
	if(arrQ == null) total_countQ =0;
	else total_countQ = arrQ.size(); 
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
<script type="text/javascript" src="../js/jquery.cycle2.js"></script>
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
*{margin : 0; padding : 0;}
li {
	list-style-type:none;
}
a{
	text-decoration:none;
}
body {
	font : 12px "고딕", Gothic ;
	//background : url("images/bg_grid.gif");
	}
#con {
	width : 940px ;
	//height : 880px;
	margin: 0px auto;
	//background : #ff6699;
	padding : 20px;
	clear : both;
}
#header {
	
	width : 940px ;
	height : 140px ;
	//padding : 20px;
	background : url("images/header.png");
	//background-size : 100%;
	//margin-bottom : 20px;
	
}
#contents {	
	float : right;
	width : 940px;
	height : 540px;
	padding : 20px 0;
	//background : #3366ff;
	//margin-bottom : 20px;
	position : relative;
	display:block;
}
#main{
	float : left;
	width : 620px;
	height : 540px;
}
#notice {
	padding : 10px 10px;
	position : absolute;
	width : 280px;
	height : 200px;
	//background-color : #ff6699;
	display:block;
	position : absolute;
	box-shadow: 0 2px 5px #7c7c7e7a;
}
#news {
	padding : 10px 10px;
	float : right;
	width : 280px;
	height : 200px;
	//background-color : #3366ff;
	display:block;
	position : relative;
	box-shadow: 0 2px 5px #7c7c7e7a;
}
#product {
	clear : right;
	//padding : 30px 10px;
	margin-top : 20px;
	width : 620px;
	height : 300px;
	background-color : #6f33ff;
	position : relative;
	display:inline-block;
}
#main_side{
	float : right;
	width : 320px;
	height : 500px;
}
#qanda {
	padding : 10px 10px;
	float : right;
	width : 280px;
	height : 200px;
	//background-color : #1bcedf;
	display:block;
	box-shadow: 0 2px 5px #7c7c7e7a;
}
#guide {
	clear : right;
	margin-top : 20px;
	//padding : 30px 10px;
	float : right;
	width : 300px;
	height : 300px;
	background-color : #1bcedf;
	display:block;
	box-shadow: 0 2px 5px #7c7c7e7a;
	background : linear-gradient( to right, #5B247A, #1BCEDF);
}
.guide_img {
	width : 300px;
	height : 300px;
}
#footer {
	content:"";
	display:block;
	clear:both;
	width : 900px;
	//height : 60px;
	padding : 20px;
	background : #ffff33;
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
#contents ul li i{
	align : right;
	color : #666;
	vertical-align: middle;
	size : 5px;
	line-height : 40px;
}
#contents ul li a{
	text-align : left;
}

.p3 {
	color : #ccc;
}
.icon {
	width : 23px;
	color : white;
	vertical-align: middle;
}
.notice_table td, .news_table td, .qanda_table td{
	padding : 6px;
	border-bottom:1px solid #e0e0e0;
	color : #7c7c7e;
}
.notice_title, .news_title , .qanda_title {
	margin-left : 5px;
	color : #7c7c7e;
}
.plus {
	margin-top : 7px;
	margin-right : 13px;
	float : right;
	font-size : 13px;
	color : #7c7c7e;
}
.cycle-slideshow img{
	width : 620px;
	height: 300px;
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
<!-- 	
	<div id="menu-icon">
		<ul>
			<li><i class="fas fa-bell fa-lg"></i><a href="notice/notice_r.html">&nbsp; NOTICE</a></li>
			<li><i class="fas fa-bullhorn fa-lg"></i><a href="">&nbsp; NEWS</a></li>
			<li><i class="fas fa-file-alt fa-lg"></i><a href="">&nbsp; FREEBOARD</a></li>
			<li><i class="fab fa-quora fa-lg"></i><a href="">&nbsp; QNA</a></li>
		</ul>
	</div> -->
	<div id="contents">
		<div id="main">
			<div id="notice">
				<p class="notice_title" style="font-weight:bold"><a href="/notice/notice_r.jsp">NOTICE</p> 
				<table class="notice_table">
					<colgroup>
						<col width="70px">
						<col width="140px">
						<col width="80px">					
					</colgroup>
				<%	if ( total_countN > 0 ){
						for(int k = 0 ; k < total_countN ; k++ )	{
				%>	
					<tr>
						<td><a href="/notice/notice_v.jsp?t_noticeNo=<%=arrN.get(k).getNotice_no()%>">
						<%=arrN.get(k).getTitle()%><%if(arrN.get(k).getTitle().length() > 6){ %>...<%}%></td>									
						<td><a href="/notice/notice_v.jsp?t_noticeNo=<%=arrN.get(k).getNotice_no()%>">
						<%=arrN.get(k).getContent()%><%if(arrN.get(k).getContent().length() > 9){ %>...<%}%></td>
						<td><%=arrN.get(k).getReg_date()%></td>						
					</tr>
				<%
						}			
					}
				%>
				</table>
				<p class="plus"><span style="font-size:9px"><i class="fas fa-plus">&nbsp;</i><a href="/notice/notice_r.jsp">more</p>
			</div>
			<div id="news">
				<p class="news_title" style="font-weight:bold"><a href="/news/news_r.jsp">NEWS</p> 
				<table class="news_table">
					<colgroup>
						<col width="70px">
						<col width="140px">
						<col width="80px">					
					</colgroup>
				<%	if ( total_countW > 0 ){
						for(int k = 0 ; k < total_countW ; k++ )	{
				%>	
					<tr>
						<td><a href="/news/news_v.jsp?t_newsNo=<%=arrW.get(k).getNews_no()%>">
						<%=arrW.get(k).getTitle()%><%if(arrW.get(k).getTitle().length() > 6){ %>...<%}%></td>									
						<td><a href="/news/news_v.jsp?t_newsNo=<%=arrW.get(k).getNews_no()%>">
						<%=arrW.get(k).getContent()%><%if(arrW.get(k).getContent().length() > 9){ %>...<%}%></td>
						<td><%=arrW.get(k).getReg_date()%></td>						
					</tr>
				<%
						}			
					}
				%>
				</table>
				<p class="plus"><span style="font-size:9px"><i class="fas fa-plus">&nbsp;</i><a href="/news/news_r.jsp">more</p>
			</div>
			<div id="product">
				<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-pause-on-hover="true"  data-cycle-speed="100">			
					<img src="/images/slide/universe.jpg">
					<img src="/images/slide/sci1.jpg">
					<img src="/images/slide/uni1.jpg">
				</div>
			</div>
		</div>
		<div id="main_side">
		
			<div id="qanda">
				<p class="qanda_title" style="font-weight:bold"><a href="/qanda/qanda_r.jsp">QandA</p> 
				<table class="qanda_table">
					<colgroup>
						<col width="70px">
						<col width="140px">
						<col width="80px">					
					</colgroup>
				<%	if ( total_countQ > 0 ){
						for(int k = 0 ; k < total_countQ ; k++ )	{
				%>	
					<tr>
						<td><a href="/qanda/qanda_v.jsp?t_qandaNo=<%=arrQ.get(k).getQanda_no()%>">
						<%=arrQ.get(k).getTitle()%><%if(arrQ.get(k).getTitle().length() > 6){ %>...<%}%></td>									
						<td><a href="/qanda/qanda_v.jsp?t_qandaNo=<%=arrQ.get(k).getQanda_no()%>">
						<%=arrQ.get(k).getQuestion()%><%if(arrQ.get(k).getQuestion().length() > 9){ %>...<%}%></td>
						<td><%=arrQ.get(k).getReg_date_q()%></td>						
					</tr>
				<%
						}			
					} else {
				%>
					<TR align="center" bgcolor="white" >
						<TD colspan="3" >등록된 내용이 없습니다.</TD>
					</TR>
				<%	} %>
				</table>
				<p class="plus"><span style="font-size:9px"><i class="fas fa-plus">&nbsp;</i><a href="/freeboard/freeboard_r.jsp">more</p>
			</div>
			<div id="guide">
				<img class="guide_img" src="/images/Rowena.gif">
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

</body>
</html>