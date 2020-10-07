<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Notice_DAO,dto.Notice_DTO,common.CommonUtil"%>
<%
	request.setCharacterEncoding("UTF-8");	
	Notice_DAO dao = new Notice_DAO();

	String notice_no 	= dao.getNoticeNo();	
	String title 		= request.getParameter("t_title");
	String content 		= request.getParameter("t_content");
	String file_name_1  = "";
	//String value 		= request.getParameter("t_value");
	String reg_id 		= request.getParameter("t_reg_id");
	String reg_date 	= CommonUtil.getToday();
	
	//int result = 0;
	//int result = dao.insertNotice(notice_no,title,content,reg_id,reg_date);
	//String query = "insert into a20_track2_web_notice(notice_no, title, content, reg_id, reg_date) "+
	//				" values ('"+notice_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"') ";

	Notice_DTO notice_dto = new Notice_DTO(notice_no,title,content,file_name_1,reg_id,reg_date,0);
	int result = dao.insertNotice(notice_dto);
		
%>
<html>
	<head>
		<script>
			<% if(result > 0) {%>
				alert("등록되었습니다.");
			<% } else {%>
				alert("정상처리되지 못했습니다.");
			<% }%>
			location.href = "notice_r.jsp";
		</script>
	</head>
</html>