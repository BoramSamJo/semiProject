
package faqBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faqBoard.model.service.faqBoardService;
import faqBoard.model.vo.fPagenation;



/**
 * Servlet implementation class DeletefaqBoardServlet
 */
@WebServlet("/delete.fbo")
public class DeletefaqBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletefaqBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fno=request.getParameter("fno");
		if(fno==null) {
			fno="0";
		}
		int fno2 = Integer.valueOf(fno);
		
		String cno = request.getParameter("cno");
		
		System.out.println("fno값은 가져오나(삭제)" + fno2);
		System.out.println("con삭제 값 " + cno);
		
		faqBoardService fService = new faqBoardService();
		
		//1. 게시판 리스트 총 갯수 구하기
		int listCount = fService.getListCount();
				
		int currentPage;
		int limit; 
		int maxPage;
		int startPage;
		int endPage;
		int pageBlock;
		int pageCount;
				
		currentPage=1;
				
		if(request.getParameter("currentPage")!=null) {
				currentPage = Integer.valueOf(request.getParameter("currentPage"));
		}
				
		limit=5; // 5개씩 뿌려주기
		maxPage=(int)((double)listCount/limit+0.8);
				
		//총 페이지 수
		pageCount = listCount/limit + (listCount%limit==0?0:1);
						
		//한 페이지에서 뿌려줄 페이지 수는 3개
		pageBlock=pageCount;
				
		startPage =((((int)((double)currentPage/pageBlock+0.8))-1)*pageBlock)+1;
		endPage=startPage + pageBlock -1;
				
				
		//마지막 페이지 처리
		if(endPage<pageCount) {
			endPage=pageCount;
		}
				
		//페이징 처리 변수 담아줄 Pagenation 객체
		fPagenation fpn = new fPagenation(currentPage, listCount,limit, maxPage, startPage,endPage,pageBlock,pageCount);

		//화면에 뿌려 줄 게시판 리스트 조회
		ArrayList list = fService.selectList(currentPage,limit);
		
		int result = new faqBoardService().deletefaqBoard(fno2);
		
		System.out.println("faq result 값 가져오는 지 (삭제): " + result);
		
		RequestDispatcher view = null;
		if(list!=null) {
			view = request.getRequestDispatcher("views/faqBoard/faqBoardListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("fpn", fpn);
			request.getSession().invalidate(); 
			
		}else {
			view=request.getRequestDispatcher("views/common/errorPage.jsp");
		}view.forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
