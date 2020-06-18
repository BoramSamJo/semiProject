package faqBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faqBoard.model.service.faqBoardService;

/**
 * Servlet implementation class faqBoardUpdateServlet
 */
@WebServlet("/update.fbo")
public class faqBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faqBoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("출력이 될 것인가");
		request.setCharacterEncoding("utf-8");
		
		//글 번호 가져옴
		String fno=request.getParameter("fno");
		if(fno==null) {
			fno="0";
		}
		int fno2 = Integer.valueOf(fno); 
		
		 String ftitle=request.getParameter("ftitle");
		 if(ftitle==null) { 
			 ftitle="0";
		  } int ftitle2 = Integer.valueOf(ftitle);
		 
		
		String fcontent=request.getParameter("fcontent");
		if(fcontent==null) {
			fcontent="0";
		}
		int fcontent2= Integer.valueOf(fcontent);
		
		System.out.println("업데이트에서 fno값 가져오는 지 " + fno2+fcontent2);
		
		/* int result = new faqBoardService().updateBoard(); */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
