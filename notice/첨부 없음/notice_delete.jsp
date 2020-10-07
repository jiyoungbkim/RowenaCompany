<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Notice_DAO"%>
<%
	request.setCharacterEncoding("UTF-8");	
	Notice_DAO dao = new Notice_DAO();

	String notice_no 	= request.getParameter("t_notice_no");	
	
	int result = dao.deleteNotice(notice_no);	
%>
<html>
	<head>
		<script>
			<% if(result > 0) {%>
				alert("삭제되었습니다.");
			<% } else {%>
				alert("삭제처리되지 못했습니다.");
			<% }%>
			location.href = "notice_r.jsp";
		</script>
	</head>
</html>