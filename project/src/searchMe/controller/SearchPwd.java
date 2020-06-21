package searchMe.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchMe.model.service.SearchService;
import member.model.vo.Member;

/**
 * Servlet implementation class SearchPwd
 */
@WebServlet("/pwd.me")
public class SearchPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");

		Member m = new Member(userId, name, email);
		
		Member m2 = SearchService.searchPwd(m);

		PrintWriter out = response.getWriter();
		if(m2 == null) {
			out.print("1");
		}else {
			out.print(m2.getmPwd());			
		}
		
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
