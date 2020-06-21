package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.AnimalService;
import member.model.service.MemberService;
import member.model.vo.Animal;
import member.model.vo.Member;

/**
 * Servlet implementation class logintestservlet
 */
@WebServlet("/user.me")
public class logintestservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logintestservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 임시 login에서 가져온값! 혜린이누나 로그인에서 아이디와 패스워드 뽑아내서 그값을 다음으로 던질계획! matchingId랑같은 코드
		// 1. 사람 정보 가져오기
		String mId = request.getParameter("userId");
		System.out.println("memberId : " + mId);
		Member member = new MemberService().logindata(mId);
		System.out.println("로그인해 가져온 member 값 : " + member);
		// 가져온 member에서 member_no를 불러오고
		
		
		RequestDispatcher view = null;
		
		if(member != null) { // 로그인 성공시
			int mNo = member.getmNo();
			System.out.println("member에서 불러온 member_no :" +mNo);
//			Animal animal = new AnimalService().animaldata();
			ArrayList<Animal> animal = new AnimalService().animaldata();
			System.out.println("mNo를 통해 animal 값 : " + animal);
			
				view = request.getRequestDispatcher("views/funeral/reservation.jsp");
				request.setAttribute("member", member);
				request.setAttribute("animal", animal);
				view.forward(request, response);	
			
							

			
				
//				// servlet값을 다른 servlet에 넒기 실행x
//				ServletContext context = this.getServletContext();
//				RequestDispatcher dispatcher = context.getRequestDispatcher("/viewReservationServlet");
//
//				dispatcher.forward(request, response);
//				int updateAnimal = new AnimalService().insertAnimaldata(mNo);
//			
			
			
			
		}else { //로그인 실패시
			view = request.getRequestDispatcher("login.jsp");
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
