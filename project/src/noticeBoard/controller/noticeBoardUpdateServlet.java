package noticeBoard.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import noticeBoard.model.service.noticeBoardService;
import noticeBoard.model.vo.noticeBoard;

/**
 * Servlet implementation class noticeBoardUpdateServlet
 */
@WebServlet("/update.bo")
public class noticeBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeBoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//작성자
		String nwriter=request.getParameter("nwriter");
		//제목
		String title = request.getParameter("ntitle");
		//내용
		String content = request.getParameter("ncontent");
		//날짜
		String ndate = request.getParameter("ndate");
		//글 번호 
		String nno=request.getParameter("nno");
		
		
		if(nno==null) {
			nno="0";
		}
		int nno2 = Integer.valueOf(nno); 
		
		if(nwriter==null) {
			nwriter="0";
		}
		int nwriter2=Integer.valueOf(nwriter);
		
		noticeBoard nb= new noticeBoard(nno2,nwriter2,title,content);
		System.out.println("nno,ntitle,ncontent 출력 되는 지 확인 : " + nno + title+ content + ndate);
		
	
		int result = new noticeBoardService().updateBoard(nb);
		
		 System.out.println("값 나오는지 ㅇ확인:" + result); //잘 나옴 

		 System.out.println("test"+nb);
		
		 
		 if(result>0) {
			 System.out.println("성공");
			 request.setAttribute("nb", nb);
			 request.getRequestDispatcher("views/noticeBoard/noticeBoardUpdate.jsp").forward(request, response);
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
