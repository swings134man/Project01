package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.DeliveryDTO;

public class DeliveryDAO {
	

	public int create (DeliveryDTO dto) {
		System.out.println("배송지추가>>전달된 user_id는 " + dto.getUser_id());	
		System.out.println("배송지추가>>전달된 dName는 " + dto.getdName());	
		System.out.println("배송지추가>>전달된 dTel는 " + dto.getdTel());	
		System.out.println("배송지추가>>전달된 dAeeress는 " + dto.getdAddress());	
		int result=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");
			String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. oksusu db연결 성공!!!");
			String sql = "insert into delivery(user_id, dName, dTel, dAddress) values (?, ?, ?, ?);";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getUser_id());
			ps.setString(2, dto.getdName());
			ps.setString(3, dto.getdTel());
			ps.setString(4, dto.getdAddress());
			System.out.println("3. sql문 생성 성공!!!");
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result);
		} catch (ClassNotFoundException e) {// 1단계,클래스가 없으면 어떡할래?
			System.out.println("1번에러 >> 드라이버없음!");
		} catch (SQLException e) {// 2-4단계, SQL문과 관련되서 문제있으면 어떡할래?
			System.out.println("2-4번에러 >> DB관련된 처리하다 에러발생!");
			e.printStackTrace();
		}
		return result;
	}


	
	public ArrayList<DeliveryDTO> read(String user_id) {
		System.out.println("배송지Read 전달된 user_id는 " + user_id);
		ResultSet rs = null;
		ArrayList<DeliveryDTO> list = new ArrayList<>();	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");
			String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. oksusu db연결 성공!!!");
			String sql = "select delivery_no, user_id, dName, dTel, dAddress from delivery where user_id=?;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
			System.out.println("3. sql문 생성 성공!!!");

			rs = ps.executeQuery();
			System.out.println("4. sql문 전송 전송");

			while (rs.next()) {
				System.out.println("검색 결과가 있음!");
				DeliveryDTO dto = new DeliveryDTO();
				
				int delivery_no = rs.getInt(1);
				String user_id2 = rs.getString(2);
				String dName = rs.getString(3);
				String dTel = rs.getString(4);
				String dAddres = rs.getString(5);
				//int dDefalt2 = rs.getInt(6);
				
				dto.setDelivery_No(delivery_no);
				dto.setUser_id(user_id2);
				dto.setdName(dName);
				dto.setdTel(dTel);
				dto.setdAddress(dAddres);
				//dto.setdDefalt(dDefalt2);
				
				list.add(dto);

			} 

		} catch (ClassNotFoundException e) {// 1단계,클래스가 없으면 어떡할래?
			System.out.println("1번에러 >> 드라이버없음!");
			e.printStackTrace();// 에러정보 자세하게 알려주는 코드
		} catch (SQLException e) {// 2-4단계, SQL문과 관련되서 문제있으면 어떡할래?
			System.out.println("2-4번에러 >> DB관련된 처리하다 에러발생!");
			e.printStackTrace();// 에러정보 자세하게 알려주는 코드
		}
		System.out.println(list.size());
		return list;
	}

}
