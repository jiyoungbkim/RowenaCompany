<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="java.util.*,dao.News_DAO,dto.News_DTO,common.CommonUtil"%>
<%	
	request.setCharacterEncoding("UTF-8");	
	String news_no = request.getParameter("t_newsNo");
	News_DAO dao = new News_DAO();
	
	String selValue = request.getParameter("t_sel");
	String txtValue = request.getParameter("t_search");
	if(selValue == null){
		selValue ="title";
		txtValue ="";
	}
	ArrayList<News_DTO> arrW = dao.getNewsList(selValue,txtValue);

	int wHit = dao.newsHit(news_no);

//*********page start***********/
	String tdCount ="5";				

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
	if(arrW == null) total_count =0;
	else total_count = arrW.size(); 


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
#menu_bar ul li i{
	color : #666;
	vertical-align: middle;
	size : 5px;
	line-height : 40px;
}
#menu_bar ul li{
	border-bottom : #999 1px;
}
</style>

	<div id="menu_bar">
		<ul>
			<li><i class="fas fa-bell fa-lg"></i><a href="/notice/notice_r.jsp">&nbsp; NOTICE</a></li>
			<li><i class="fas fa-bullhorn fa-lg"></i><a href="/news/news_r.jsp">&nbsp; NEWS</a></li>
			<li><i class="fas fa-file-alt fa-lg"></i><a href="/freeboard/freeboard_r.jsp">&nbsp; FREEBOARD</a></li>
			<li><i class="fab fa-quora fa-lg"></i><a href="/qanda/qanda_r.jsp">&nbsp; QNA</a></li>
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
	vertical-align:top;
	height : 23px;
}
</style>
	<div id="contents">
		<p>
			<img src="../images/home3.png" class="home_icon">
			 HOME | COMMUNITY | NEWS
		</p>
<script>

</script>
		<form name="notice">
			<div class="search">
				<select name="t_sel">
					<option value="title" >제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="t_search" style="height:17px">
				<input type="button" onClick="javascript:formSearch()" value=" 검 색 " style="width: 60px"/>
			</div>
		</form>	
		
		<div class="board_list">
			<table class="board_table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>첨부</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%	if ( total_count > 0 ){
						for(int k = 0 ; k < total_count ; k++ )	{
							if(v_count == for_count){ 

				%> 	
					<tr>
						<td><a href="news_v.jsp?t_newsNo=<%=arrW.get(k).getNews_no()%>">
						<%=arrW.get(k).getNews_no()%></td>
						<td class="title">
						<a href="news_v.jsp?t_newsNo=<%=arrW.get(k).getNews_no()%>">
						<%=arrW.get(k).getTitle()%>
						</a></td>
						<% if (arrW.get(k).getFile_name_1() != null) { %> 
						<td><i class="far fa-save"></i></a></td>
						<% } else { %>
						<td>-</td>	
						<% } %>
						<td><%=arrW.get(k).getReg_id()%></td>
						<td><%=arrW.get(k).getReg_date()%></td>
						<td><%=arrW.get(k).getHit()%></td>
					</tr>
				<%
							v_count = v_count + 1;
							for_count = for_count + 1;
						} else { 
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
					url = "news_r.jsp?t_sel="+selValue+"&t_search="+txtValue;		
					out.println(CommonUtil.pageList(current_page, total_page, url));
				%>
				<%
					if(sessionId.equals("manager")){
				%>
				<a href="news_w.jsp" class="btn_write">글쓰기</a>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<%@ include file="/common_footer.jsp" %>
</div>
</body>
</html>