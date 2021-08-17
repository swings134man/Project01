package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.BasketDTO;
import DTO.DeliveryDTO;
import DTO.PaymentDTO;

public class PaymentDAO {

	public ArrayList<PaymentDTO> read(String user_id) {
		System.out.println("R전달된 user_id는 " + user_id);
		ResultSet rs = null;
		ArrayList<PaymentDTO> list = new ArrayList<>();	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");
			String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. oksusu db연결 성공!!!");
			String sql = "select * from payment where user_id= ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
			System.out.println("3. sql문 생성 성공!!!");

			rs = ps.executeQuery();
			System.out.println("4. sql문 전송 전송");

			while (rs.next()) {
				System.out.println("검색 결과가 있음!");
				PaymentDTO dto = new PaymentDTO();
				int payment_no = rs.getInt(1);
				String user_id2 = rs.getString(2);
				String product_name = rs.getString(3);
				int price = rs.getInt(4);
				
				dto.setPayment_no(payment_no);
				dto.setUser_id(user_id2);
				dto.setProduct_name(product_name);
				dto.setPrice(price);
				
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
	
	public int create (PaymentDTO dto) {
		System.out.println("결제추가>>전달된 user_id는 " + dto.getUser_id());	
		System.out.println("결제추가>>전달된 Product_name는 " + dto.getProduct_name());	
		System.out.println("결제추가>>전달된 Price는 " + dto.getPrice());	
		int result=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");
			String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. oksusu db연결 성공!!!");
			String sql = "insert into payment(user_id, pcoduct_name, price) values ( ?, ?, ?);";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getUser_id());
			ps.setString(2, dto.getProduct_name());
			ps.setInt(3, dto.getPrice());
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
	

}
