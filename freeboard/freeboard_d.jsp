<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="java.util.*,dao.Freeboard_DAO,dto.Freeboard_DTO"%>
<%	
	request.setCharacterEncoding("UTF-8");	
	String freeboard_no = request.getParameter("t_freeboardNo");
	String pw = request.getParameter("t_pw");
	Freeboard_DAO dao = new Freeboard_DAO();
	Freeboard_DTO dtoN = dao.getFreeboardView(freeboard_no);
	

%>
<style>
.board_list { padding-top:10px; float : justify; }
.board_table{ width: 100%; font-size : 12px; }

.board_list th{
	padding: 10px;
}
.board_table td{
	text-align:left;
	padding : 7px;
	//border-top:1px solid #848484;
	

}
#contents{
	width: 400px;
	margin: auto;
	padding: 10px;
	border: 1px solid #bcbcbc;
}

#contents p {
	font-size : 11px;
	
}
#contents tr, a{
	
	font : 11px;
	color : #848484;
}

.buttons {
	width : 100%;
	align : center;
	text-align : center;	
}
.buttons p a{
	text-decoration:none;
	float : justify;
	background : #3366ff;
	color : white;
	margin-top : 20px;
	padding : 10px 20px;
}
</style>
<script>
	function deleteFreeboard() {
		
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
		
		var yn = confirm("정말 삭제 하겠습니까? ");
		if(yn) {
			
										
			var fm = document.freeboard;
			// fm.action = "notice_delete.jsp";
			fm.action = "freeboard_delete.jsp";
			fm.method = "post";
			fm.submit();
			
		}			
		
	}
</script> <!---->
	<div id="contents">

		<form name="freeboard">
		<input type="hidden" name="t_work_gubun" value="delete">
		<input name="t_freeboard_no" type="hidden" value="<%=freeboard_no%>">
		<input name="t_pw" type="hidden" value="<%=dtoN.getPw()%>">
		<div class="board_list">
			<table class="board_table">
					<col width="20%" />
					<col width="40%" />

				<thead>
					<tr>					
						<th>비밀번호 입력</th>
							<td><input name="t_pw_2" type="password" size="30%"></td>
					</tr>
				</thead>

			</table>			
		</div>
		<br>
		<div class="buttons">
				<p>
					<a href="freeboard_r.jsp">취 소</a>
					<a href="javascript:deleteFreeboard()">삭 제</a> <!---->
				</p>
		</div>
		</form>
	</div>

</div>
</body>
</html>