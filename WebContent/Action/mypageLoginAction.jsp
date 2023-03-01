<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="../include/head.jsp" %>
    
    <%
    	String LoginPw = (String)session.getAttribute("mPw");
    	String myPw = request.getParameter("myPw");

    	int LoginPw1 = Integer.parseInt(LoginPw);
    	int myPw1 = Integer.parseInt(myPw);

    	
    	if(myPw1 != LoginPw1)
		{
    		%>
    		<script>
			alert("비밀번호가 일치하지않습니다.");
			location.href = "../mypageLogin.jsp";
			</script>
			<%
			return;
		}
    	if(myPw1 == LoginPw1)
    	{
    		%>
    			<script>
    				location.href = "../mypage.jsp";
    			</script>
    		<%
    	}
    %>
    
    
    <%@ include file="../include/foot.jsp" %>