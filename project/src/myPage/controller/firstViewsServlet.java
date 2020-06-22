package myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myPage.model.vo.Animal;
import member.model.vo.Member;
import myPage.model.service.MemberService;
import myPage.model.vo.CalendarViews;
import myPage.model.vo.IList;

/**
 * Servlet implementation class firstViews
 */
@WebServlet("/first.ch")
public class firstViewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public firstViewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<Animal> aList = new ArrayList<>();		// 동물정보 리스트
		ArrayList<CalendarViews> rList = new ArrayList<>();	// 장례예약정보 리스트
		ArrayList<IList> iList = new ArrayList<>();		// 보험가입정보 리스트
		
		Member m = (Member)session.getAttribute("loginUser");
		
		RequestDispatcher view = null;
		
		if(m != null) {
			rList = MemberService.reservationUpdate(m.getmNo());
			aList = MemberService.animalUpdate(m.getmNo());
			iList = MemberService.insuranceUpdate(m.getmNo());
			System.out.println("iList : "+iList);
			System.out.println("rList : "+rList);
			System.out.println("aList : "+aList);
			view = request.getRequestDispatcher("views/member/myPage.jsp");
			request.setAttribute("m", m);
			request.setAttribute("rList", rList);
			request.setAttribute("aList", aList);
			request.setAttribute("iList", iList);
		}else {
			view = request.getRequestDispatcher("index.jsp");
			request.setAttribute("msg", "로그인을 해주세요");
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
