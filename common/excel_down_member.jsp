<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_session_info.jsp" %>
<%@ include file="/common/sessionCheckManager.jsp" %>
<%@ page import="java.util.*,dao.Mmember_DAO,dto.Member_DTO,common.CommonUtil"%>
<%
	request.setCharacterEncoding("UTF-8");	
	Mmember_DAO dao = new Mmember_DAO();	
	String id 		  = request.getParameter("t_id");
	String selValue   = request.getParameter("t_sel");
	String txtValue   = CommonUtil.checkNull(request.getParameter("t_search"));
	String areaValue  = request.getParameter("t_area");
	String checkValue = request.getParameter("t_check");
	if(selValue == null){
		selValue  = "all";
		txtValue  = "";
		areaValue = "";
	}
	if(checkValue == null) {
		checkValue ="reg_date";
	}
	ArrayList<Member_DTO> arrM = dao.getMemberList(selValue,txtValue,areaValue,checkValue);
%>
<%
response.setContentType("application/vnd.ms-excel;charset=utf-8");
response.setHeader("Content-Disposition","attachment;filename=member.xls");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
</head>
<body >
<br><br>
  
<table width="900" border="1">
   <TR align="center" height="50">
		<th colspan="7"> 회원현황</th>
   </TR> 
   <TR align="center" bgcolor="#EBEC96" height="25">
		<th>ID</th>
		<th>성명</th>
		<th>연락처</th>
		<th>e-mail</th>
		<th>지역</th>
		<th>가입일</th>
		<th>탈퇴유무</th>
   </TR> 
<%   
	for(int k = 0 ; k < arrM.size() ; k++ )	{    
%>	
	<tr>
		<td style="text-align:center"><%=arrM.get(k).getId()%></td>
		<td style="text-align:center"><%=arrM.get(k).getName()%></td>
		<td style="text-align:center"><%=arrM.get(k).getPhone_1()%>-<%=arrM.get(k).getPhone_2()%>-<%=arrM.get(k).getPhone_3()%></td>
		<td style="text-align:center"><%=arrM.get(k).getEmail_1()%>@<%=arrM.get(k).getEmail_2()%></td>
		<td style="text-align:center"><%=arrM.get(k).getArea()%></td>
		<td style="text-align:center"><%=arrM.get(k).getReg_date()%></td>
		<td style="text-align:center">
<%
			if(!arrM.get(k).getStatus().equals("-")) out.print("<p style='color:red'>탈퇴</p>");
			else out.print("-");
%>					

		</td>
	</tr>
<%   
	}
%>	
	
    </table>

</body>
</html>
