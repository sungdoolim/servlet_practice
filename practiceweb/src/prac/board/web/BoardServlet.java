/*
 * 
 * 동국대학교 베팅형 수강신청
 * BoardServlet.java
 * 
 */

package prac.board.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.*; /*수정한부분*/

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/BoardServlet")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
String s=request.getParameter("s");

HttpSession session = request.getSession(); 
		if(s.equals("logout")) { 
			session.invalidate();
			RequestDispatcher disp = request.getRequestDispatcher("/index.jsp"); 
			disp.forward(request, response); 
			 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(); 
		String v=request.getParameter("submit");
		MemberDao dao = new MemberDao(); 
		MemberVO member = new MemberVO();
		EnrollDao edao=new EnrollDao();

		String id = request.getParameter("id"); 
		String password = request.getParameter("pw"); 
			
	//-------------------------------------------------------------------------------------------------------------------------------	
		
		 if(v.equals("login")) {
			String url="";
			
			String realpw=dao.getpw(id);
			if(realpw.equals("아이디가 없습니다")) {
				session.setAttribute("message", realpw);
		 
				url="/index.jsp";
			}
			
			else {
			if(realpw.equals(password)) {
				request.setAttribute("message", id + "님 환영합니다.");
				String name = dao.getname(id);
				String address = dao.getaddress(id);
				String college = dao.getcollege(id);
				String major = dao.getmajor(id);
			
				session.setAttribute("name", name);
				session.setAttribute("college", college);
				session.setAttribute("address", address);
				session.setAttribute("id", id);
				session.setAttribute("pw", password);
				session.setAttribute("major", major);
				
				url="/main.jsp";
			}else {
				session.setAttribute("message", "password가 일치하지 않습니다");
				
				url="/index.jsp";
			}
			}
			
			
			RequestDispatcher disp = request.getRequestDispatcher(url); 
			disp.forward(request, response); 
		}

		else if(v.equals("update")) { 
			String message;
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String college = request.getParameter("college");
			String prof=request.getParameter("prof");
		
			session.setAttribute("name", name);
			session.setAttribute("address", address);
			session.setAttribute("college", college);
			member.setId(id); 
			member.setPassword(password);
			member.setName(name);
			member.setAddress(address);
			member.setCollege(college);
	
		
			try {
				message=dao.updateMember(member,prof);
				if(message.equals(" ")) {
			member = dao.selectMem(id);
			request.setAttribute("message", "회원 정보 수정 완료");
			request.setAttribute("member", member);
				}else {
					
					String url="/info.jsp";
					request.setAttribute("message", message);
					RequestDispatcher disp = request.getRequestDispatcher(url); 
					disp.forward(request, response); 
				}
			}
			
		catch(RuntimeException e) { 
			request.setAttribute("message", e.getMessage()); } 
			String url="/main.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(url); 
			disp.forward(request, response); 
		} 
		
		else if(v.equals("Cregit")) {
			int unit=(int)session.getAttribute("unit");
			System.out.println(unit);
			int vet=Integer.parseInt(request.getParameter("vet"));
			
			try {
				String cid=request.getParameter("cid");
				int cno=Integer.parseInt(request.getParameter("cno"));
				String sid=(String) session.getAttribute("id");
			
				//System.out.println(cid);
				//System.out.println(cno);		
				//System.out.println(sid);
				String message=edao.insertcourse(cid,cno,sid,unit,vet);
				session.setAttribute("message", message);
			}
			
			catch(RuntimeException e) { 
				request.setAttribute("message", e.getMessage()); } 
				
				String url="/try.jsp";
				RequestDispatcher disp = request.getRequestDispatcher(url); 
				disp.forward(request, response);
			
			
			}else if(v.equals("delete")) {
				String sid=(String)session.getAttribute("id");
				String cno=request.getParameter("cno");
				String cname=request.getParameter("cname");
				String cid=request.getParameter("cid");
				edao.delete(cno,sid,cname,cid);
				
				RequestDispatcher disp = request.getRequestDispatcher("/delete.jsp"); 
				disp.forward(request, response);
			}		
	}


}