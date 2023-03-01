<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
		let today = new Date();
		let year = today.getFullYear() //년도
		let month = today.getMonth()+1; //월
		let date = today.getDate(); //날짜
		
		document.write(year + "년" + month + "월" + date + "일");
	</script>
</head>
<body>

</body>
</html>