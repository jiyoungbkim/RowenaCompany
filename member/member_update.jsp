<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Member_DAO,dto.Member_DTO,common.CommonUtil"%>
<%@ include file="/common_session_info.jsp" %>
<%@ include file="/common/sessionCheckMember.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");	
	Member_DAO dao = new Member_DAO();
	Member_DTO dto = new Member_DTO();
	
	String id = request.getParameter("t_id");
	String pw = request.getParameter("t_pw_1");
	String name = request.getParameter("t_name");
	String birth = request.getParameter("t_birth");
	String area = request.getParameter("t_area");
	String address = request.getParameter("t_address");
	String telecom = request.getParameter("t_telecom");
	String phone_1 = request.getParameter("t_phone_1");
	String phone_2 = request.getParameter("t_phone_2");
	String phone_3 = request.getParameter("t_phone_3");
	String email_1 = request.getParameter("t_email_1");
	String email_2 = request.getParameter("t_email_2");
	String att_desk = request.getParameter("t_att_desk");
	String att_note = request.getParameter("t_att_note");
	String att_print = request.getParameter("t_att_print");
	String att_beam = request.getParameter("t_att_beam");
	if(att_desk == null) att_desk = "";
	if(att_note == null) att_note = "";
	if(att_print == null) att_print = "";
	if(att_beam == null) att_beam = "";
	String update_date = CommonUtil.getToday();

	dto = new Member_DTO(id, pw, name, birth, area, address, telecom, phone_1, phone_2, phone_3,
			email_1, email_2, att_desk, att_note, att_print, att_beam, update_date);
	int result = 0;
	result = dao.updateMyinfo(dto);

    //out.print(query);

%>
<html>
	<head>
		<script>
			<%
			if(result >= 0) {
			%>
				alert("수정 성공");
				location.href = "/index.jsp";
			<%
			} else {				
			%>
				alert("수정 실패");
				location.href = "/member/member_myinfo.jsp";
			<%
			}
			%>
		</script>
	</head>
</html>