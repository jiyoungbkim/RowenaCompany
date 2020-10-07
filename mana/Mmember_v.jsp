<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ include file="/common/sessionCheckMember.jsp" %>
<%@ page import="dao.Mmember_DAO,dto.Member_DTO,common.CommonUtil"%>

<%	
	Mmember_DAO dao = new Mmember_DAO();
	String memberId = request.getParameter("t_id");
	Member_DTO dto = dao.getMemberinfo(memberId);		
%>
<style>
.fas fa-edit{
	size : 10px;
}
</style>
<div id="con">
	<div id="menu_bar">
		<ul>
			<li><i class="fas fa-edit"></i><a href="/notice/notice_r.jsp">&nbsp; 회원가입</a></li>
			<li><i class="fas fa-hand-point-right"></i><a href="/notice/notice_r.jsp">&nbsp; 아이디찾기</a></li>
			<li><i class="fas fa-unlock"></i><a href="/notice/notice_r.jsp">&nbsp; 비밀번호찾기</a></li>
		</ul>
	</div>
<style>
.board_list { padding-top:10px; }
.board_table{ width: 100%; font-size : 12px; }

.board_list th{
	padding: 5px;
	float : left;
}
.board_table td{
	text-align:left;
	padding : 3px;
}
td.title{
	text-align : left;	
}
.id{
	margin-right : 5px;
	height : 19px;
}
.board_table input{
	height : 17px;
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
select {
	height : 23px;
	vertical-align:middle;
	color:#666;
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


</script>
	<div id="contents">
		<p>
			<img src="/images/home3.png" class="home_icon">
			 HOME | JOIN
		</p>
		<form name="member">
		<div class="board_list">
			<table class="board_table">
				<colgroup>
					<col width="15%" />
					<col width="*%" />
				
				</colgroup>
				<thead>
					<tr>
						<th>아이디</th>
						<td>
							<%=dto.getId()%>							
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>비밀번호</th>
						<td><%=dto.getPw()%></td>
					</tr>
					<tr>
						<th>성 명</th>
						<td><%=dto.getName()%></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><%=dto.getBirth()%></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<%=dto.getArea()%>
							<%=dto.getAddress()%>
						</td>
					</tr>
					<tr>
						<th> 휴대폰 </th>
						<td>
							[<%=dto.getTelecom()%>]
							&nbsp;
							<%=dto.getPhone_1()%>-<%=dto.getPhone_2()%>-<%=dto.getPhone_3()%>
						</td>
					</tr>
					<tr>
						<th> 이메일 </th>
						<td>
							<%=dto.getEmail_1()%>@<%=dto.getEmail_2()%>
						</td>
					</tr>
					<tr>
						<th> 관심분야 </th>
						<td>
							<%if(dto.getAtt_desk().equals("y")) out.print("DESKTOP");%>
							<%if(dto.getAtt_note().equals("y")) out.print("NOTEBOOK");%>
							<%if(dto.getAtt_print().equals("y"))out.print("PRINT");%>
							<%if(dto.getAtt_beam().equals("y")) out.print("PROJECTER");%>
						</td>
					</tr>
				</tbody>
			</table>			
		</div>
		</form>
	</div>
	<%@ include file="/common_footer.jsp" %>
</body>
</html>