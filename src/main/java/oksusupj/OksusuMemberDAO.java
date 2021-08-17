package oksusupj;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class OksusuMemberDAO {
	
	Connection con;
	
	public OksusuMemberDAO() {
		super();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");
			String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			con = DriverManager.getConnection(url, username, password);
			System.out.println("2. oksusu db연결 성공!!!");		
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	
	public int create(OksusuMemberDTO memberDTO) {

		int result = 0; 
		try {
			String sql = "insert into member values (?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberDTO.getmemberId());
			ps.setString(2, memberDTO.getmemberPw());
			ps.setString(3, memberDTO.getmemberName());
			ps.setString(4, memberDTO.getmemberBusinees());
			ps.setString(5, memberDTO.getmemberAddress());
			ps.setString(6, memberDTO.getmemberTel());
		
			System.out.println("3. sql문 생성 성공!!!");
		
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result);
	} catch (SQLException e) {
		System.out.println("2~4번 에러>> DB관련 처리 에러");
		e.printStackTrace();
	}
		return result;
	}//creat 닫기
	
	public int update(OksusuMemberDTO memberDTO) {

		int result = 0;
	   try {
		
			String sql = "update member set memberId = ?, memberPw = ?, memberName = ?, memberBusiness = ?,memberAddress = ?, memberTel = ? where memberId = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberDTO.getmemberId());
			ps.setString(2, memberDTO.getmemberPw());
			ps.setString(3, memberDTO.getmemberName());
			ps.setInt(4, 0);
			ps.setString(5, memberDTO.getmemberAddress());
			ps.setString(6, memberDTO.getmemberTel());
			ps.setString(7, memberDTO.getmemberId());
			System.out.println("3. sql문 생성 성공!!!");
		
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result);
		} catch (SQLException e) {
			System.out.println("2~4번 에러>> DB관련 처리 에러");
			e.printStackTrace();
		}
		return result;
		
	}


	
	public OksusuMemberDTO read(OksusuMemberDTO dto) {
		
		OksusuMemberDTO dto2 = new OksusuMemberDTO();
		ResultSet rs = null; 
	   try {
			String sql = "select * from member where memberId= ?"; 
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getmemberId());
			System.out.println("3. sql문 생성 성공!!!");
		
			rs = ps.executeQuery();
			System.out.println("4. sql문 전송 전송");
			if(rs.next()) {
				System.out.println("검색결과가 있음");
				dto2.setmemberId(rs.getString(1));
				dto2.setmemberPw(rs.getString(2));
				dto2.setmemberBusinees((rs.getString(4)));
			} else {
				System.out.println("검색결과가 없음");
			}
	}  catch (SQLException e) {
		System.out.println("2~4번 에러>> DB관련 처리 에러");
		e.printStackTrace();
	}
	   return dto2;
	}//read 닫기



public int delete(OksusuMemberDTO memberDTO) {

	int result = 0;
	
   try {

		String sql = "delete from member where memberId = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDTO.getmemberId());
		
	
		System.out.println("3. sql문 생성 성공!!!");
		System.out.println(memberDTO.getmemberId());
		result = ps.executeUpdate();
		System.out.println("4. sql문 전송 전송");
		System.out.println(result);

   } catch (SQLException e) {
	System.out.println("2~4번 에러>> DB관련 처리 에러");
	e.printStackTrace();
   }

	return result;
}
}