package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Animal;

/**
 * Servlet implementation class ManageUpdateAninalServlet
 */
@WebServlet("/updateAnimal.me")
public class ManageUpdateAninalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageUpdateAninalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = Integer.valueOf(request.getParameter("mNo"));
		String statusS = request.getParameter("status");
		String aName = request.getParameter("aName");
		String aKind = request.getParameter("aKind");
		String aWeight = request.getParameter("aWeight");
		System.out.println(mNo);
		String status = "";
		switch(statusS) {
		case "[일반]" : status = "N";
			break;
		case "[장례완료]" : status = "Y";
			break;
		}
		
		Animal a = new Animal();
		a.setmNo(mNo);
		a.setaName(aName);
		a.setKind(aKind);
		a.setWeight(aWeight);
		a.setStatus(status);
		
		int result = new MemberService().updateAnimal(a);
		
		RequestDispatcher view = null;
		if(result>0) {
			view = request.getRequestDispatcher("/manageMList.bo");
		}else {
			view = request.getRequestDispatcher("/manageMList.bo");
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
