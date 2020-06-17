package Member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.model.service.MemberService;
import Member.model.vo.Member;

/**
 * Servlet implementation class userInform
 */
@WebServlet("/user.me")
public class userInform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userInform() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println("userId :" + userId);
		Member member = new MemberService().userMember(userId);
		System.out.println("내정보 : " + member);
		
		RequestDispatcher view = null;
		
		if(member !=null) {
			view = request.getRequestDispatcher("views/Funeral/reservation.jsp");
			request.setAttribute("member", member);
			view.forward(request, response);
			System.out.println("성공!");
		}else {
			System.out.println("실패!");
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
