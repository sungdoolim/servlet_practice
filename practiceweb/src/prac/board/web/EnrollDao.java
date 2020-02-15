/*
 * 
 * �������б� ������ ������û
 * EnrollDao.java
 * 
 */

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

import java.io.*;

public class EnrollDao {
	
	static {
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
		if(con!=null) { try { con.close(); }catch(Exception e) {} } }
	
	
	public String insertcourse(String cid,int cno,String sid,int unit, int vet) {

		int unit2=0;
		int cidno2=0;
		int mileage=0;
		String sql;
	
		int cno2[]=new int[40];
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		Connection con = null; 
		try {
			con = getConnection();
			sql="select vet from student where s_id=?";
	
			 pstmt = con.prepareStatement(sql); 
			 pstmt.setString(1,sid);

			 //System.out.println("insert �� ����111");
			 rs=pstmt.executeQuery();

			 //System.out.println("insert �� ����222");
			if(rs.next()) {
				mileage=rs.getInt("vet");
			}
			
			//System.out.println("m: "+mileage);
			if(mileage<vet) {
				String message="���ϸ����� ���ڶ��ϴ�.�ٽ� �õ����ּ���.";
				return message;
			}
			 sql = "select c_unit, c_id_no from course where c_id=?";
			 pstmt = con.prepareStatement(sql); 
			 pstmt.setString(1, cid);
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) { 
				 unit2=rs.getInt("c_unit");
				 cidno2=rs.getInt("c_id_no");
				//System.out.println(unit2);

			 if(unit+unit2>18) {
				 String message="�ִ� ����(18����)�� �Ѿ����ϴ�.";
				 return message;
			}
			}
						
			 sql = "select c_id_no,vet from enroll where s_id=?";
			 pstmt = con.prepareStatement(sql); 
			 pstmt.setString(1, sid);
			 rs = pstmt.executeQuery();
			 int i=0;
		
			 while(rs.next()) { 
				cno2[i]=rs.getInt("c_id_no");i++;
				}
				
			for(int j=0;j<i;j++) {
				if(cno2[j]==cidno2) {
					String message="���� �������� �̹� ������û �߽��ϴ�.";
					//out.print("<script>alert(" + message + ")<script>");
					return message;
				}
			}
			
			int max=0;
			int count=0;
			int min=-1;
			
			sql = "select max from course where c_id=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			i=0;
				
			if(rs.next()) { 
				max=rs.getInt("max");
			}
				
			sql = "select count(s_id) from enroll where c_id=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
				
			if(rs.next()) { //System.out.println("count");
				count=rs.getInt(1);
			}
				
			if (count>=max) {
				i=0;
				sql = "select min(vet) mini from enroll where c_id=?";
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, cid);
				rs = pstmt.executeQuery();
				if(rs.next()) {		
					min=rs.getInt("mini");
				}
				if(vet>min) {
					String ssid = null;
					sql = "select s_id from enroll where c_id=? and vet=?";
					pstmt = con.prepareStatement(sql); 
					pstmt.setString(1, cid);
					pstmt.setInt(2, min);
					rs=pstmt.executeQuery();
						if(rs.next())
							 ssid=rs.getString("s_id");
							 sql = "delete from enroll where c_id=? and vet=? and s_id=?";
							 pstmt = con.prepareStatement(sql); 
							 pstmt.setString(1, cid);
							 pstmt.setInt(2, min);
							 pstmt.setString(3, ssid);
							 
							 pstmt.executeQuery();
							 
							 sql="update student set vet=vet+? where s_id=?";
							 pstmt = con.prepareStatement(sql); 
						
							 pstmt.setInt(1, min);
							 pstmt.setString(2, ssid);
							
							 pstmt.executeQuery();
							 
						}else {
							String message="������ �Ѿ�� ���� �����߽��ϴ�.";
							return message;
						}
				}
			
			sql = "insert into enroll values(?,?,?,?,?,?)";
	pstmt = con.prepareStatement(sql); 
	pstmt.setString(1, sid);
	pstmt.setString(2, cid);
	int year=0, sem=0;
	pstmt.setInt(3, cno);	
	pstmt.setInt(4, year);
	pstmt.setInt(5, sem);
	pstmt.setInt(6, vet);

	pstmt.executeQuery();
	 
	sql = "update student set vet=vet-? where s_id=?";
	 
	pstmt = con.prepareStatement(sql); 
	pstmt.setInt(1,vet);
	pstmt.setString(2,sid);
	pstmt.executeQuery();	 

	}
		
		catch(Exception e) {
			throw new RuntimeException("EnrollDao.insertcourse() :" + e.getMessage()); }finally { closeConnection(con); }
		
		return "";}

	public void delete(String cno,String sid,String cname,String cid) {
		String sql="";
		Connection con = null;
		ResultSet rs;
		try {
			con =getConnection();
			sql="select vet from enroll where c_id=? and s_id=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
		
			pstmt.setString(1,cid);
			pstmt.setString(2,sid);
			rs=pstmt.executeQuery();
			int vet=0;
			if(rs.next()) {
			 vet=rs.getInt("vet");
			}
			
			sql="update student set vet=vet+? where s_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vet);
			pstmt.setString(2, sid);
			pstmt.executeUpdate();
			
			sql="delete from enroll where c_id=? and s_id=?";	
			pstmt=con.prepareStatement(sql);
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
	
	@SuppressWarnings("null")
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
					throw new RuntimeException("���°� �������� �ʽ��ϴ�."); } }catch(Exception e) {
						
				throw new RuntimeException("CourseDao.getCourse : " + e.getMessage()); 
				}finally { closeConnection(con); } 
		 String[]name2=new String[i];
		 for(int j=0;j<i;j++) {
			 name2[j]=name[j];
		 }
		 
			return name2; 
	}
}
