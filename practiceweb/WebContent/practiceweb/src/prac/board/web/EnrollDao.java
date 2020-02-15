package prac.board.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class EnrollDao {


	/*static {
		try {
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver()); 
		System.out.println(" 드라이버 로드 성공 "); }catch (SQLException e) { 
			System.out.println(e.getMessage()); } }
	
	
	private Connection getConnection() {
		DataSource ds = null; Connection con = null;
		try { Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle");
		con = ds.getConnection(); }catch(Exception e) {
			e.printStackTrace(); } return con; }
	
	
	private void closeConnection (Connection con) { 
		if(con!=null) { try { con.close(); }catch(Exception e) {} } }*/
	
	
	//------------------------------------------------------------------------------------------------------------
	
	private Connection getConnection() throws SQLException {
		DataSource ds = null; Connection con = null;
		
		
	//	Connection connection = DriverManager.getConnection("jdbc:mariadb://localhost:3307/DB?user=root&password=staris");
		try { 
		//	Context ctx = new InitialContext();
//	ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mariadb");//*****************************************************
	//	con = ds.getConnection();
			 Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test?characterEncoding=UTF-8","root","staris");
		}catch(Exception e) {
			e.printStackTrace(); } return con; }
	
	
	private void closeConnection (Connection con) { 
		if(con!=null) { try { con.close(); }catch(Exception e) {} } }
//---------------------------------------------------------------------------------------------------------------------
	
	public String insertcourse(String cid,int cno,String sid,int unit, int m) {

		int unit2=0;
		int cidno2=0;
		
		String name2=null;
		String name3=null;
		int cno2[]=new int[20];
		Connection con = null; try { 
			con = getConnection();
			
			
			String sql = "select c_unit, c_id_no from course where c_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, cid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { 
				unit2=rs.getInt("c_unit");
				cidno2=rs.getInt("c_id_no");
				System.out.println(unit2);

			if(unit+unit2>18) {
				String message="최대 학점(18학점)을 넘었습니다";return message;
			}

			}
						
			
			 sql = "select c_id_no from enroll where s_id=?";
			 pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, sid);
				rs = pstmt.executeQuery();
				int i=0;
				
				while(rs.next()) { System.out.println("dddd");
					cno2[i]=rs.getInt("c_id_no");i++;
					System.out.println(cno2[i-1]+"되나???? ");
					}
				
			for(int j=0;j<i;j++) {System.out.println("포문 도나???");
				if(cno2[j]==cidno2) {System.out.println("들어왔나?");
					String message="동일 교과목을 이미 수강신청 했습니다";return message;
				}
			}
			
			
			
			
			int max=0;
			int count=0;
			
			 sql = "select max from course where c_id=?";
			 pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, cid);
				rs = pstmt.executeQuery();
				i=0;
				
				if(rs.next()) { System.out.println("amx");
					max=rs.getInt("max");
					System.out.println(max+"max되나???? ");
					}
				
				
				
			 sql = "select count(s_id) from enroll where c_id=?";
			 pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, cid);
				rs = pstmt.executeQuery();
				
				
				if(rs.next()) { System.out.println("count");
					count=rs.getInt(1);
					System.out.println(count+"count되나???? ");
					}
				
				if (count>=max) {
					String name[]=new String[20];
					int mil[]=new int[20];
					i=0;
					 sql = "select s_id from enroll where c_id=?";
					 pstmt = con.prepareStatement(sql); 
						pstmt.setString(1, cid);
						rs = pstmt.executeQuery();
						while(rs.next()) { 
							System.out.println("student가져오기");
						name[i]=rs.getString("s_id");

						System.out.println(name[i]+"sid되나???? ");
						i++;
						}

						
						
						
						
						
						
						
					String message="정원을 넘어섰고 배팅 실패했습니다";
					return message;
				}
					

		 sql = "insert into enroll values(?,?,?,?,?)";
		 pstmt = con.prepareStatement(sql); 
		pstmt.setString(1, sid);
		pstmt.setString(2, cid);
		int year=0, sem=0;
		pstmt.setInt(3, cno);	
		pstmt.setInt(4, year);
		pstmt.setInt(5, sem);
		
	
	
	 pstmt.executeQuery(); }
		
		
		
		
		
		
		
		catch(Exception e) {
			throw new RuntimeException("EnrollDao.insertcourse() :" + e.getMessage()); }finally { closeConnection(con); }

		
		
		
		return "";
	}
	public void delete(String cno,String sid,String cname,String cid) {
		String sql="";
		Connection con = null;
		try {
			con =getConnection();
			sql="delete from enroll where c_id=? and s_id=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setString(2,sid);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException("Enrolldao.delete: "+ e.getMessage());
			
			// TODO: handle exception
		}finally {
			closeConnection(con);             
		}
	}
	
	public String[] getCouse() {
		String name[] = null;
		int i=0;
		
		 Connection con = null; try {
				con = getConnection(); 
				String sql = "select c_name from couse";
				PreparedStatement pstmt = con.prepareStatement(sql); 
				
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) { 
					name[i] = rs.getString("c_name"); i++;
					}else {
					throw new RuntimeException("강좌가 존재하지 않습니다"); } }catch(Exception e) {
						
				throw new RuntimeException("CourseDao.getCourse : " + e.getMessage()); 
				}finally { closeConnection(con); } 
		 String[]name2=new String[i];
		 for(int j=0;j<i;j++) {
			 name2[j]=name[j];
		 }
		 
			return name2; 
	}
	
	
	
}
