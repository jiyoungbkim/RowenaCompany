<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Freeboard_DAO,dto.Freeboard_DTO,common.CommonUtil"%>
<%@ include file="/common_session_info.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");	
	Freeboard_DAO dao = new Freeboard_DAO();
	
	String work_gubun 		= request.getParameter("t_work_gubun");
	int result = 0;
	String freeboard_no="";
	String msg ="";	
	
	if(work_gubun.equals("delete")){
		freeboard_no 	= request.getParameter("t_freeboard_no");		
		result = dao.deleteFreeboard(freeboard_no);
		msg = "삭제";
	} 

%>
<html>
	<head>
		<script>
			<% if(result > 0) {%>
				alert("<%=msg%>"+"되었습니다.");				
			<% } else {%>
				alert("<%=msg%> 처리되지 못했습니다.");
			<% }%>
			opener.parent.location.href="freeboard_r.jsp";
			window.close();
		</script>
	</head>
</html>