<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
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
	int memberCount = dao.getMemberCount();	
//*********page start***********/
	String tdCount ="7";				

	String r_page = CommonUtil.checkNull(request.getParameter("r_page"));		
	int			current_page;					// 현재페이지 번호
	int			total_page;						// 총페이지 수
	int			total_count;					// 총레코드 수
	int			for_count;						
	int			list_setup_count = 10;			// 한번에 출력될 List 수
	int			p_no;
	int			v_count;
	int			a_count;
	String		url				= null;	

	// 조회된 건수 구하기  total_count : 설정
	if(arrM == null) total_count =0;
	else total_count = arrM.size(); 


	// 페이지번호가 없으면 1페이지로 간주
	if(r_page.equals("")) current_page = 1;
	else current_page = Integer.parseInt(r_page);
		
	for_count		= list_setup_count;
	p_no			= list_setup_count;				// 페이지수가 10
	total_page = total_count / list_setup_count;		// 전체페이지수 계산 (if 23개 게시물이면 2)
   
	if(current_page == 1) {
		v_count		= 0;
		a_count		= list_setup_count;
		for_count	= 0;
	} else{
		v_count		= 0;
		a_count		= p_no * current_page;
		for_count	= a_count - list_setup_count;
	}
	if(total_page * list_setup_count != total_count)   total_page = total_page +1;
//*********page end***********/
	
%>
<div id="con">
<style>

</style>
<!--<%="========="+txtValue%>-->
	<div id="menu_bar">
		<ul>
			<li><i class="fas fa-id-badge"></i><a href="/notice/notice_r.jsp">&nbsp; MEMBER LIST</a></li>
			<li><i class="fas fa-clipboard-list"></i><a href="/news/news_r.jsp">&nbsp; STAFF LIST</a></li>
		</ul>
	</div>
<style>
.board_list { padding-top:10px; }
.board_table{ width: 100%; font-size : 12px;}

.board_list th{
	border-top:1px solid #848484;
	border-bottom: 1px solid #848484;
	padding: 10px;
}
.board_table td{
	text-align:center;
	padding : 7px;
	border-bottom:1px solid #e0e0e0;
}
td.title{
	text-align : left;
}
.home_icon{
	width : 13px;
}
#contents p {
	font-size : 11px;
}
#contents tr, a{
	font : 11px;
	color : #848484;
}
.search{
	float: right;
	margin-bottom: 5px;
}
.search select, input {
	color:#666;
	vertical-align:middle;
	height : 23px;
}
.count {
	
	margin-top : 5px;
}
/* .paging {
	padding-top:30px; 
	text-align:center;
}
.paging a {
	padding:10px; 
	border:1px solid #e0e0e0;
}
.paging a.active {
	background:#007dc6;
	color:#fff
}
.paging .btn_write{
	background : #123454;
	padding : 10px 16px;
	color : #fff;
	float : right;
} */
</style>
	<div id="contents">
		<p>
			<img src="../images/home3.png" class="home_icon">
			 HOME | MANAGER | MEMBER
		</p>
		<br>
<script>
	function formSearch(){
		var fm = document.member;
		fm.action = "Mmember_r.jsp";
		fm.method = "post";
		
		
		fm.submit();
	}
	function goExcel(){
		var fm = document.member;
		fm.action = "/common/excel_down_member.jsp";
		fm.method = "post";
		alert(fm.t_sel.value);
		alert(fm.t_search.value);
		alert(fm.t_area.value);
		fm.submit();
	}
	function t_selChange(){
		var fm = document.member;
		if(fm.t_sel.value == "all"){
			fm.t_search.disabled="disabled";
		} else {
			fm.t_search.disabled="";
		}
	}
</script>
		<form name="member">
			<div class="search">
				
				<input type="radio" value="reg_date" name="t_check" <%if(checkValue.equals("reg_date"))  out.print("checked");%>>가입일
				<input type="radio" value="name"     name="t_check" <%if(checkValue.equals("name"))		 out.print("checked");%>>성명
				<input type="radio" value="id" 		 name="t_check" <%if(checkValue.equals("id")) 		 out.print("checked");%>>아이디&nbsp;
				
				<select name="t_sel" class="sel_box" onChange="t_selChange()">
					<option value="all"  <%if(selValue.equals("all")) 	out.print("selected");%>>전체</option>
					<option value="name" <%if(selValue.equals("name")) 	out.print("selected");%>>성명</option>
					<option value="id"   <%if(selValue.equals("id")) 	out.print("selected");%>>아이디</option>
				</select>
				<input type="text" value="<%=txtValue%>" name="t_search" style="height:17px;width:130px;" <%if(selValue.equals("all")) out.print("disabled='disabled'");%>>
				<select name="t_area">
					<option value=""> 지역선택 </option>
					<option value="서울" > 서울 </option>
					<option value="수원" > 수원 </option>
					<option value="대전" > 대전 </option>
					<option value="광주" > 광주 </option>
				</select>
				<input type="button" onClick="javascript:formSearch()" value=" 검 색 " style="width: 60px"/>
				<input type="button" onClick="javascript:goExcel()" value=" Excel " style="width: 60px"/>
			</div>
		</form>	
		<input type="hidden" class="count">전체 회원수 : <%=memberCount%> 명
		<div class="board_list">
			<table class="board_table">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="*%">
					<col width="20%">
					<col width="10%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>아이디</th>
						<th>성명</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>지역</th>
						<th>가입일</th>
						<th>회원유무</th>
					</tr>
				</thead>
				<tbody>
				<%	if ( total_count > 0 ){
						for(int k = 0 ; k < total_count ; k++ )	{
							if(v_count == for_count){ 

				%> 	
					<tr>
						<td><a href="Mmember_v.jsp?t_id=<%=arrM.get(k).getId()%>">
						<%=arrM.get(k).getId()%></td>
						<td class="name">
						<a href=""><%=arrM.get(k).getName()%></a></td>					
						<td><%=arrM.get(k).getPhone_1()%>-<%=arrM.get(k).getPhone_2()%>-<%=arrM.get(k).getPhone_2()%></td>
						<td><%=arrM.get(k).getEmail_1()%> @ <%=arrM.get(k).getEmail_2()%></td>	
						<td><%=arrM.get(k).getArea()%></td>
						<td><%=arrM.get(k).getReg_date()%></td>
						<%if(arrM.get(k).getStatus().equals("탈퇴")){%>
							<td style="color:#ff72a1;font-weight:bold "><%=arrM.get(k).getStatus()%></td>
						<% } else { %>
							<td><%=arrM.get(k).getStatus()%></td>
						<% } %>
					</tr>
				<%
							v_count = v_count + 1;
							for_count = for_count + 1;
						}else { 
							v_count = v_count + 1;
						}

						if(v_count == a_count)break; 

						}
					}else{	
				%>
					<TR align="center" bgcolor="white" >
						<TD colspan="<%=tdCount%>" >등록된 내용이 없습니다.</TD>
					</TR>
				<%	} %>
				</tbody>
			</table>
			<div class="paging">
				<%
					url = "Mmember_r.jsp?t_sel="+selValue+"&t_search="+txtValue+"&t_area="+areaValue;		
					out.println(CommonUtil.pageList(current_page, total_page, url));
				%>
			
			</div>
		</div>
	</div>
<style>
</style>
<%@ include file="/common_footer.jsp" %>
</div>
</body>
</html>