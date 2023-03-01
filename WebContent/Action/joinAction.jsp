<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
		<!-- ȸ������ �׼� ������ -->
<%
	request.setCharacterEncoding("UTF-8");
	//�ѱ۱��� ����
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String host   = "jdbc:mysql://127.0.0.1:3306/soccer_db?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
	//boarddb ��ġ ����
	String userid = "root";
	//db ���Ӱ����� ���̵�
	String userpw = "1234";
	//db ���Ӱ����� �н�����
	Connection conn = null; 		
	//���� �ʱ�ȭ
	PreparedStatement psmt = null;  
	//���� �ʱ�ȭ PreparedStatement:���ڿ� ���õ� �۾��� Ưȭ(�Ű�����), �ؽ�Ʈ SQLȣ��
	ResultSet rs = null; 			
	//rs�� �������� ��µ� �̿� �ʱ�ȭ
	
	String mId = request.getParameter("mId");			//uId�� �޾ƿ� �Ķ��Ÿ uId���� �ִ´�. 
	String mPw = request.getParameter("mPw");			//uPw�� �޾ƿ� �Ķ��Ÿ uPw���� �ִ´�.
	String mPwh = request.getParameter("mPwh");			//uPwh�� �޾ƿ� �Ķ��Ÿ uPwh���� �ִ´�.
	String mName = request.getParameter("mName");		//uName�� �޾ƿ� �Ķ��Ÿ uName���� �ִ´�.
	String mEmail = request.getParameter("mEmail");		//uEmail�� �޾ƿ� �Ķ��Ÿ uEmail���� �ִ´�.
	
	
	try
	{
		conn = DriverManager.getConnection(host,userid,userpw);
		//DB�� �����ϱ� ���� �۾�, host, userid, userpw �� Ȯ���� DB�� ���� �����Ѵ�.
		String sql = "";
		//sql �ʱ�ȭ
		sql += "select mId, mName from soccer_db.ujoin ";
		// soccer_db�̶�� DB���ִ� join�̶�� ���̺��� mId, mName�÷��� �����ϴ°�
		sql += "where mId = ? or mName = ? ";
		// uId�� uName�� ���� ���� ?�� ���� �Է¹��� ���� ������
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1,mId);		//join.jsp���� �Է¹޾� �Ѿ�� mId���� �ִ°�
		psmt.setString(2,mName);	//join.jsp���� �Է¹޾� �Ѿ�� mName���� �ִ°�

		rs = psmt.executeQuery();
		//DB�� ���� �Է½�Ű�� ��ȯ�� �޾ƾ� �Ҷ� ����ϴ� ������
		
		if(rs.next())
		{
			psmt.close();
			conn.close();
		%>
					<!-- ȭ�鿡 ������ ���â�� �����̵� ��Ű�� �۾� -->
			<script>
				alert("�ߺ��� ���̵�ų� �ߺ��� �г����Դϴ�.");
				location.href="../join.jsp";
			</script>
		<%
				
		}
		
		sql = "";
		//sql �ʱ�ȭ
		sql += "insert into soccer_db.ujoin ";		
		//ujoin�̶��DB���ִ� ujoin�̶�� ���̺� �������̴�
		sql += "(mId,mPw,mPwh,mName,mEmail) ";
		//� �÷��� �������� �÷��� �߰�!!
		sql += "value (?,?,?,?,?) ";
		// �Է¹��� ���� �־�����ϱ⶧���� ?�� ���
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, mId);
		psmt.setString(2, mPw);
		psmt.setString(3, mPwh);
		psmt.setString(4, mName);
		psmt.setString(5, mEmail);
		//���� �Է¹��� ���� DB�� �Է��ϱ�
		psmt.executeUpdate();
		//DB�� ���� �Է¸��ϰ� ��ȯ�� �ʿ������ ���Ǵ� ������
		
		%>
						<!-- ���ԿϷ� ����â�� �Բ� ������������ �̵���Ű�� ���� -->
			<script>
				alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
				location.href="../index.jsp";
			</script>
		<%
	}catch(Exception e)
	{
		e.printStackTrace();
	}finally
	{
		//��ü�� �ݾ������ ��!!!
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
	
%>


