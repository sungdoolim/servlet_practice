package prac.board.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;



public class MemberDao {
/*	static {
		try {
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver()); 
		System.out.println(" 드라이버 로드 성공 "); }catch (SQLException e) { 
			System.out.println(e.getMessage()); } }
	*/
	
	private Connection getConnection() {
		DataSource ds = null; Connection con = null;
		try {
		//	Context ctx = new InitialContext();
	//	ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mariadb");//*****************************************************
	//	con = ds.getConnection();
			 Class.forName("org.mariadb.jdbc.Driver");

		con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test?characterEncoding=UTF-8","root","staris");

		
		System.out.println("된거아님?");
		}catch(Exception e) {
			e.printStackTrace(); 
			System.out.println("이건 실패가 확실...");} 
		
		
		return con; }
	
	
	private void closeConnection (Connection con) { 
		if(con!=null) { try { con.close(); }catch(Exception e) {} } }
	
	
	
	public MemberVO selectMem(String name) {
		Connection con = null;
		MemberVO mem=new MemberVO();
		try {
			con =getConnection();
			String sql="select s_id,s_pwd from student where s_name =?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
	
			stmt.executeQuery();
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				mem.setName(rs.getString(1));
				mem.setPassword(rs.getString(2));
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("MemDAO.selectMem() :"+ e.getMessage());
		}finally {
			closeConnection(con);
		}
	return mem;}

	
	public String updateMember(MemberVO member,String p) { //아이디를 받으면 나머지를 바꾸는 것이었음...띠로리.....

		String pw=member.getPassword();
		if(pw.length()<4) {
			String message="password는 4자리 이상이어야 합니다";
			return message;
		}
		for(int i=0;i<pw.length();i++) {
			if(pw.charAt(i)==' ') {
				String message="password는 공백입력이 불가능 합니다";
				return message;
			}
		}
		Connection con = null;
		try {
	/*	Connection con = null;
		String pp[] = new String[10];
		int i=0;
		int ii=-1;
		
		try {
			System.out.println("1번");
			con = getConnection();

			if(p.equals("yes")) {

				System.out.println("yes들어오고");
				con = getConnection(); 
				String sql = "select p_id from professor";
				PreparedStatement pstmt = con.prepareStatement(sql); 
				ResultSet rs = pstmt.executeQuery();
				try{
					while(rs.next()) { 
				
				System.out.println(i);
					pp[i] = rs.getString("p_id"); 
					System.out.println(pp[i]);
					i++;
					}
				}catch(Exception e) {System.out.println("error");
				e.printStackTrace();
					throw new RuntimeException("교수님이 없습니다"); }
				closeConnection(con);
				
				ii=(int)(i*Math.random());
				
			}
			System.out.println("ii="+ii);
			for(int k=0;k<i;k++) {
				System.out.println(pp[k]);
			}*/
		
		
			con = getConnection();
			String sql = "update student set s_college=?, s_addr=?, s_name=?," + " s_pwd=? where s_id=?"; 
			//String sql2 = "update student set s_college=?, s_addr=?, s_name=?," + " s_pwd=?, p_id=? where s_id=?"; 
			PreparedStatement pstmt;
			/*if(ii<0) {
				 pstmt = con.prepareStatement(sql); 
					pstmt.setString(1, member.getCollege()); 
					pstmt.setString(2, member.getAddress()); 
					pstmt.setString(3, member.getName()); 
					pstmt.setString(4, member.getPassword()); 
					pstmt.setString(5, member.getId()); 
			}
			else {*/
			
			// pstmt = con.prepareStatement(sql2); 
			 pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, member.getCollege()); 
				pstmt.setString(2, member.getAddress()); 
				pstmt.setString(3, member.getName()); 
				pstmt.setString(4, member.getPassword()); 
				// pstmt.setString(5, pp[ii]); 
				pstmt.setString(5, member.getId()); 
			//}
			

			pstmt.executeUpdate(); }catch(SQLException e) {
		e.printStackTrace(); 
		throw new RuntimeException("MemberDAO.updateMember() : "+e.getMessage()); 
		}finally { 
			closeConnection(con);
			return " ";
			} }
	

public String getpw(String id) {
		
		
		String pw = ""; Connection con = null; try {
			con = getConnection(); 
			String sql = "select s_pwd from student where s_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { 
				pw = rs.getString("s_pwd"); 
				}else {
				//throw new RuntimeException("아이디가 존재하지 않습니다");
					String message="아이디가 없습니다";return message;
				} }catch(Exception e) {
					
			throw new RuntimeException("MemberDAO.getPassword : " + e.getMessage()); 
			}finally { closeConnection(con); } 
		return pw; 
		
	}
	

public String getname(String id) {
	String name="";
	
	 Connection con = null; try {
			con = getConnection(); 
			String sql = "select s_name from student where s_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { 
				name = rs.getString("s_name"); 
				}else {
				throw new RuntimeException("아이디가 존재하지 않습니다"); } }catch(Exception e) {
					
			throw new RuntimeException("MemberDAO.getname : " + e.getMessage()); 
			}finally { closeConnection(con); } 
		return name; 
}
public String getaddress(String id) {
	String addr="";
	
	 Connection con = null; try {
			con = getConnection(); 
			String sql = "select s_addr from student where s_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { 
				addr = rs.getString("s_addr"); 
				}else {
				throw new RuntimeException("아이디가 존재하지 않습니다"); } }catch(Exception e) {
					
			throw new RuntimeException("MemberDAO.getaddress : " + e.getMessage()); 
			}finally { closeConnection(con); } 
		return addr; 
	
}
public String getcollege(String id) {
	String college="";
	
	 Connection con = null; try {
			con = getConnection(); 
			String sql = "select s_college from student where s_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { 
				college = rs.getString("s_college"); 
				}else {
				throw new RuntimeException("아이디가 존재하지 않습니다"); } }catch(Exception e) {
					
			throw new RuntimeException("MemberDAO.getcollege : " + e.getMessage()); 
			}finally { closeConnection(con); } 
		return college; 
}

	public void insert (MemberVO member) { 
		Connection con = null; try { 
			con = getConnection();
		String sql = "insert into student values(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql); 
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getName());
		pstmt.setString(3, member.getAddress());	
		pstmt.setInt(4, member.getDate());
		pstmt.setString(5, member.getCollege());
		pstmt.setString(6, member.getMajor());

		pstmt.setString(7, member.getPassword());
		pstmt.setInt(8,-1);
	 pstmt.executeQuery(); }
		catch(Exception e) {
			throw new RuntimeException("MemberDAO.insert() :" + e.getMessage()); }finally { closeConnection(con); }
		} 
	}
