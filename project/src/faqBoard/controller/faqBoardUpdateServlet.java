package faqBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faqBoard.model.service.faqBoardService;
import faqBoard.model.vo.faqBoard;

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
		
		//카테고리 번호
		String cno=request.getParameter("cno");
		if(cno==null) {
			cno="0";
		}
		int cno2 = Integer.valueOf(cno);
		
		//글 제목
		String title = request.getParameter("ntitle");
		
		//글 내용
		String content = request.getParameter("ncontent");
	
		
		System.out.println("업데이트에서 fno값 가져오는 지 " + fno2+","+cno2+","+title+","+content);
		
		faqBoard fbu = new faqBoard(fno2,cno2,title,content);
		
		int result = new faqBoardService().updatefBoard(fbu);
		
		System.out.println("faq 관리자 값 나오는 지 확인 : " + result);
		
		System.out.println("객체값은 나오는지 " + fbu);
		
		
		if(result>0) {
			request.setAttribute("fbu", fbu);
			request.getRequestDispatcher("views/faqBoard/faqBoardUpdate.jsp").forward(request, response);
		}else {
			System.out.println("실패");
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
