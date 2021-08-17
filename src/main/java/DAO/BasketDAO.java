package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.BasketDTO;

public class BasketDAO {

	public int create(BasketDTO dto) {
		System.out.println("C전달된 user_id는 " + dto.getUser_id());	
		System.out.println("전달된 product_no는 " + dto.getProduct_no());	
		System.out.println("전달된 product_name는 " + dto.getProduct_name());	
		System.out.println("전달된 qty는 " + dto.getQty());	
		System.out.println("전달된 price는 " + dto.getPrice());	
		int result=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");
			String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. oksusu db연결 성공!!!");
			String sql = "insert into basket(user_id, product_no, product_name, qty, price) values(?, ?, ?, ?,?);";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getUser_id());
			ps.setInt(2, dto.getProduct_no());
			ps.setString(3, dto.getProduct_name());
			ps.setInt(4, dto.getQty());
			ps.setInt(5, dto.getPrice());
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

	public int delete(BasketDTO dto) {
		System.out.println("D전달된 user_id는 " + dto.getUser_id());	
		int result=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");
			String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. oksusu db연결 성공!!!");
			String sql = "delete from basket where user_id= ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getUser_id());
			System.out.println("3. sql문 생성 성공!!!");
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result);
		} catch (ClassNotFoundException e) {//1단계,클래스가 없으면 어떡할래?
			System.out.println("1번에러 >> 드라이버없음!");
		} catch (SQLException e) {//2-4단계, SQL문과 관련되서 문제있으면 어떡할래?
			System.out.println("2-4번에러 >> DB관련된 처리하다 에러발생!");
		}
		return result;
		}
	
	public int delete2(BasketDTO dto) {
		System.out.println("D2전달된 basket_no는 " + dto.getBasket_no());	
		int result=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");
			String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. oksusu db연결 성공!!!");
			String sql = "delete from basket where basket_no= ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getBasket_no());
			System.out.println("3. sql문 생성 성공!!!");
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result);
		} catch (ClassNotFoundException e) {//1단계,클래스가 없으면 어떡할래?
			System.out.println("1번에러 >> 드라이버없음!");
		} catch (SQLException e) {//2-4단계, SQL문과 관련되서 문제있으면 어떡할래?
			System.out.println("2-4번에러 >> DB관련된 처리하다 에러발생!");
		}
		return result;
		}

	

	public ArrayList<BasketDTO> read(String user_id) {
		System.out.println("R전달된 user_id는 " + user_id);
		ResultSet rs = null;
		ArrayList<BasketDTO> list = new ArrayList<>();	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");
			String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. oksusu db연결 성공!!!");
			String sql = "select * from basket where user_id= ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
			System.out.println("3. sql문 생성 성공!!!");

			rs = ps.executeQuery();
			System.out.println("4. sql문 전송 전송");

			while (rs.next()) {
				System.out.println("검색 결과가 있음!");
				BasketDTO dto = new BasketDTO();
				int basket_no = rs.getInt(1);
				String user_id2 = rs.getString(2);
				int product_no = rs.getInt(3);
				String product_name = rs.getString(4);
				int qty = rs.getInt(5);
				int price = rs.getInt(6);
				
				dto.setBasket_no(basket_no);
				dto.setUser_id(user_id2);
				dto.setProduct_no(product_no);
				dto.setProduct_name(product_name);
				dto.setQty(qty);
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
	

}
