<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
	<%@ include file="./include/head.jsp" %>
	
	<%
		request.setCharacterEncoding("UTF-8");

		ResultSet rs = null;

		String sql = "";
		sql += "select * from soccer_db.board ";

		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();

	%>
	
		<div class="sub_list">
	        <table class="table">
	        <h2>공지사항</h2>
		        <thead>
		            <tr>
			            <th scope="col">No</th>
			            <th scope="col" class="title">제목</th>
			            <th scope="col" class="name">작성자</th>
			            <th scope="col" class="hit">조회수</th>
			            <th scope="col" class="date">작성일</th>
		            </tr>
		        </thead>
		        <%
		        	while(rs.next())
		        	{
		        %>
		        <tbody>
		            <tr>
			            <th scope="row" class="thr table-light"><%= rs.getString("mNo") %></th>
			            <td class="thr title table-light"><a href="view.jsp?LoginNo=<%=rs.getString("mNo")%>"><%= rs.getString("bTitle") %></a></td>
			            <td class="thr table-light"><%= rs.getString("mId") %></td>
			            <td class="thr table-light"><%= rs.getInt("bCount") %></td>
			            <td class="thr table-light"><%= rs.getString("bDate") %></td>
		            </tr>
		            <%
		        	}
		        	%>
		        </tbody>
	        </table>
	        <div class="cata"><a class="btn btn-primary list1" href="list.jsp" role="button">목록</a></div>
	        <%
	        	if(LoginId != null)
	        	{
	        		%>
	        	<button class="btn btn-primary list2" onclick="location.href='write.jsp'" type="submit">글쓰기</button>
	        	<%
	        	}
	        %>
	        	<div class="col-md-4">
			    <select id="inputState" class="form-select">
			      <option selected value="1">제목 + 작성자</option>
			      <option value="2">제목</option>
   			      <option value="3">작성자</option>
			    </select>
			    <input type="text" class="form-control">
			    <button type="submit" class="btn btn-primary search">검색</button>
			  </div>
	<%@ include file="./include/foot.jsp" %>