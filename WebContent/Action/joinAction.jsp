<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
		<!-- 회원가입 액션 페이지 -->
<%
	request.setCharacterEncoding("UTF-8");
	//한글깨짐 방지
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String host   = "jdbc:mysql://127.0.0.1:3306/soccer_db?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
	//boarddb 위치 연결
	String userid = "root";
	//db 접속가능한 아이디
	String userpw = "1234";
	//db 접속가능한 패스워드
	Connection conn = null; 		
	//변수 초기화
	PreparedStatement psmt = null;  
	//변수 초기화 PreparedStatement:인자와 관련된 작업이 특화(매개변수), 텍스트 SQL호출
	ResultSet rs = null; 			
	//rs에 실행결과를 담는데 이용 초기화
	
	String mId = request.getParameter("mId");			//uId에 받아온 파라메타 uId값을 넣는다. 
	String mPw = request.getParameter("mPw");			//uPw에 받아온 파라메타 uPw값을 넣는다.
	String mPwh = request.getParameter("mPwh");			//uPwh에 받아온 파라메타 uPwh값을 넣는다.
	String mName = request.getParameter("mName");		//uName에 받아온 파라메타 uName값을 넣는다.
	String mEmail = request.getParameter("mEmail");		//uEmail에 받아온 파라메타 uEmail값을 넣는다.
	
	
	try
	{
		conn = DriverManager.getConnection(host,userid,userpw);
		//DB에 연결하기 위한 작업, host, userid, userpw 를 확인해 DB에 접속 연결한다.
		String sql = "";
		//sql 초기화
		sql += "select mId, mName from soccer_db.ujoin ";
		// soccer_db이라는 DB에있는 join이라는 테이블에서 mId, mName컬럼을 선택하는것
		sql += "where mId = ? or mName = ? ";
		// uId와 uName에 들어가는 값을 ?로 놓고 입력받은 값을 넣을것
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1,mId);		//join.jsp에서 입력받아 넘어온 mId값을 넣는것
		psmt.setString(2,mName);	//join.jsp에서 입력받아 넘어온 mName값을 넣는것

		rs = psmt.executeQuery();
		//DB에 값을 입력시키고 반환을 받아야 할때 사용하는 쿼리문
		
		if(rs.next())
		{
			psmt.close();
			conn.close();
		%>
					<!-- 화면에 보여질 경고창과 강제이동 시키는 작업 -->
			<script>
				alert("중복된 아이디거나 중복된 닉네임입니다.");
				location.href="../join.jsp";
			</script>
		<%
				
		}
		
		sql = "";
		//sql 초기화
		sql += "insert into soccer_db.ujoin ";		
		//ujoin이라는DB에있는 ujoin이라는 테이블에 넣을것이다
		sql += "(mId,mPw,mPwh,mName,mEmail) ";
		//어떤 컬럼에 넣을건지 컬럼명 추가!!
		sql += "value (?,?,?,?,?) ";
		// 입력받은 값을 넣어줘야하기때문에 ?로 사용
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, mId);
		psmt.setString(2, mPw);
		psmt.setString(3, mPwh);
		psmt.setString(4, mName);
		psmt.setString(5, mEmail);
		//각자 입력받은 값을 DB에 입력하기
		psmt.executeUpdate();
		//DB에 값을 입력만하고 반환은 필요없을때 사용되는 쿼리문
		
		%>
						<!-- 가입완료 상태창과 함께 메인페이지로 이동시키는 구문 -->
			<script>
				alert("회원가입이 완료되었습니다.");
				location.href="../index.jsp";
			</script>
		<%
	}catch(Exception e)
	{
		e.printStackTrace();
	}finally
	{
		//객체를 닫아줘야함 꼭!!!
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
	
%>


