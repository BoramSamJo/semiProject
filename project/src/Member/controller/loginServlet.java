package Member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.model.service.MemberService;
import Member.model.vo.Member;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/insert.me")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		Member member = new Member(userId);
		System.out.println("userId : " + userId);
		
		
		Member loginUser = new MemberService().login(member);
		System.out.println("loginUser :" + loginUser);
		
//		if(loginUser != null) {
//			System.out.println("로그인 성공!");
//			HttpSession session = request.getSession();
//			
//			session.setAttribute("loginUser",loginUser);
//			response.sendRedirect("reservation.jsp");
//		}else {
//			System.out.println("로그인실패!");
//			response.sendRedirect("login.jsp");
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}