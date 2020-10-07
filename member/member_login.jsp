<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<style>
.fas fa-edit{
	size : 10px;
}
</style>
<div id="con">
	<div id="menu_bar">
		<ul>
			<li><i class="fas fa-edit"></i><a href="/notice/notice_r.jsp">&nbsp; 회원가입</a></li>
			<li><i class="fas fa-hand-point-right"></i><a href="/notice/notice_r.jsp">&nbsp; 아이디찾기</a></li>
			<li><i class="fas fa-unlock"></i><a href="/notice/notice_r.jsp">&nbsp; 비밀번호찾기</a></li>
		</ul>
	</div>
<style>

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
/* login css */
	.login-group {overflow:hidden; width:40%; margin:0 auto; background-color:#A4A4A4; padding:5% 3% 3% 3%;}
	.sub-wrap .float-left {float:left; width:67%; margin-right:2%;}
	.sub-wrap .float-right {float:right; width:25%;}
	.login-group .txt {width:100%; height:46px; line-height:45px;  border:1px solid #585858; border-radius:3px; color:#A4A4A4; margin-bottom:10px; padding:0 10px;}
	.login-group h2 {margin-bottom:30px; font-size:18px; font-weight:bold; color:#fff;}
	.login-group .submit {width:93%; border-radius:3px; color:#fff; height:120px; margin-top:16px;background-color:#313d55; border:0 none; cursor:pointer;}
	.login-group p {color:#fff; clear:both;}
	.login-group p.btn {margin-bottom:15px;}
	.login-group p.btn a {display:inline-block; width:48%; height:45px; line-height:45px; text-align:center; color:#fff; background-color:#313d55; border:1px solid #707b92; border-radius:3px;}

</style>
<script>
	function login_check(){
		var form = document.member;
		if(!checkEmpty(form.t_id,"아이디를 입력하시오!")) return;
		if(!checkEmpty(form.t_pw,"비밀번호를 입력하시오!")) return;
		form.method = "post";
		form.action = "member_login_proc.jsp";
		form.submit();
		
	}
	function go_password(){
		document.member.t_pw.focus();
	}
</script>

<body>
	<div id="contents">
		<p>
			<img src="/images/home3.png" class="home_icon">
			 HOME | JOIN
		</p>
		<form name="member">
			
			<div class="bord_list">
			<section id="content">
				<div class="sub-wrap">
					<div class="login-group">
						<h2>아이디/비밀번호 로그인</h2>
						<form name="login" method="post" enctype="multipart/form-data" action="logincheck.html">
							<fieldset> <!-- 로그인이라는 필드셋의 묶음 -->
								<div class="float-left">
									<p>
									<label class="readonly">아이디</label>
									<input type="text" name="t_id" onkeypress="if(event.keyCode==13){go_password()}" class="txt" autofocus="autofocus" placeholder="아이디를 입력하세요">
									</p> <!-- label의 for 명과 input의 id 명은 같아야 한다 -->
									<p>
									<label class="readonly">비밀번호</label>
									<input type="password" name="t_pw" onkeypress="if(event.keyCode==13){login_check()}" class="txt" placeholder="비번호를 입력하세요">
									</p>
								</div>
								<div class="float-right">
									<p>
									<input type="button" value="로그인" class="submit" onClick="login_check();"> <!-- 사용자 함수 -->
									</p> <!-- 여기서 value는 버튼이라는 타입에 나타나는 글자 -->
								</div>
								<p class="btn">
									<a href="member_pw_find.jsp">ID/PW 찾기</a>
									<a href="/member/member_w.jsp">회원가입</a>
								</p>
							</fieldset>
						</form>
					</div>						
				</div>
			</section>			

		</div>
		
		</form>
	</div>

	<%@ include file="/common_footer.jsp" %>
</div>
</body>
</html>