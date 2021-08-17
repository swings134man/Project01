
package bbs1.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import bbs1.dto.BbsDTO2;

public class BbsDAO2 {

	// 죄회수 업데이트 //
	 public void updateA(BbsDTO2 bag) throws Exception {
	      Class.forName("com.mysql.jdbc.Driver");
//	      System.out.println("1. connector 연결성공!!");
	     
	      String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "1234";
	      Connection con = DriverManager.getConnection(url, user, password);
//	      System.out.println("2. db 연결성공!");

	      String sql = "update accident set a_fav= ? where a_num = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	   
	      ps.setInt(1, bag.getFav() + 1);
	      ps.setInt(2, bag.getNum());
//	      System.out.println("3. SQL문 연결성공!!");
//	      System.out.println("된다!!");
//	      System.out.println(bag.getFav());
//	      System.out.println(bag.getNum());
	      ps.executeUpdate();
//			System.out.println(result);
	   }//update end
	
	 
	// 공감 수 업데이트 
	 public void updateALike(BbsDTO2 bag) throws Exception {
	      Class.forName("com.mysql.jdbc.Driver");
	
	      String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "1234";
	      Connection con = DriverManager.getConnection(url, user, password);
	      String sql = "update accident set a_onoff= ?, a_like= ? where a_num = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setInt(1, bag.getOnoff() + 1);
	      ps.setInt(2, bag.getLike() + 1);
	      ps.setInt(3, bag.getNum());
	      ps.executeUpdate();
//	      int result = ps.executeUpdate();

	   }//update end
	
	 public void updateH(BbsDTO2 bag) throws Exception {
	      Class.forName("com.mysql.jdbc.Driver");
	      String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "1234";
	      Connection con = DriverManager.getConnection(url, user, password);
	      String sql = "update hobby set h_fav= ? where h_num = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setInt(1, bag.getFav() + 1);
	      ps.setInt(2, bag.getNum());
	      ps.executeUpdate();
//	    
	   }//update end
	
	 public void updateHLike(BbsDTO2 bag) throws Exception {
	      Class.forName("com.mysql.jdbc.Driver");
	
	      String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "1234";
	      Connection con = DriverManager.getConnection(url, user, password);
	      String sql = "update hobby set h_onoff= ?, h_like= ? where h_num = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setInt(1, bag.getOnoff() + 1);
	      ps.setInt(2, bag.getLike() + 1);
	      ps.setInt(3, bag.getNum());
	      ps.executeUpdate();

	   }//update end
	 
	 public void updateQ(BbsDTO2 bag) throws Exception {
	      Class.forName("com.mysql.jdbc.Driver");
	      String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "1234";
	      Connection con = DriverManager.getConnection(url, user, password);
	      String sql = "update question set q_fav= ? where q_num = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setInt(1, bag.getFav() + 1);
	      ps.setInt(2, bag.getNum());
	      ps.executeUpdate();
//	    
	   }//update end
	
	 public void updateQLike(BbsDTO2 bag) throws Exception {
	      Class.forName("com.mysql.jdbc.Driver");
	
	      String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "1234";
	      Connection con = DriverManager.getConnection(url, user, password);
	      String sql = "update question set q_like= ?, q_onff= ?  where q_num = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setInt(1, bag.getLike() + 1);
	      ps.setInt(2, bag.getOnoff() + 1);
	      ps.setInt(3, bag.getNum());
	      ps.executeUpdate();

	   }//update end
	  
	 public void updateD(BbsDTO2 bag) throws Exception {
	      Class.forName("com.mysql.jdbc.Driver");
	      String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "1234";
	      Connection con = DriverManager.getConnection(url, user, password);
	      String sql = "update daily set d_fav= ? where d_num = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setInt(1, bag.getFav() + 1);
	      ps.setInt(2, bag.getNum());
	      ps.executeUpdate();
//	    
	   }//update end
	
	 public void updateDLike(BbsDTO2 bag) throws Exception {
	      Class.forName("com.mysql.jdbc.Driver");
	
	      String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "1234";
	      Connection con = DriverManager.getConnection(url, user, password);
	      String sql = "update daily set d_like= ?, d_onoff= ? where d_num = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setInt(1, bag.getLike() + 1);
	      ps.setInt(2, bag.getOnoff() + 1);
	      ps.setInt(3, bag.getNum());
	      ps.executeUpdate();

	   }//update end
	 
	 public void updateAmodi(BbsDTO2 bag) throws Exception {
	      Class.forName("com.mysql.jdbc.Driver");
	
	      String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "1234";
	      Connection con = DriverManager.getConnection(url, user, password);
	      String sql = "update accident set a_title= ?, a_contents= ? where a_num = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setString(1, bag.getTitle());
	      ps.setString(2, bag.getContents());
	      ps.setInt(3, bag.getNum());

	      ps.executeUpdate();
	 }
	    
	 public void deleteAccident(BbsDTO2 bag) throws Exception {
	      Class.forName("com.mysql.jdbc.Driver");
	
	      String url = "jdbc:mysql://localhost:3306/oksusu?useUnicode=true&characterEncoding=utf8";
	      String user = "root";
	      String password = "1234";
	      Connection con = DriverManager.getConnection(url, user, password);
	      String sql = "delete from accident where a_num = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setInt(1, bag.getNum());

	      ps.executeUpdate();
	 }
	 
}