<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.QandA_DAO,dto.QandA_DTO,common.CommonUtil"%>
<%@ include file="/common_session_info.jsp"%>
<%@ include file="/common/sessionCheckMember.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");	
	QandA_DAO dao = new QandA_DAO();
	
	String work_gubun 		= request.getParameter("t_work_gubun");
	int result = 0;
	String qanda_no;
	String msg ="";	
	String title 			= request.getParameter("t_title");
	if(title != null) title = title.replaceAll("\'","\''");
	String question 		= request.getParameter("t_content");
	if(question != null ) question = question.replaceAll("\'","\''");
	String answer = request.getParameter("t_answer");
	String user_id 		= sessionId;
	String reg_date_q 	= CommonUtil.getToday();
	String reg_date_a = "";
	String secret = request.getParameter("t_secret");
	String status = "n";
	int hit = 0;
	
	if(work_gubun.equals("replay")){
		qanda_no 	= request.getParameter("t_qanda_no");		
		result = dao.deleteAnswer(qanda_no, answer, reg_date_a, status);
		msg = "답변삭제";
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
			location.href = "qanda_r.jsp";
		</script>
	</head>
</html>