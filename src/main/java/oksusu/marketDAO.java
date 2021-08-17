package oksusu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class marketDAO {
	Connection con; // 전역변수, 클래스 아래에 선언한 변수, 클래스 전체에서 접근하여 사용가능한 변수
	// 생성자 메서드, 생성자(constructor)
	// new키워드로 객체생성할 때 클래스이름과 동일한 메서드가 있으면 자동 호출되는 메서드
	// 객체 생성시 자동으로 꼭 해야하는 작업이 있는 경우, 이 생성자안에 넣어놓으면 무조건
	// 처리하게 할 수 있다.

	// 생성자
	public marketDAO() {
		try {
			// 자바와 db연결하는 프로그램(JDBC) 순서
			// 1. jdbc connector설정
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");

			// 2. java에서 db로 연결:
			// 연결할 주소url(ip, port, db명), username, password
			String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			con = DriverManager.getConnection(url, username, password);
			System.out.println("2. oksusu db연결 성공!!!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// CREATE
	public int create(marketDTO dto) {

		System.out.println("전달된 post_no는 " + dto.getPost_no());
		System.out.println("전달된 user_id는 " + dto.getUser_id());
		System.out.println("전달된 category는 " + dto.getCategory());
		System.out.println("전달된 title는 " + dto.getTitle());
		System.out.println("전달된 content는 " + dto.getContent());
		System.out.println("전달된 price는 " + dto.getPrice());
		System.out.println("전달된 image는 " + dto.getImage());
		System.out.println("전달된 tel는 " + dto.getTel());
		System.out.println("전달된 product_no는 " + dto.getProduct_no());
		System.out.println("전달된 product_name는 " + dto.getProduct_name());
		System.out.println("전달된 qty는 " + dto.getQty());
		int result = 0; // 메서드 안에서 선언된 변수는 모두 지역변수
						// 지역변수는 초기화를 해주어야한다.
		try {

			// 3. sql문을 만든다.
			// String sql = "insert into 테이블명 values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			String sql = "insert into market(user_id,category,title,content,price,image,tel,product_no,product_name,qty)values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			// String sql = "delete from member where id = 'win'";
			// PrepareStatment : sql을 나타내는 부품.
			// 부품을 램에 넣어놓은 주소만 잇으면 됨.
			// ps부품을 2단계에서 획득한 con부품이 만들어서 return.!
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getUser_id());
			ps.setString(2, dto.getCategory());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getPrice());
			ps.setString(6, dto.getImage());
			ps.setString(7, dto.getTel());
			ps.setInt(8, dto.getProduct_no());
			ps.setString(9, dto.getProduct_name());
			ps.setInt(10, dto.getQty());
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;

	}

	// UPDATE
	public int update(marketDTO dto) {

		System.out.println("전달된 post_no는 " + dto.getPost_no());
		System.out.println("전달된 user_id는 " + dto.getUser_id());
		System.out.println("전달된 category는 " + dto.getCategory());
		System.out.println("전달된 title는 " + dto.getTitle());
		System.out.println("전달된 content는 " + dto.getContent());
		System.out.println("전달된 price는 " + dto.getPrice());
		System.out.println("전달된 image는 " + dto.getImage());
		System.out.println("전달된 tel는 " + dto.getTel());
		System.out.println("전달된 product_no는 " + dto.getProduct_no());
		System.out.println("전달된 product_name는 " + dto.getProduct_name());
		System.out.println("전달된 qty는 " + dto.getQty());
		int result = 0; // 메서드 안에서 선언된 변수는 모두 지역변수
						// 지역변수는 초기화를 해주어야한다.
		try {

			// 3. sql문을 만든다.
			String sql = "update market set category = ?, title = ?, content = ?, price = ?, image = ?, tel = ?, product_no =?, product_name =?, qty =? where post_no = ?";
			// PrepareStatment : sql을 나타내는 부품.
			// 부품을 램에 넣어놓은 주소만 잇으면 됨.
			// ps부품을 2단계에서 획득한 con부품이 만들어서 return.!
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCategory());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getPrice());
			ps.setString(5, dto.getImage());
			ps.setString(6, dto.getTel());
			ps.setInt(7, dto.getProduct_no());
			ps.setString(8, dto.getProduct_name());
			ps.setInt(9, dto.getQty());
			ps.setInt(10, dto.getPost_no());
			//ps.setString(11, dto.getUser_id());
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;

	}

	// DELETE
	public void delete(marketDTO dto) {

		System.out.println("삭제된 post_no는 " + dto.getPost_no());

		try {

			// 3. sql문을 만든다.
			// String sql = "insert into 테이블명 values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			String sql = "delete from market where post_no = ? AND user_id =?";
			// String sql = "delete from member where id = 'win'";
			// PrepareStatment : sql을 나타내는 부품.
			// 부품을 램에 넣어놓은 주소만 잇으면 됨.
			// ps부품을 2단계에서 획득한 con부품이 만들어서 return.!
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getPost_no());
			ps.setString(2, dto.getUser_id());
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			int result = ps.executeUpdate();
			System.out.println("4. sql문 전송 전송");
			System.out.println(result);
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	 
	// READ all START
	public ArrayList<marketDTO> read() {

		ResultSet rs = null;

		// DTO를 넣을 컨테이너 역할을 하는 ArrayList를 만들어주어야 한다.
		ArrayList<marketDTO> list = new ArrayList<marketDTO>();
		try {
			// 3. sql문을 만든다.
			String sql = "select * from market";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			// result = ps.executeUpdate(); //CUD일때만 사용, read에선 사용x
			rs = ps.executeQuery();
			System.out.println("4. sql문 전송 전송");
			// System.out.println("검색된 결과는 " + rs.next());
			// rs.next() 한번하면 다음칸으로 내려가기 때문에 막아준다.
			while (rs.next()) {
				marketDTO bag2 = new marketDTO();
				System.out.println("검색 결과가 있음");
				bag2.setPost_no(rs.getInt(1));
				bag2.setUser_id(rs.getString(2));
				bag2.setCategory(rs.getString(3));
				bag2.setTitle(rs.getString(4));
				bag2.setContent(rs.getString(5));
				bag2.setPrice(rs.getInt(6));
				bag2.setImage(rs.getString(7));
				bag2.setTel(rs.getString(8));
				bag2.setProduct_no(rs.getInt(9));
				bag2.setProduct_name(rs.getString(10));
				bag2.setQty(rs.getInt(11));
				System.out.println(bag2);
				list.add(bag2);
				System.out.println(list.size());
			}
		} catch (SQLException e) {
			System.out.println("2-4번에러>>드라이버 없음!!!");
			e.printStackTrace();
		}
		return list;
	} // read END

	// READ 제목 START
		public ArrayList<marketDTO> read(marketDTO dto) {

			ResultSet rs = null;

			// DTO를 넣을 컨테이너 역할을 하는 ArrayList를 만들어주어야 한다.
			ArrayList<marketDTO> list = new ArrayList<marketDTO>();
			try {
				// 3. sql문을 만든다.
				String sql = "select * from market where title like";
				PreparedStatement ps = con.prepareStatement(sql + "'%" + dto.getTitle() + "%'");
				System.out.println("3. sql문 생성 성공!!!");
				// 4. sql문을 mysql로 전송한다.
				// result = ps.executeUpdate(); //CUD일때만 사용, read에선 사용x
				rs = ps.executeQuery();
				System.out.println("4. sql문 전송 전송");
				
				// System.out.println("검색된 결과는 " + rs.next());
				// rs.next() 한번하면 다음칸으로 내려가기 때문에 막아준다.
				while (rs.next()) {
					marketDTO bag2 = new marketDTO();
					System.out.println("검색 결과가 있음");
					bag2.setPost_no(rs.getInt(1));
					bag2.setUser_id(rs.getString(2));
					bag2.setCategory(rs.getString(3));
					bag2.setTitle(rs.getString(4));
					bag2.setContent(rs.getString(5));
					bag2.setPrice(rs.getInt(6));
					bag2.setImage(rs.getString(7));
					bag2.setTel(rs.getString(8));
					bag2.setProduct_no(rs.getInt(9));
					bag2.setProduct_name(rs.getString(10));
					bag2.setQty(rs.getInt(11));
					System.out.println(bag2);
					list.add(bag2);
					System.out.println(list.size());
				}
			} catch (SQLException e) {
				System.out.println("2-4번에러>>드라이버 없음!!!");
				e.printStackTrace();
			}
			return list;

		}
		// READ 아이디 START
		public ArrayList<marketDTO> read1(marketDTO dto) {

			ResultSet rs = null;

			// DTO를 넣을 컨테이너 역할을 하는 ArrayList를 만들어주어야 한다.
			ArrayList<marketDTO> list = new ArrayList<marketDTO>();
			try {
				// 3. sql문을 만든다.
				String sql = "select * from market where user_id =?";
				PreparedStatement ps = con.prepareStatement(sql);
				System.out.println("3. sql문 생성 성공!!!");
				ps.setString(1, dto.getUser_id());
				// 4. sql문을 mysql로 전송한다.
				// result = ps.executeUpdate(); //CUD일때만 사용, read에선 사용x
				rs = ps.executeQuery();
				System.out.println("4. sql문 전송 전송");
				
				// System.out.println("검색된 결과는 " + rs.next());
				// rs.next() 한번하면 다음칸으로 내려가기 때문에 막아준다.
				while (rs.next()) {
					marketDTO bag2 = new marketDTO();
					System.out.println("검색 결과가 있음");
					bag2.setPost_no(rs.getInt(1));
					bag2.setUser_id(rs.getString(2));
					bag2.setCategory(rs.getString(3));
					bag2.setTitle(rs.getString(4));
					bag2.setContent(rs.getString(5));
					bag2.setPrice(rs.getInt(6));
					bag2.setImage(rs.getString(7));
					bag2.setTel(rs.getString(8));
					bag2.setProduct_no(rs.getInt(9));
					bag2.setProduct_name(rs.getString(10));
					bag2.setQty(rs.getInt(11));
					System.out.println(bag2);
					list.add(bag2);
					System.out.println(list.size());
				}
			} catch (SQLException e) {
				System.out.println("2-4번에러>>드라이버 없음!!!");
				e.printStackTrace();
			}
			return list;

		}
		//READ POST_NO VIEW START
		public marketDTO read2(marketDTO dto) {
			//메서드 안에서 만들어진 변수
			//변수는 변수선언할 때 만들어짐
			//선언의 위치가 변수의 생존범위를 결정함.
			//파라미터는 지역변수이다. 이 지역을 벗어나서는 사용불가능.
			//지역변수는 자동초기화안된다. 쓰레기값 들어있는 상태
			System.out.println("전달된 post_no는 " + dto.getPost_no());
			System.out.println("전달된 user_id는 " + dto.getUser_id());
			System.out.println("전달된 category는 " + dto.getCategory());
			System.out.println("전달된 title는 " + dto.getTitle());
			System.out.println("전달된 content는 " + dto.getContent());
			System.out.println("전달된 price는 " + dto.getPrice());
			System.out.println("전달된 image는 " + dto.getImage());
			System.out.println("전달된 tel는 " + dto.getTel());
			System.out.println("전달된 product_no는 " + dto.getProduct_no());
			System.out.println("전달된 product_name는 " + dto.getProduct_name());
			System.out.println("전달된 qty는 " + dto.getQty());
			ResultSet rs = null;
			
			marketDTO dto2 = new marketDTO();
			 try {
				
				  //3. sql문을 만든다.
				  String sql = "select * from market where post_no = ? ";
				  //String sql = "select * from member";
				  //PrepareStatment : sql을 나타내는 부품.
				  //부품을 램에 넣어놓은 주소만 잇으면 됨.
				  //ps부품을 2단계에서 획득한 con부품이 만들어서 return.!
				  PreparedStatement ps = con.prepareStatement(sql);
				  ps.setInt(1, dto.getPost_no());
				  System.out.println("3. sql문 생성 성공!!!");
//		      String url = "http://www.naver.com";
//		      URL u = new URL(url);
//		      String file = "c:/temp/test.txt";
//		      File file2 = new File(file);
				  
				  //4. sql문을 mysql로 전송한다.
				  //result = ps.executeUpdate();	//CUD일때만 사용, read에선 사용x
				  rs = ps.executeQuery();
				  System.out.println("4. sql문 전송 전송");
				  //System.out.println("검색된 결과는 " + rs.next());
				  //rs.next() 한번하면 다음칸으로 내려가기 때문에 막아준다.
				  if (rs.next()) {
					  System.out.println("검색 결과가 있음");
					  int post_no = rs.getInt(1);
					  String user_id = rs.getString(2);	//a를 가져옴//rs.getString("컬럼명"); 도 가능.
					  String category = rs.getString(3);	//a
					  String title = rs.getString(4);	//a
					  String content = rs.getString(5);	//a
					  int price = rs.getInt(6);	//a
					  String image = rs.getString(7);	//a
					  String tel = rs.getString(8);	//a
					  int product_no = rs.getInt(9);	//a
					  String product_name = rs.getString(10);	//a
					  int qty = rs.getInt(11);	//a

					  dto2.setPost_no(post_no);
					  dto2.setUser_id(user_id);
					  dto2.setCategory(category);
					  dto2.setTitle(title);
					  dto2.setContent(content);
					  dto2.setPrice(price);
					  dto2.setImage(image);
					  dto2.setTel(tel);
					  dto2.setProduct_no(product_no);
					  dto2.setProduct_name(product_name);
					  dto2.setQty(qty);
				}
				  else {
					System.out.println("검색 결과가 없음");
				}
			} catch (SQLException e) {
				System.out.println("2-4번에러>>드라이버 없음!!!");
				e.printStackTrace();
			}
			 return dto2;
		}	//read END
		}
