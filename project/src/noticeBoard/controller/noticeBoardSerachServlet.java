package noticeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeBoard.model.service.noticeBoardService;
import noticeBoard.model.vo.Pagenation;

/**
 * Servlet implementation class noticeBoardSerachServlet
 */
@WebServlet("/search.bo")
public class noticeBoardSerachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeBoardSerachServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectBox=request.getParameter("selectBox");
		String word =request.getParameter("word");
	
		System.out.println("selectBox,word 잘 가져오는 지 확인: " + selectBox+word); //잘 나옴
		
		noticeBoardService nService = new noticeBoardService();
		ArrayList list = nService.searchBoard(selectBox,word);
		
		
		int currentPage=1;
		int limit=5; 
		int maxPage=5;
		int startPage=1;
		int endPage=2;
		int listCount = nService.getListCount();
		
		Pagenation pn = new Pagenation(currentPage, listCount,limit, maxPage, startPage,endPage);
		
		
		System.out.println("list잘 나오는 지 :" + list); //나옴
		
		
		RequestDispatcher view = null;
		if(list!=null) {
			view=request.getRequestDispatcher("views/noticeBoard/noticeBoardListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("pn", pn);
			
		}else {
			view=request.getRequestDispatcher("views/common/errorPage.jsp");
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
