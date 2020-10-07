<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Member_DAO,dto.Member_DTO,common.CommonUtil"%>
<%@ include file="/common_session_info.jsp" %>
<%@ include file="/common/sessionCheckMember.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");	
	Member_DAO dao = new Member_DAO();
	
	String id = request.getParameter("t_id");
	
	int result = 0;
	result = dao.deleteMember(id);

    //out.print(query);
	session.invalidate();
%>
<html>
	<head>
		<script>
			<%
			if(result >= 0) {
			%>
				alert("탈퇴 성공");
				location.href = "/index.jsp";
			<%
			} else {				
			%>
				alert("탈퇴 실패");
				location.href = "/member/member_myinfo.jsp";
			<%
			}
			%>
		</script>
	</head>
</html>