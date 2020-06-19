package myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myPage.model.service.MemberService;

/**
 * Servlet implementation class DeleteMember
 */
@WebServlet("/del.me")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.valueOf(request.getParameter("userNo"));
		
		int result = MemberService.deleteUser(userNo);
		
		if(result>0) {
			request.getSession().invalidate();
			//로그인 유지역할하던 쿠키까지 삭제
		      Cookie[] cookies = request.getCookies();
		      if(cookies!=null&&cookies.length>0) {
		         for(Cookie cookie : cookies){
		            if(cookie.getName().equals("loginCookie")){
		               cookie.setMaxAge(0);
		               cookie.setPath("/");
		               response.addCookie(cookie);
		            }
		         }
		      }
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
