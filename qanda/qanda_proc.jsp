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
	String status = "";
	int hit = 0;
	
	
	if(work_gubun.equals("insert")){
		qanda_no 	= dao.getQandaNo();			
		QandA_DTO qanda_dto = new QandA_DTO(qanda_no, title, question, user_id, reg_date_q, secret);			
		result = dao.insertQanda(qanda_dto);
		msg = "등록";	
	} else if(work_gubun.equals("update")){
		qanda_no 	= request.getParameter("t_qanda_no");					
		result = dao.updateQanda(qanda_no, title, question, reg_date_q, secret);
		msg = "수정";
	} else if(work_gubun.equals("replay")){
		qanda_no 	= request.getParameter("t_qanda_no");					
		result = dao.updateAnswer(qanda_no, answer, reg_date_q, "y");
		msg = "답변";
	} if(work_gubun.equals("delete")){
		qanda_no 	= request.getParameter("t_qanda_no");		
		result = dao.deleteQanda(qanda_no);
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
			location.href = "qanda_r.jsp";
		</script>
	</head>
</html>