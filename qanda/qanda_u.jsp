<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp"%>
<%@ page import="java.util.*,dao.QandA_DAO,dto.QandA_DTO"%>
<%@ include file="/common/sessionCheckMember.jsp" %>
<%	
	request.setCharacterEncoding("UTF-8");	
	String qanda_no = request.getParameter("t_qandaNo");
	QandA_DAO dao = new QandA_DAO();
	QandA_DTO dtoN = dao.getQandaView(qanda_no);
%>
<div id="con">
	<div id="menu_bar">
		<ul>
			<li><i class="fas fa-bell fa-lg"></i><a href="/notice/notice_r.jsp">&nbsp; NOTICE</a></li>
			<li><i class="fas fa-bullhorn fa-lg"></i><a href="/news/news_r.jsp">&nbsp; NEWS</a></li>
			<li><i class="fas fa-file-alt fa-lg"></i><a href="/freeboard/freeboard_r.jsp">&nbsp; FREEBOARD</a></li>
			<li><i class="fab fa-quora fa-lg"></i><a href="/qanda/qanda_r.jsp">&nbsp; QNA</a></li>
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
	border-top:1px solid #848484;

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
	width : 99%;
	height : 300px;
	resize : none;
	color :#848484; 
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
		
		if(fm.t_title.value == ""){
			alert("제목 입력!");
			fm.t_title.focus();
			return;
		}
		if(fm.t_content.value == ""){
			alert("내용 입력!");
			fm.t_content.focus();
			return;
		}
		fm.action = "qanda_proc.jsp";
		fm.method = "post";
		fm.submit();
	}
</script> <!---->
	<div id="contents">
		<p>
			<img src="/images/home3.png" class="home_icon">
			 HOME | COMMUNITY | QANDA
		</p>
		<form name="qanda">
		<input type="hidden" name="t_work_gubun" value="update">
		<input name="t_qanda_no" type="hidden" value="<%=qanda_no%>">
		<div class="board_list">
			<table class="board_table">
				<colgroup>
					<col width="*%" />
					<col width="20" />
					<col width="40" />
				</colgroup>
				<thead>
					<tr>
						<th>작성자</th>
						<td><%=dtoN.getUser_id()%></td>
						<td>공개여부 <input type = "radio" value="y" name = "t_secret"<%if(dtoN.getSecret().equals("y"))out.print("checked");%>/> private
									<input type = "radio" value="n" name = "t_secret"<%if(dtoN.getSecret().equals("n"))out.print("checked");%>/> public</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="2"><input name="t_title" value="<%=dtoN.getTitle()%>" type="text" size="90%"></td> <!---->
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="2"><textarea name="t_content" class="textarea"><%=dtoN.getQuestion()%></textarea></td> <!---->
					</tr>
				</tbody>
			</table>			
		</div>
		<br>
		<div class="buttons">
				<p>
					<a href="qanda_r.jsp">취 소</a>
					<a href="javascript:update()">저 장</a> <!---->
				</p>
		</div>
		</form>
	</div>
	<%@ include file="/common_footer.jsp" %>
</div>
</body>
</html>