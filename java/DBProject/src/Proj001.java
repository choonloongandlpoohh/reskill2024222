import java.sql.*;

public class Proj001 
{
	public static void main(String[] args)
	{		
		// 접속할 주소
		String url = "jdbc:postgresql://127.0.0.1:43432/testdb";

		// DBMS의 사용자 이름
		String user = "scott";
		
		// 위 사용자 이름에 대한 비밀번호.
		String pwd = "0000";
		
		// 연결을 위한 변수 
		Connection con = null;
		
		// 쿼리를 실행하는 Statement 변수
		Statement stmt = null;
		
		// 결과를 받아올 변수 (select쿼리를 실행한 결과를 받아서 저장)
		ResultSet rs = null;
		
		// 시도한다. 이 try {} 안에서 실행을 시도하다가 문제가 생기면 catch {} 로 간다.
		try
		{
			// postgresql JDBC를 읽어들인다.
			Class.forName("org.postgresql.Driver");
			
			// DBMS와 연결한다. url: 접속할 서버. user: DBMS 사용자 계정, pwd: user의 비밀번호
			con = DriverManager.getConnection(url, user, pwd);
	        
			// DBMS에 쿼리할 준비를 한다.
			stmt = con.createStatement();

			// 실행할 쿼리문
			String query = "select * from books where author like '%교육지원실장%'"; // 조회
	
			// 쿼리를 실행한 결과를 rs로 받는다.
			rs = stmt.executeQuery(query); // (DB의 자료를 읽어오기 위해 Statement클래스에서 제공하는 함수)

			// rs에 다음 자료가 있을 때까지 실행한다.
			while (rs.next())
			{
				// DBMS에서 가져온 결과를 보여준다.
				System.out.println(rs.getString("ID") + ". " + rs.getString("name"));
				// String strID = rs.getString("ID");
				// String strName = rs.getString("name");
				// System.out.println(strID + ". " + strName);
				
				String publisher = rs.getString("publisher"); // 변수로 선언할 수 있음
				String author = rs.getString("author");
				System.out.println(rs.getString("ID") + " | " + rs.getString("name") + " | " + publisher + " | " + author + " | " + rs.getString("price"));
			}                               

			// 다 사용했으면 결과를 닫는다.
			rs.close();

			// 쿼리를 위한 Statement를 닫는다.
			stmt.close();

			// 연결을 닫는다.
			con.close();
		}		
		catch(Exception ex)		// 위 try{} 에서 문제가 발생하면 이 안으로 들어온다.
		{
			// 에러 내용을 보여준다.
			System.out.println("err: " + ex.toString());
		}
	}
};