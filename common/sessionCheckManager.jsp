<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%
	if(!sessionLevel.equals("manager")){		
%>
	<script>
		alert("관리자 화면입니다. 관리자 로그인 하세요.");
		location.href = "/index.jsp";
	</script>
<%
	}
%>