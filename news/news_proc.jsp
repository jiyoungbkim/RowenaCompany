<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.News_DAO,dto.News_DTO,common.CommonUtil"%>
<%@ include file="/common/sessionCheckManager.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");	
	News_DAO dao = new News_DAO();
	
	String news_no = dao.getNewsNo();
	String title 	= request.getParameter("t_title");
	String content 	= request.getParameter("t_content");
	String reg_id = request.getParameter("t_reg_id");
	String reg_date 	= CommonUtil.getToday();
	
	String work_gubun = request.getParameter("t_work_gubun");
	int result = 0;
	String msg ="";
	if(work_gubun.equals("insert")) {
		result = dao.insertNews(news_no,title,content,reg_id,reg_date);
		msg ="등록";
	}  else if(work_gubun.equals("update")){
		news_no 	= request.getParameter("t_news_no");					
		result = dao.updateNews(news_no,title,content,reg_id,reg_date);
		msg = "수정";
	} else if(work_gubun.equals("delete")){
		news_no 	= request.getParameter("t_news_no");		
		result = dao.deleteNews(news_no);
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
			location.href = "news_r.jsp";
		</script>
	</head>
</html>