<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="../include/head.jsp" %>

    
    <%
			request.setCharacterEncoding("UTF-8");

			ResultSet rs = null;

			String sql = "";
			sql += "select * from soccer_db.ujoin where mId = ? and mPw = ? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mId);
			psmt.setString(2, mPw);
								
			rs = psmt.executeQuery();
			try
			{
			if(rs.next() == false)
			{
			
				%>
					<script>
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");
						location.href = "../index.jsp";
					</script>
				<%
			return;
			}
			String mNo = rs.getString("mNo");
			String mID = rs.getString("mId");
			String mName = rs.getString("mName");
			
			session.setAttribute("mNo", mNo);
			session.setAttribute("mId", mID);
			session.setAttribute("mPw", mPw);
			session.setAttribute("mName", mName);
			
			response.sendRedirect("../index.jsp");
			}catch(Exception e)
			{
				e.printStackTrace();
			}finally
			{
				if(conn != null) conn.close();
				if(psmt != null) psmt.close();
				if(rs != null) rs.close();
			}
    %>
    <%@ include file="../include/foot.jsp" %>