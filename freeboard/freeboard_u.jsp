<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp"%>
<%@ page import="java.util.*,dao.Freeboard_DAO,dto.Freeboard_DTO"%>
<%	
	request.setCharacterEncoding("UTF-8");	
	String freeboard_no = request.getParameter("t_freeboardNo");
	Freeboard_DAO dao = new Freeboard_DAO();
	Freeboard_DTO dtoN = dao.getFreeboardView(freeboard_no);
	
	
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
		var fm = document.freeboard;
		
		if(fm.t_pw_2.value == ""){
			alert("패스워드 입력!");
			fm.t_pw_2.focus();
			return;
		}
		if(fm.t_pw_2.value != fm.t_pw.value){
			alert("패스워드가 맞지 않습니다!");
			fm.t_pw_2.focus();
			return;
		}
		
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
		fm.action = "freeboard_proc.jsp";
		fm.method = "post";
		fm.submit();
	}
</script> <!---->
	<div id="contents">
		<p>
			<img src="/images/home3.png" class="home_icon">
			 HOME | COMMUNITY | FREEBOARD
		</p>
		<form name="freeboard">
		<input type="hidden" name="t_work_gubun" value="update">
		<input name="t_freeboard_no" type="hidden" value="<%=freeboard_no%>">
		<input name="t_pw" type="hidden" value="<%=dtoN.getPw()%>">
		<div class="board_list">
			<table class="board_table">
				<colgroup>
					<col width="10%" />
					<col width="40%" />
					<col width="10%" />
					<col width="40%" />
				</colgroup>
				<thead>
					<tr>
						<th>작성자</th>
						<td><input name="t_name" type="text" value="<%=dtoN.getReg_id()%>"></td>
						<th>비밀번호</th>
							<td><input name="t_pw_2" type="password" size="36.5%"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3"><input name="t_title" value="<%=dtoN.getTitle()%>" type="text" size="90%"></td> <!---->
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea name="t_content" class="textarea"><%=dtoN.getContent()%></textarea></td> <!---->
					</tr>
				</tbody>
			</table>			
		</div>
		<br>
		<div class="buttons">
				<p>
					<a href="freeboard_r.jsp">취 소</a>
					<a href="javascript:update()">저 장</a> <!---->
				</p>
		</div>
		</form>
	</div>
	<%@ include file="/common_footer.jsp" %>
</div>
</body>
</html>