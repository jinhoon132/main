<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ include file="../include/head.jsp" %>
    <%
    	
    	try
    	{
    	request.setCharacterEncoding("UTF-8");
    		
    	String LoginPw = (String)session.getAttribute("mPw");
    	String mPw1 = request.getParameter("mPw2");
    	String mPwh1 = request.getParameter("mPwh");
    
    	
    	int LoginPw2 = Integer.parseInt(LoginPw);
    	int mPw2 = Integer.parseInt(mPw1);
    	int mPwh2 = Integer.parseInt(mPwh1);
    	
    	String sql = "";
    	sql += "UPDATE soccer_db.join ";
    	sql += "SET mPwh = ? ,mPw = ? where mId = '" + LoginId + "' " ;
    	
    	System.out.println(sql);
    	psmt = conn.prepareStatement(sql);
    	
    	psmt.setString(1, mPwh1);
    	psmt.setString(2, mPw1);
    	
    	psmt.executeUpdate();

    	if(mPw2 != mPwh2)
    	{
    		%>
    		<script>
    			alert("비밀번호가 일치하지 않습니다.");
    			location.href = "../mypage.jsp";
    		</script>
    		<%
	    	if(mPw2 == mPwh2)
	    	{
	    		%>
	    			<script>
	    				if(confirm("비밀번호를 변경하시겠습니까?") != 1)
	    					{
	    						alert("비밀번호 변경이 되었습니다. 다시 로그인해 주세요.");
	    						<%
	    						session.invalidate();
	    						psmt.close();
	    						conn.close();
	    						%>
	    						location.href = "../index.jsp";
	    						
	    					}else
	    						{
	    						alert("비밀번호 변경이 실패하였습니다.");
	    						location.href = "../mypage.jsp";
	    						return false;
	    						}
	    			</script>
	    		<%
	    	}
	    }
    	response.sendRedirect("../index.jsp");
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    	}finally
    	{
    		//객체를 닫아줘야함 꼭!!!
    		if(conn != null) conn.close();
    		if(psmt != null) psmt.close();
    	}
    %>
    