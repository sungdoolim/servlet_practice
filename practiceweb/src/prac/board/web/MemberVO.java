/*
 * 
 * 동국대학교 베팅형 수강신청
 * BoardServlet.java
 * 
 */

package prac.board.web;

public class MemberVO {
	private String id; 
	private String name; 
	private String password; 
	private String college; 
	private String address;
	private int Date; 
	private String major;
	private String pid;


	public String getPid() {
		return pid;
	}
	
	
	public void setPid(String pid) {
		this.pid = pid;
	}
	
	
	public String getId() {
		return id;
	}
	
	
	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getName() {
		return name;
	}
	
	
	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getPassword() {
		return password;
	}
	
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getCollege() {
		return college;
	}
	
	
	public void setCollege(String college) {
		this.college = college;
	}
	
	
	public String getAddress() {
		return address;
	}
	
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public int getDate() {
		return Date;
	}
	
	
	public void setDate(int date) {
		Date = date;
	}
	
	
	public String getMajor() {
		return major;
	}
	
	
	public void setMajor(String major) {
		this.major = major;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", password=" + password + ", college=" + college + ", address="
				+ address + ", Date=" + Date + ", major=" + major + "]";
	}


}
