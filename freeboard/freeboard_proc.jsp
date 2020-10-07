<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Freeboard_DAO,dto.Freeboard_DTO,common.CommonUtil"%>
<%@ include file="/common_session_info.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");	
	Freeboard_DAO dao = new Freeboard_DAO();
	
	String work_gubun 		= request.getParameter("t_work_gubun");
	int result = 0;
	String freeboard_no="";
	String pw = request.getParameter("t_pw");
	String msg ="";	
	String title 		= request.getParameter("t_title");
	if(title != null) title = title.replaceAll("\'","\''");
	String content 		= request.getParameter("t_content");
	if(content != null ) content = content.replaceAll("\'","\''");
	String reg_id 		= request.getParameter("t_name");
	if(reg_id != null) reg_id.replaceAll("\'","\''");
	String reg_date 	= CommonUtil.getToday();
	
	
	if(work_gubun.equals("insert")){
		freeboard_no 	= dao.getFreeboardNo();					
		//Freeboard_DTO freeboard_dto = new Freeboard_DTO(freeboard_no,pw,title,content,reg_id,reg_date);			
		//result = dao.insertFreeboard(freeboard_dto);
		result = dao.insertFreeboard(freeboard_no,pw,title,content,reg_id,reg_date);
		msg = "등록";
	} else if(work_gubun.equals("update")){
		freeboard_no 	= request.getParameter("t_freeboard_no");					
		result = dao.updateFreeboard(freeboard_no, title, content, reg_id, reg_date);
		msg = "수정";
	} if(work_gubun.equals("delete")){
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
			location.href="freeboard_r.jsp";
			
		</script>
	</head>
</html>