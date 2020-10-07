<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ include file="/common/sessionCheckMember.jsp"%>
<%@ page import="dao.Member_DAO,dto.Member_DTO,common.CommonUtil"%>

<%	
	request.setCharacterEncoding("UTF-8");		
	Member_DAO dao = new Member_DAO();
	Member_DTO dto = new Member_DTO();
	
	String id = sessionId;
	
	dto = dao.getMyinfo(id);

	if(dto != null) {
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
	
	function update(){
		var form = document.member;	
		
		if(!checkEmpty(form.t_name, "성명 입력!")) return;
		if(!checkEmpty(form.t_birth, "생년월일 입력!")) return;
		if(form.t_birth.value.length != 6) {
			alert("날짜형식 오류! 예)891214");
			form.t_birth.focus();
			return;
		}
		if(form.t_area.value=="선택안함"){
			alert("지역 선택!");
			form.t_area.focus();
			return;
		}
		if(!checkEmpty(form.t_address, "나머지 주소 입력!")) return;
		if(!checkEmpty(form.t_telecom, "통신사 선택!")) return;
		if(!checkEmpty(form.t_phone_1, "전화번호 입력!")) return;
		if(!checkEmpty(form.t_phone_2, "전화번호 입력!")) return;
		if(!checkEmpty(form.t_phone_3, "전화번호 입력!")) return;
		if(form.t_phone_1.value.length != 3) {
			alert("3자리로 입력!");
			form.t_phone_1.focus();
			return;
		}
		if(form.t_phone_2.value.length != 4) {
			alert("4자리로 입력!");
			form.t_phone_2.focus();
			return;
		}
		if(form.t_phone_3.value.length != 4) {
			alert("4자리로 입력!");
			form.t_phone_3.focus();
			return;
		}
		if(!checkEmpty(form.t_email_1, "e-mail 입력!")) return;
		if(!checkEmpty(form.t_email_2, "e-mail 입력!")) return;
		
		if(!checkEmpty(form.pw_check_value, "비밀번호 입력!")) return;
		if(form.pw_check_value.value != form.t_pw_1.value ){
			alert("비밀번호가 일치하지 않습니다.");
			form.pw_check_value.focus();
			return;
		} else {
			form.action = "member_update.jsp";
			form.method = "post";
			form.submit();
		}
		
	}
	function deleteMember(){
		var form = document.member;	
		
		if(!checkEmpty(form.pw_check_value, "비밀번호 입력!")) return;
		if(form.pw_check_value.value != form.t_pw_1.value ){
			alert("비밀번호가 일치하지 않습니다.");
			form.pw_check_value.focus();
			return;
		}
		if(confirm("정말 탈퇴하시겠습니까?")){
			form.action = "member_delete.jsp";
			form.method = "post";
			form.submit();
		}
	}
	
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
							<input type="hidden" name="t_id" value="<%=sessionId%>" class="id" type="text" size="15%" autofocus="autofocus" maxlength="20" readonly>
							<%=sessionId%>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>성 명</th>
						<td><input name="t_name" value="<%=dto.getName()%>" type="text" size="15%" maxlength="5"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input name="t_birth" value="<%=dto.getBirth()%>" type="text" size="15%" maxlength="6"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<select name="t_area">
							 <option value="선택안함"> 지역선택 </option>
							 <option value="서울" > 서울 </option>
							 <option value="수원" > 수원 </option>
							 <option value="대전" > 대전 </option>
							 <option value="광주" > 광주 </option>
							</select>
							<input name="t_address" value="<%=dto.getAddress()%>" type="text" size="40%" placeholder="나머지 주소" maxlength="25">
						</td> <!---->
					</tr>
					<tr>
						<th> 휴대폰 </th>
						<td>
							<input type = "radio" value="SKT" name = "t_telecom" <%if(dto.getTelecom().equals("SKT"))out.print("checked");%>/> SKT
							<input type = "radio" value="KT" name = "t_telecom" <%if(dto.getTelecom().equals("KT"))out.print("checked");%>/> KT
							<input type = "radio" value="LGU+" name = "t_telecom" <%if(dto.getTelecom().equals("LGU+"))out.print("checked");%>/> LGU+
							&nbsp;
							<input name="t_phone_1" value="<%=dto.getPhone_1()%>" type = "text" size = "1" maxlength="3"/> - 
							<input name="t_phone_2" value="<%=dto.getPhone_2()%>" type = "text" size = "3" maxlength="4"/> - 
							<input name="t_phone_3" value="<%=dto.getPhone_3()%>" type = "text" size = "3" maxlength="4"/>
						</td>
					</tr>
					<tr>
						<th> 이메일 </th>
						<td>
							<input name="t_email_1" value="<%=dto.getEmail_1()%>" type = "text" size="10%" maxlength="20"/> @ 
							<input name="t_email_2" value="<%=dto.getEmail_2()%>" type = "text" size="10%" list="mail_list" maxlength="20">
							<datalist id="mail_list">
								<option value="naver.com">
								<option value="gmail.com">
								<option value="daum.net">
							</datalist>
						</td>
					</tr>
					<tr>
						<th> 관심분야 </th>
						<td>
							<input name="t_att_desk" type="checkbox" value="y" <%if(dto.getAtt_desk().equals("y"))out.print("checked");%>/>DESKTOP
							<input name="t_att_note" type="checkbox" value="y" <%if(dto.getAtt_note().equals("y"))out.print("checked");%>/>NOTEBOOK
							<input name="t_att_print" type="checkbox" value="y" <%if(dto.getAtt_print().equals("y"))out.print("checked");%>/>PRINT
							<input name="t_att_beam" type="checkbox" value="y" <%if(dto.getAtt_beam().equals("y"))out.print("checked");%>/>PROJECTER
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input name="pw_check_value" type="password" size="15%" maxlength="15" onkeypress="if(event.keyCode==13){update()}">
						<input type="hidden" value="<%=dto.getPw()%>" name="t_pw_1"></td>
					</tr>
				</tbody>
			</table>			
		</div>
		<br>
		<br>
		<div class="buttons">
			<p>
				<a href="javascript:update()">정보수정</a>
				<a href="javascript:deleteMember()">회원탈퇴</a>
				
			</p>
		</div>
		</form>
	</div>
	<%@ include file="/common_footer.jsp" %>
</div>
</body>
</html>
<%
	}
%>