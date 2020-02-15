package week12;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
//        <!-- 2015112120 임성두 -->
/**
 * Servlet implementation class beanServlet
 */
@WebServlet("/beanServlet")
public class beanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection conn=null;
	bean A=new bean();


    /**
     * @see HttpServlet#HttpServlet()
     */
    public beanServlet() {
        super();
        // TODO Auto-generated constructor stub
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver"); String jdbcurl = "jdbc:mysql://localhost:3308/12week?serverTimezone=Asia/Seoul"; 
        	 conn = DriverManager.getConnection(jdbcurl, "root", "staris");

        	}
        	//conn.commit();
        	catch(Exception e) { System.out.println("db 연동 오류입니다. : " + e.getMessage()); }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		if(!(request.getParameter("v").equals("list"))) {
			System.out.println("냐옹");
		String a=request.getParameter("content");
		A.setContent(a);
		A.setName(request.getParameter("name"));
		A.setId(Integer.parseInt(request.getParameter("id")));
		A.setMail(request.getParameter("email"));
		A.setPw(request.getParameter("pw"));
		A.setTitle(request.getParameter("title"));
		
		request.setAttribute("bean", A);// 이름이 꼭 bean이어야하네...??
		
PreparedStatement pstmt = null; String sql = null;
sql="insert into board_tbl values(?,?,?,?,?,?,?)";
try {
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, A.getId());
	pstmt.setString(2, A.getName());
	pstmt.setString(3, A.getMail());
	pstmt.setString(4, A.getTitle());
	pstmt.setString(5, A.getContent());
	pstmt.setString(6, A.getPw());
	pstmt.setInt(7, A.getRef());
	pstmt.executeUpdate();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


ResultSet rs = null;

		

		
		
		RequestDispatcher disp = request.getRequestDispatcher("/3_1.jsp");
		disp.forward(request, response); 
		
		
		}
		if(request.getParameter("v").equals("list")) {
			System.out.println("멍멍");
			String sql="select * from board_tbl";int i=0;Integer ii=0;
				//bean B=new bean();
			try {
				bean []A=new bean[20];
				PreparedStatement pstmt=conn.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next()) {
				A[i]=new bean();
					
					A[i].setName(rs.getString("Name"));
					A[i].setTitle(rs.getString("Title"));
					A[i].setContent(rs.getString("content"));
					A[i].setMail(rs.getString("E_mail"));
					A[i].setId(rs.getInt("id"));
					request.setAttribute("bean"+ii.toString(), A[i]);ii++;
					i++;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher disp = request.getRequestDispatcher("/3_list.jsp");
			disp.forward(request, response); 
				
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		
		
	//	PreparedStatement pstmt = null; String sql = null;
	
		
		
	}

}
