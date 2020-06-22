package insurance.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import insurance.model.service.InsuranceService;
import insurance.model.vo.Insurance;

/**
 * Servlet implementation class CalculateIns
 */
@WebServlet("/calculate.ins")
public class CalculateInsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculateInsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String kind = request.getParameter("animal");
		int age = Integer.valueOf(request.getParameter("age"));
		
//		System.out.println(kind);
//		System.out.println(age);
		
		Insurance ins = new Insurance(kind, age);
		
		Insurance result = new InsuranceService().calculateIns(ins);
		
//		System.out.println(result);
		
		RequestDispatcher view = null;
		
		if(result != null) {
//			HttpSession session = request.getSession();
			
			request.setAttribute("insurance", result);
			view = request.getRequestDispatcher("views/insurance/insuranceConfirm.jsp");
//			request.setAttribute("insurance", result);
		}else {
			request.setAttribute("msg", "보험정보조회 실패");
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
		}
		
		view.forward(request, response);
		System.out.println(kind);
		System.out.println(age);
	}
	
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
