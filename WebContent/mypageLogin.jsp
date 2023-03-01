<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
	<%@ include file="./include/head.jsp" %>
    
    <% String LoginPw = (String)session.getAttribute("mPw"); %>
     <script>
    	window.onload = function()
    	{
    		document.mypagepw.myPw.focus();
    	}
    	function Pwh()
    	{
    		if(document.mypagepw.myPw.value == "")
    		{
    			alert("비밀번호를 입력해주세요.");
    			document.mypagepw.mPw.focus();
    			location.href = "mypageLogin.jsp";
    			return false;
    		}
    		
    	}
    </script>
    <%
    	request.setCharacterEncoding("UTF-8");
		
    	if(LoginId == null)
    	{
    		%>
    			<script>
    				alert("잘못된 접근입니다. 로그인을 먼저 해주세요.");
    				location.href = "index.jsp";
    			</script>
    		<% 
    	}
    %>
    
    <form class="row g-3" name="mypagepw" action="./Action/mypageLoginAction.jsp" method="post" onsubmit="return Pwh()">
     <div class="join_top">
			<h2>비밀번호 입력</h2>
	 </div>
     <div class="col-12 join_pw">
	    <img src="./images/password.png" alt="비밀번호아이콘" class="pw_icon">
	    <input type="password" class="form-control joinpw" name="myPw" id="inputPassword4" placeholder="비밀번호">
	  </div>
	  <div class="join_next">
	    <button type="submit" class="btn btn-primary">다음</button>
	  </div>
	<form>
	 
	 <%@ include file="./include/foot.jsp" %>