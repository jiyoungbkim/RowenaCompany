<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="java.util.*,dao.QandA_DAO,dto.QandA_DTO,common.CommonUtil"%>
<%
	String qanda_no = request.getParameter("t_qandaNo");
	QandA_DAO dao = new QandA_DAO();
	int nHit = dao.qandaHit(qanda_no);
	QandA_DTO dtoQ = dao.getQandaView(qanda_no);

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
	height : 200px;
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
	function update() {
		var fm = document.qanda;
		
		if(fm.t_answer.value == ""){
			alert("답변 입력!");
			fm.t_answer.focus();
			return;
		}
		fm.action = "qanda_proc.jsp";
		fm.method = "post";
		fm.submit();
	}
</script>
	<form name="qanda">
		<input type="hidden" name="t_work_gubun" value="replay">
		<input type="hidden" name="t_qanda_no" value="<%=qanda_no%>">
	
	<div id="contents">
		<p>
			<img src="../images/home3.png" class="home_icon">
			 HOME | COMMUNITY | NOTICE
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
						<td class="cover"><%=dtoQ.getTitle()%></td>
						<td class="cover"><i class="fa fa-eye"> 조회수 : <%=dtoQ.getHit()%></td>
					</tr>
					
				</thead>
				<tbody>
				<tr>
					<th>작성자</th>
						<td class="cover"><%=dtoQ.getUser_id()%></td>
						<td class="cover"> 등록일자 : <%=dtoQ.getReg_date_q()%></tr>
					</tr>
					<tr>
						<th>질문</th>
						<td colspan="2"><textarea class="textarea" readonly><%=dtoQ.getQuestion()%></textarea></td>
					</tr>
					<tr>
						<th>답변</th>
						<td colspan="2"><textarea name="t_answer" class="textarea" ></textarea></td>
					</tr>
					
				</tbody>
			</table>			
		</div>
		</form>
		<br>
		<div class="buttons">
				<p>
					<a href="qanda_r.jsp">목 록</a>

					<%
						if(sessionId.equals("manager")){
					%>
					<a href="javascript:update()">저 장</a>
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