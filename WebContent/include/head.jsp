<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
	<%
	    String host   = "jdbc:mysql://127.0.0.1:3306/soccer_db?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		String userid = "root";
		String userpw = "1234";
		
		Connection conn = null;
		PreparedStatement psmt = null; //동적쿼리 생성 객체
		
		try{
		request.setCharacterEncoding("UTF-8");	
    	
    	String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		conn = DriverManager.getConnection(host,userid,userpw);
		String LoginNo = null;
		String LoginId = null;
		String LoginName = null;
		String bDate = request.getParameter("bDate");
		String bCount = request.getParameter("bCount");
		String bTitle = request.getParameter("bTitle");
		
		if((String)session.getAttribute("mNo") != null)
		{
			LoginNo = (String)session.getAttribute("mNo");
		}
		if((String)session.getAttribute("mId") != null)
		{
			LoginId = (String)session.getAttribute("mId");
		}
		if((String)session.getAttribute("mName") != null)
		{
			LoginName = (String)session.getAttribute("mName");
		}
		
		%>
	    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>진훈 게시판</title>
	
	<!--폰트어썸-->
    <link rel="stylesheet" href="https://kit.fontawesome.com/c25d652be8.css" crossorigin="anonymous">
	
	<!-- 부트스트랩 css연결 -->    
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!--플러그인 연결-->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    
    <!-- css연결 -->
	<link rel="stylesheet" href="./css/style.css"/>
	<script>
		window.onload = function()
		{
			document.login.mId.focus();
		}
		function loging()
		{
			if(document.login.mId.value == "")
			{
				alert("아이디를 입력해주세요.");
				document.login.mId.focus();
				return false;
			}
			if(document.login.mPw.value == "")
			{
				alert("비밀번호를 입력해주세요.");
				document.login.mPw.focus();
				return false;
			}
			return;
		}
	</script>
	
	</head>
	<body>
		<header>
        <div class="inner">
            <a href="./index.jsp"><img src="./images/logo4.jpg" alt="로고사진"/></a>
            <%
            	if(LoginNo == null)
            	{
            %>
            <form action="./Action/loginOk.jsp" method="post" name="login" onsubmit="return loging()">
            <div class="label">
                <label>ID</label><input type="text" name="mId">
                <label>PW</label><input type="password" name="mPw"><br>
                <input type="submit" value="로그인" name="submit" class="subm">
                <input type="button" value="회원가입" name="join" class="join" onclick="location.href='./join.jsp'">
            </div>
          </form>
          <% 
          }else{
          %>
          <form action="./Action/logout.jsp" method="post">
            <div class="label">
                <a><%= LoginName %> 님 환영합니다.</a><br/>
                <input type="button" value="정보수정" name="mypage" class="subm" onclick="location.href='./mypageLogin.jsp'">
                <input type="submit" value="로그아웃" name="logout" class="logout" onclick="location.href='./Action/logout.jsp'">
            </div>
          </form>
          <%
          }
          %>
        <ul class="menu">
            <li class="ft ft1">
              <a href="#">공지사항</a>
              <ul class="submenu">
                <li><a href="list.jsp">공지사항</a></li>
                <li><a href="#">진행중 이벤트</a></li>
                <li><a href="#">이벤트 당첨 발표</a></li>
              </ul>
            </li>
            <li class="ft">
              <a href="#">해외축구</a>
              <ul class="submenu">
                <li><a href="#">EPL</a></li>
                <li><a href="#">라리가</a></li>
                <li><a href="#">분데스리가</a></li>
                <li><a href="#">리그1</a></li>
                <li><a href="#">세리에A</a></li>
                <li><a href="#">기타리그</a></li>
              </ul>
            </li>
            <li class="ft">
              <a href="#">국내축구</a>
              <ul class="submenu">
                <li><a href="#">K리그</a></li>
                <li><a href="#">A대표팀</a></li>
                <li><a href="#">국내선수 이슈</a></li>
              </ul>
            </li>
            <li class="ft">
              <a href="#">자유게시판</a>
              <ul class="submenu">
                <li><a href="#">축구칼럼</a></li>
                <li><a href="#">축구 영상</a></li>
                <li><a href="#">승부예측</a></li>
                <li><a href="#">갤러리</a></li>
                <li><a href="#">축구용품</a></li>
              </ul>
            </li>
            <li class="ft">
              <a href="#">축구 게임</a>
              <ul class="submenu">
                <li><a href="#">FM</a></li>
                <li><a href="#">FIFA</a></li>
                <li><a href="#">위닝일레븐</a></li>
                <li><a href="#">피파온라인4</a></li>
              </ul>
            </li>
            <%
            	if(LoginNo != null)
            	{
            %>
            <li class="ft">
            	<a href="#">신고</a>
            </li>
            <%
            }
            %>
          </ul>
        </div>
    </header>
    <%
    	if(LoginNo != null)
    	{
    %>
    <div class="mypage">
          <p>마이페이지</p>
          <ul>
              <li><a>서비스1팀</a></li>
              <li><a>이벤트 발표</a></li>
              <li><a>서비스 당첨자</a></li>
              <li><a>공유자료방</a></li>
              <li><a>채택</a></li>
          </ul>
          <hr>
          <ul>
            <li><a>관리자</a></li>
            <li><a>분류관리</a></li>
            <li><a>게시판관리</a></li>
            <li><a>권한설정</a></li>
            <li><a>신고함</a></li>
          </ul>
        </div> 
    <%
    }
    %>
    
    	<div class="slide slide_wrap">
        <div class="slide_item item1"><img src="./images/main.jpg">
          <h2>이주의 이슈!!!</h2>
          <p>자세히 보기</p>
        </div>.
        <div class="slide_item item2"><img src="./images/tot2.jpg">
          <h2>이주의 팀!!!</h2>
          <p>자세히 보기</p>
        </div>
        <div class="slide_item item3"><img src="./images/arsenal.jpg">
          <h2>오늘의 팀!!!</h2>
          <p>자세히 보기</p>
        </div>
        <div class="slide_item item4"><img src="./images/ronaldo.jpg">
          <h2>오늘의 이슈!!!</h2>
          <p>자세히 보기</p>
        </div>
        <div class="slide_item item5"><img src="./images/messi.jpg">
          <h2>오늘의 이슈!!!</h2>
          <p>자세히 보기</p>
        </div>
        <div class="slide_item item6"><img src="./images/mbappe.jpg">
          <h2>오늘의 이슈!!!</h2>
          <p>자세히 보기</p>
        </div>
        <div class="slide_prev_button slide_button">◀</div>
        <div class="slide_next_button slide_button">▶</div>
      <ul class="slide_pagination"></ul>
    </div>
    <script src="./js/script.js"></script>
    <main>
      <div class="topmenu">
        <a href="#top"><img src="./images/up1.png" alt="맨위로"></a>
      </div>
    
    
    