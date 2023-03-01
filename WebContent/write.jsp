<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.sql.Date" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
   	<%@ include file="./include/head.jsp" %>
	
	<%		
		
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
	<!-- 빈칸 입력받기 -->
	<script>
		function List()
		{
			if(document.write.boardTitle.value == "")
			{
				alert("제목을 입력해주세요.");
				document.write.boardTitle.focus();
				return false;
			}
			if(document.write.boardContent.value == "")
			{
				alert("내용을 입력해주세요.");
				document.write.boardContent.focus();
				return false;
			}
			if(confilm("작성된 게시물을 저장하시겠습니까?") != 1)
			{
				return false;	
			}
			return true;
		}
	</script>
	
	<div class="write_tab">
		<div class="write_la">게시글 작성</div>
	<form method="post" action="./Action/writeAction.jsp" enctype="multipart/form-data" name="write" onsubmit="return List()">
	<table class="table table-brdered write_table">
	  <thead>
	    <tr>
	      <th scope="col" class="write_top">작성자</th>
	      	<td colspan="4"><%= LoginId %></td>
	    </tr>
	  </thead>
	  <tbody>
	  	<tr>
	      <th class="write_top">제목</th>
	      	<td colspan="1" class="write_top write_ti"><input type="text" placeholder="제목을 입력해주세요." name="bTitle"></td>
	      <th colspan="2" class="write_top write_top1">분류
	      	<td>
	      	<select>
	      		<option>EPL</option>
	      		<option>라리가</option>
	      		<option>분데스리가</option>
	      		<option>리그1</option>
	      		<option>세리에A</option>
	      		<option>기타리그</option>
	      	</select>
	      	</td>
	      </th>
	    </tr>
	    <tr>
	      <th class="write_top">파일첨부</th>
	     	 <td colspan="5" class="write_top"><input type="file" name="upFile"></td>
	    </tr>
	    <tr>
	      <th colspan="6" class="write_top">내용</th>
	    </tr>
	    <tr>
	      <td colspan="6"><textarea cols="140" rows="22" name="bContent" placeholder="내용을 입력해주세요."></textarea></td>
	    </tr>
	  </tbody>
	</table>
	<input class="btn btn-primary write_end" type="submit" value="등록하기">
	</form>
	</div>
	
	<%@ include file="./include/foot.jsp" %>