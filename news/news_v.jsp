<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="java.util.*,dao.News_DAO,dto.News_DTO"%>
<%
	String news_no = request.getParameter("t_newsNo");
	News_DAO dao = new News_DAO();
	int wHit = dao.newsHit(news_no);
	News_DTO dtoW = dao.getNewsView(news_no);
%>
<div id="con">
<style>
#menu_bar ul li i{
	color : #666;
	vertical-align: middle;
	size : 5px;
	line-height : 40px;
}
#menu_bar ul li{
	border-bottom : #999 1px;
}
</style>
	<div id="menu_bar">
		<ul>
			<li><i class="fas fa-bell fa-lg"></i><a href="/notice/notice_r.jsp">&nbsp; NOTICE</a></li>
			<li><i class="fas fa-bullhorn fa-lg"></i><a href="/news/news_r.jsp">&nbsp; NEWS</a></li>
			<li><i class="fas fa-file-alt fa-lg"></i><a href="/freeboard/freeboard_r.jsp">&nbsp; FREEBOARD</a></li>
			<li><i class="fab fa-quora fa-lg"></i><a href="/qanda/qanda_r.jsp">&nbsp; QNA</a></li>
		</ul>
	</div>
<style>
.board_list { padding-top:10px; }
.board_table{ width: 100%; font-size : 12px;}

.board_list th{
	padding: 10px;
}
.board_table td{
	text-align:left;
	padding : 7px;
}
.cover{
	border-top:1px solid #848484;
	border-bottom:1px solid #848484;
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
	vertical-align:middle;
	height : 23px;
}
.textarea{
	overflow:hidden;		
	width : 100%;
	height : 300px;
	resize : none;
	font-size : 11px;
}
.buttons {
	width : 100%;
	align : center;
	text-align : center;	
}
.buttons p a{
	align : justify;
	background : #3366ff;
	color : white;
	margin-top : 20px;
	padding : 10px 20px;
}
</style>
<script>
	function deleteNews(){
		var yn = confirm("정말 삭제 하겠습니까? ");
		if(yn) {
			var fm = document.notice;
			fm.action = "news_delete.jsp";
			//fm.action = "news_proc.jsp";
			fm.method = "post";
			fm.submit();
		}
	}
</script>
	<form name="notice">
		<input type="hidden" name="t_work_gubun" value="delete">
		<input type="hidden" name="t_news_no" value="<%=news_no%>">
		<input type="hidden" name="t_fileName" value="<%=dtoW.getFile_name_1()%>">
	</form>
	<div id="contents">
		<p>
			<img src="../images/home3.png" class="home_icon">
			 HOME | COMMUNITY | NEWS
		</p>
		
		<div class="board_list">
			<table class="board_table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="20%">
				</colgroup>
				<thead>				
					<tr>
						<th>제목</th>
						<td class="cover"><%=dtoW.getTitle()%></td>
						<td class="cover"><i class="fa fa-eye"> 조회수 : <%=dtoW.getHit()%></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>내용</th>
						<td colspan="2"><textarea class="textarea" readonly><%=dtoW.getContent()%></textarea></td>
					</tr>
					<% if(dtoW.getFile_name_1() != null) { %>
					<tr>
						<th>첨부</th>
						<td colspan="2"><a href="/common/filedown.jsp?t_file=<%=dtoW.getFile_name_1()%>&t_gubun=news"><%=dtoW.getFile_name_1()%></td>
					</tr>
					<% } %>
					<tr>
						<th>작성자</th>
						<td class="cover"><%=dtoW.getReg_id()%></td>
						<td class="cover"> 등록일자 : <%=dtoW.getReg_date()%></tr>
					</tr>
				</tbody>
			</table>			
		</div>
		<br>
		<div class="buttons">
				<p>
					<a href="news_r.jsp">목 록</a>
					<%
						if(sessionId.equals("manager")){
					%>
					<a href="news_u.jsp?t_newsNo=<%=dtoW.getNews_no()%>">수 정</a>
					<a href="javascript:deleteNews()">삭 제</a>
					<%
						}
					%>
				</p>

			</div>
	</div>
	<%@ include file="/common_footer.jsp" %>
</div>
</body>
</html>