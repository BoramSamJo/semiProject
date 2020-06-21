package funeral.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import funeral.model.service.ReservationService;
import funeral.model.vo.Reservation;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order.f")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		// 2. �쟾�넚 媛� 爰쇰궡�꽌 蹂��닔�뿉 ���옣 諛� 媛앹껜 �깮�꽦
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
	    // object 諛섑솚
//	    request.getAttribute("") 
	    Reservation reservation = new Reservation(plusDate,plusTime,funeralSelect,funeralSelect1,funeralSelect2,funeralSelect3,userName,phone,address,pName,pWeight,pKindMain,pKindService);
	    System.out.println(reservation);
	    //3. DB源뚯� 異쒕컻�븯怨� 諛섑솚媛� 諛쏄린
	    int result = new ReservationService().insertOrder(reservation);
	    System.out.println("selvlet result 반환값 : " + result);

	    //4. 諛섑솚 寃곌낵�뿉 �뵲瑜� �솕硫대낫�씠湲�
	    if(result>0) {
	    	System.out.println("성공!");
	    	// 異뷀썑�뿉 �뼱�뵒濡� �뼢�븷寃껋씤媛�?
	    	response.sendRedirect("views/login.jsp");
	    	// �씠嫄� �솢 �삤瑜섏빞 �빞諛�
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
