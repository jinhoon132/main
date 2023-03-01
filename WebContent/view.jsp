<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="./include/head.jsp" %>
	
	<%
		request.setCharacterEncoding("UTF-8");

		ResultSet rs = null;
		
		String mNo = request.getParameter("mNo");
		if(mNo == null)
		{
			%>
				<script>
					alert("잘못된 접근입니다.");
					location.href="list.jsp";
				</script>
			<%
		}
		try
		{
			
		String sql = "";
		sql += "select * from soccer_db.board where mNo = ? ";

		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, Integer.parseInt("mNo"));
		
		rs = psmt.executeQuery();

		if(rs.next())
		{
			bTitle = rs.getString("bTitle");
			bDate = rs.getString("bDate");
		}
		
	%>
	
	<div class="write_tab">
		<div class="write_la">게시글</div>
	<form method="post" action="./Action/viewAction.jsp" name="view">
	<table class="table table-bordered write_table">
	  <thead>
	    <tr>
	      <th scope="col" class="write_top">작성자</th>
	      	<td><%= LoginId %></td>
	      <th scope="col"class="write_hit">등록일</th>
	      	<td><%= bDate %></td>
	      <th scope="col" class="write_hit">조회수</th>
	      	<td><%= bCount %></td>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th class="write_top">제목</th>
	      	<td class="write_top"><%= bTitle %></td>
	    </tr>
	    <tr>
	      <th class="write_top">파일첨부</th>
	      <td colspan="2" class="write_top">파일명</td>
	    </tr>
	    <tr>
	      <th colspan="2" class="write_top">내용</th>
	      </tr>
	      <tr>
	      <td colspan="2"><textarea cols="140" rows="22"></textarea></td>
	    </tr>
	  </tbody>
	</table>
	<button class="btn btn-primary write_end" type="submit">등록하기</button>
	</form>
	</div>
	<%@ include file="./include/foot.jsp" %>