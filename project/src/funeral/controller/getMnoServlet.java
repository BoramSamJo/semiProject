package funeral.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Animal;
import member.model.vo.Member;

/**
 * Servlet implementation class getMnoServlet
 */
@WebServlet("/getMno.re")
public class getMnoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getMnoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getmId();
		
		int mNo = new MemberService().selectMemberNo(userId);
		
		// member의 번호,아이디,비번, 전번, 주소
		Member member = new MemberService().selectMember(mNo);
		System.out.println(member);
		
		ArrayList<Animal> animal = new MemberService().selectAllAnimal();
		
		RequestDispatcher view = null;
		if(mNo!=0) {
			request.setAttribute("member", member);
			request.setAttribute("animal", animal);
			view = request.getRequestDispatcher("views/funeral/reservation.jsp");
		}else {
			request.setAttribute("member", member);
			request.setAttribute("animal", animal);
			view = request.getRequestDispatcher("views/funeral/reservation.jsp");
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
