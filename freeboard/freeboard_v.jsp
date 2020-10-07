<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="java.util.*,dao.Freeboard_DAO,dto.Freeboard_DTO"%>
<%
	String freeboard_no = request.getParameter("t_freeboardNo");
	String pw = request.getParameter("t_pw");
	Freeboard_DAO dao = new Freeboard_DAO();
	int nHit = dao.freeboardHit(freeboard_no);
	Freeboard_DTO dtoN = dao.getFreeboardView(freeboard_no);
%>
<div id="con">
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

	function deleteFreeboard(){
		var freeboard_no = document.freeboard.t_freeboard_no.value;
		window.open("freeboard_d.jsp?t_freeboardNo="+freeboard_no,
					"비밀번호 입력",
					"width=450px, height=150px");
		
	
		
	}

	
</script>
	<form name="freeboard">
		<input type="hidden" name="t_work_gubun" value="delete">
		<input type="hidden" name="t_freeboard_no" value="<%=freeboard_no%>">
	</form>
	<div id="contents">
		<p>
			<img src="../images/home3.png" class="home_icon">
			 HOME | COMMUNITY | FREEBOARD
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
						<td class="cover"><%=dtoN.getTitle()%></td>
						<td class="cover"><i class="fa fa-eye"> 조회수 : <%=dtoN.getHit()%></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>내용</th>
						<td colspan="2"><textarea class="textarea" readonly><%=dtoN.getContent()%></textarea></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td class="cover"><%=dtoN.getReg_id()%></td>
						<td class="cover"> 등록일자 : <%=dtoN.getReg_date()%></tr>
					</tr>
				</tbody>
			</table>			
		</div>
		<br>
		<div class="buttons">
				<p>
					<a href="freeboard_r.jsp">목 록</a>
					<a href="freeboard_u.jsp?t_freeboardNo=<%=dtoN.getFreeboard_no()%>">수 정</a>
					<a href="javascript:deleteFreeboard()">삭 제</a>

				</p>

			</div>
	</div>
	<%@ include file="/common_footer.jsp" %>
</div>
</body>
</html>