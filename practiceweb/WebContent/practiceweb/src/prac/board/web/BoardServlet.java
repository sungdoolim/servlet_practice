package prac.board.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//doPost(request, response);
		
String s=request.getParameter("s");

HttpSession session = request.getSession(); 
		if(s.equals("logout")) { 
			session.invalidate();
			RequestDispatcher disp = request.getRequestDispatcher("/index.jsp"); 
			disp.forward(request, response); 
			 }
		
	
	/*	request.setCharacterEncoding("utf-8");
		String v=request.getParameter("submit");
		int a=1;
		String[][] ar = {{"기프","자바","웹프","이산"}, {"모바일","심프","캡톤","종설","데통","디비프","디시"}, {"인공","공쏘","창공"}};
		int ran[]=new int[3];
		randomsection:for(int i=0;i<3;i++) {
			
		ran[i]=(int) (Math.random()*7);
		
		for(int j=0;j<i;j++) {
			if(ran[i]==ran[j]) {
				i--;
				continue randomsection;
			}
		}
		System.out.print(ar[a][ran[i]]+" ");
		}*/
	/*
	 * 	
		request.setCharacterEncoding("utf-8");
		String v=request.getParameter("submit");
		String action = request.getParameter("action"); 
		String userid = request.getParameter("userid");
		MemberDao dao = new MemberDao(); 
		MemberVO member = new MemberVO(); 

			try { 
				member = dao.selectMem(userid);
				request.setAttribute("member", member);
				request.setAttribute("action", action);
				}catch(RuntimeException e) { 
					request.setAttribute("message", e.getMessage()); } 
		RequestDispatcher disp = request.getRequestDispatcher("/memberform.jsp");
		disp.forward(request, response); 
		*/
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(); 
		String v=request.getParameter("submit");
		MemberDao dao = new MemberDao(); 
		MemberVO member = new MemberVO();
		EnrollDao edao=new EnrollDao();
		EnrollVO enroll=new EnrollVO();
	
		String id = request.getParameter("id"); 
		String password = request.getParameter("pw"); 
		
		if(v.equals("register")) {
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String major = request.getParameter("major");
		String college = request.getParameter("college");

	int date = Integer.parseInt(request.getParameter("date"));
	
		
		member.setId(id); 
		member.setPassword(password);
		member.setName(name);
		member.setAddress(address);
		member.setCollege(college);
		member.setDate(date);
		member.setMajor(major);
		
	
		member.setAddress(address); 
		try { dao.insert(member); request.setAttribute("message", "회원가입성공"); }catch(RuntimeException e) { 
			request.setAttribute("message", e.getMessage()); } 
		RequestDispatcher disp = request.getRequestDispatcher("/index.jsp"); 
			disp.forward(request, response); }
	//-------------------------------------------------------------------------------------------------------------------------------	
		else if(v.equals("login")) {
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
				session.setAttribute("name", name);
				session.setAttribute("college", college);
				session.setAttribute("address", address);
				session.setAttribute("id", id);
				session.setAttribute("pw", password);
				
				
				
				
				
				url="/index2.jsp";
			}else {
				session.setAttribute("message", "password가 일치하지 않습니다");
				url="/index.jsp";
			}
			}
			
			
			RequestDispatcher disp = request.getRequestDispatcher(url); 
			disp.forward(request, response); 
		}
		/*
		else if(v.equals("logout")) { 
			session.invalidate();
			RequestDispatcher disp = request.getRequestDispatcher("/index.jsp"); 
			disp.forward(request, response); 
			 }
		*/
		else if(v.equals("update")) { 
			String message;
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String college = request.getParameter("college");
			String prof=request.getParameter("prof");
			System.out.println(prof);
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
			
			
			
			String url="/index2.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(url); 
			disp.forward(request, response); 
			
		
		
		
		
		} 
		
		
		
		else if(v.equals("Cregit")) {
			int unit=(int)session.getAttribute("unit");
			System.out.println(unit);
			
			try {
				String cid=request.getParameter("cid");
				int cno=Integer.parseInt(request.getParameter("cno"));
				String sid=(String) session.getAttribute("id");
				//System.out.println(session.getAttribute("id"));
				System.out.println(cid);
				System.out.println(cno);		
				System.out.println(sid);
				String message=edao.insertcourse(cid,cno,sid,unit,40);
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



		
		
	
	
	
		
		
	


