<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="./include/head.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<script>
		function Join(){
			if(document.join.mId.value == "")
			{
				alert("아이디를 입력해주세요");
				document.join.mId.focus();
				return false;
			}
			if(document.join.mPw.value == "")
			{
				alert("비밀번호를 입력해주세요");
				document.join.mPw.focus();
				return false;
			}
			if(document.join.mPwh.value == "")
			{
				alert("비밀번호확인을 입력해주세요");
				document.join.mPwh.focus();
				return false;
			}
			if(document.join.mName.value == "")
			{
				alert("닉네임을 입력해주세요");
				document.join.mName.focus();
				return false;
			}
			if(document.join.mEmail.value == "")
			{
				alert("이메일을 입력해주세요");
				document.join.mEmail.focus();
				return false;
			}
			
			/*비밀번호 확인*/
			if(document.join.mPw.value != document.join.mPwh.value)
			{
				alert("비밀번호가 일치하지 않습니다.");
				document.join.mPwh.value = ""; //비밀번호 확인창에 공백주기
				document.join.mPwh.focus();
				return false;
			}
			//회원가입 진행
			
			if(confirm("회원가입을 진행하시겠습니까?") != 1)	
			{
				return false;
			}
			return true;
			
		}
	</script>

	<form class="row g-3" name="join" action="./Action/joinAction.jsp" method="post" onsubmit="return Join()">
	  <div class="join_top">
			<h2>개인정보 입력</h2>
	  </div>
	  <div class="col-12 join_id">
	    <img src="./images/id.png" alt="아이디아이콘" class="id_icon">
	    <input type="text" class="form-control joinid" name="mId" id="inputEmail4" placeholder="아이디">
	  </div>
	  <br>
	  <div class="col-12 join_pw">
	    <img src="./images/password.png" alt="비밀번호아이콘" class="pw_icon">
	    <input type="password" class="form-control joinpw" name="mPw" id="inputPassword4" placeholder="비밀번호">
	  </div>
	  <div class="col-12 join_pwh">
	    <img src="./images/password1.png" alt="비밀번호확인아이콘" class="pwh_icon">
	    <input type="password" class="form-control joinpwh" name="mPwh" id="inputPassword4" placeholder="비밀번호확인">
	  </div>
	  <div class="col-12 join_name">
	    <img src="./images/name.png" alt="닉네임아이콘" class="name_icon">
	    <input type="text" class="form-control joinname" name="mName" id="inputAddress2" placeholder="닉네임">
	  </div>
	  <div class="col-12 join_email">
	    <img src="./images/email.png" alt="이메일아이콘" class="email_icon">
	    <input type="text" class="form-control joinemail" name="mEmail" id="inputCity" placeholder="이메일">
	  </div>
	  <div class="join_next">
	    <button type="submit" class="btn btn-primary">다음</button>
	  </div>
	</form>
	<%@ include file="./include/foot.jsp" %>