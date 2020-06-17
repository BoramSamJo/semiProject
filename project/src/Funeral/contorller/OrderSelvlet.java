package Funeral.contorller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Funeral.model.service.ReservationService;
import Funeral.model.vo.Reservation;

/**
 * Servlet implementation class OrderSelvlet
 */
@WebServlet("/order.me")
public class OrderSelvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSelvlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("DB에 예약완료!");
		
		// 1. 화면단으로부터 한글이 있을 경우 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2. 전송 값 꺼내서 변수에 저장 및 객체 생성
		String plusDate = request.getParameter("plusDate");
//		String plusDateCut = plusDate.substring(9, 21);
		String plusTime = request.getParameter("plusTime");
//		String plusTimeCut = plusTime.substring(9, 18);
		String funeralSelect = request.getParameter("funeralSelect");
		String funeralSelect1 = request.getParameter("funeralSelect1");
		String funeralSelect2 = request.getParameter("funeralSelect2");
		String funeralSelect3 = request.getParameter("funeralSelect3");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String pName = request.getParameter("pName");
	    String pWeight = request.getParameter("pWeight");
	    String pKindMain = request.getParameter("pKindMain");
	    String pKindService = request.getParameter("pKindServe");
	    // object 반환
//	    request.getAttribute("") 
	    Reservation reservation = new Reservation(plusDate,plusTime,funeralSelect,funeralSelect1,funeralSelect2,funeralSelect3,userName,phone,address,pName,pWeight,pKindMain,pKindService);
	    System.out.println(reservation);
	    //3. DB까지 출발하고 반환값 받기
	    int result = new ReservationService().insertOrder(reservation);
	    System.out.println("selvlet에서 받은 반환값 : " + result);

	    //4. 반환 결과에 따른 화면보이기
	    if(result>0) {
	    	System.out.println("성공!");
	    	// 추후에 어디로 향할것인가?
	    	response.sendRedirect("views/login.jsp");
	    	// 이건 왜 오류야 야발
//	    	response.sendRedirect("views/Funeral/reservation.jsp");
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
