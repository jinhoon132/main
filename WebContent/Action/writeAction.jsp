<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %><!-- java.sql기능 이용을 위해 연결 -->
<%@ page import = "java.io.*" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

	<%
		String host   = "jdbc:mysql://127.0.0.1:3306/soccer_db?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		String userid = "root";
		String userpw = "1234";
		
		Connection conn = null;
		PreparedStatement psmt = null; //동적쿼리 생성 객체
		
		try{
			
			request.setCharacterEncoding("UTF-8");	
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(host,userid,userpw);

			String path = "C:/work-s/jinhoon/WebContent/upload ";
			int maxSize = 5*1024*1024;
			
			MultipartRequest multi = new MultipartRequest(request,path,maxSize,"utf-8", new DefaultFileRenamePolicy());
		
			String LoginId = multi.getParameter("LoginId");
			String bTitle = multi.getParameter("bTitle");
			String bContent = multi.getParameter("bContent");
			
			String upFileName = multi.getOriginalFileName("upFile");
			
			
			String sql = "";
			sql += "insert into soccer_db.board ";
			sql += "(mId, bTitle, bContent, bFileName) ";
			sql += "values(?,?,?,?) "; 
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, LoginId);
			psmt.setString(2, bTitle);
			psmt.setString(3, bContent);
			psmt.setString(4, upFileName);
					
			int rs = psmt.executeUpdate();
			
			if(rs > 0)
			{
				%>
				<script>
					alert("게시글이 등록되었습니다.");
					location.href="../list.jsp";
				</script>
				<%
			}else
			{
				%>
				<script>
					alert("게시글 작성이 실패하였습니다.");
					location.href="../write.jsp";
				</script>
				<%
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			%>
			<script>
				alert("게시글 작성이 실패1하였습니다.");
				location.href="../write.jsp";
			</script>
			<%
		}finally
		{
			if(conn != null) conn.close();
			if(psmt != null) psmt.close();
		}
	%>
	