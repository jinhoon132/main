<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
	<%@ include file="./include/head.jsp" %>
    
    <%
    	String LoginEmail = (String)session.getAttribute("mEmail");
    %>
    <script>
    	function Change()
    	{
    		if(document.change.mPw2.value == "")
    		{
    			alert("비밀번호를 입력해주세요.");
    			document.change.mPw2.focus();
    			document.change.mPw2.value="";
    			return false;
    		}
    		if(document.change.mPwh.value == "")
    		{
    			alert("비밀번호확인을 입력해주세요.");
    			document.change.mPwh.focus();
    			document.change.mPwh.value="";
    			return false;
    		}
    		return;
    	}
    </script>
    
    <form class="row g-3" name="change" action="./Action/mypageAction.jsp" method="post" onsubmit="return Change()">
	  <div class="join_top">
			<h2>개인정보 변경</h2>
	  </div>
	  <div class="col-12 join_id">
	    <img src="./images/id.png" alt="아이디아이콘" class="id_icon">
	    <input disabled type="text" class="form-control joinid" name="mId" id="inputEmail4" value=<%= LoginId %>>
	  </div>
	  <br>
	  <div class="col-12 join_pw">
	    <img src="./images/password.png" alt="비밀번호아이콘" class="pw_icon">
	    <input type="password" class="form-control joinpw" name="mPw2" id="inputPassword4" placeholder="비밀번호">
	  </div>
	  <div class="col-12 join_pwh">
	    <img src="./images/password1.png" alt="비밀번호확인아이콘" class="pwh_icon">
	    <input type="password" class="form-control joinpwh" name="mPwh" id="inputPassword4" placeholder="비밀번호확인">
	  </div>
	  <div class="col-12 join_name">
	    <img src="./images/name.png" alt="닉네임아이콘" class="name_icon">
	    <input disabled type="text" class="form-control joinname" name="mName" id="inputAddress2" value=<%= LoginName %>>
	  </div>
	  <div class="col-12 join_email">
	    <img src="./images/email.png" alt="이메일아이콘" class="email_icon">
	    <input disabled type="text" class="form-control joinemail" name="mEmail" id="inputCity" value=<%= LoginEmail %>>
	  </div>
	  <div class="join_next">
	    <button type="submit" class="btn btn-primary">변경하기</button>
	  </div>
	</form>   
        
    <%@ include file="./include/foot.jsp" %>