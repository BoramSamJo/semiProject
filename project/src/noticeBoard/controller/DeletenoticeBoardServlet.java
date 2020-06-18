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
 * Servlet implementation class DeletenoticeBoardServlet
 */
@WebServlet("/delete.bo")
public class DeletenoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletenoticeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nno=request.getParameter("nno");
		int nno2 = Integer.valueOf(nno);
		
		noticeBoardService nService = new noticeBoardService();
		
		//1. 게시판 리스트 총 갯수 구하기
		int listCount = nService.getListCount();
		
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
		maxPage=(int)((double)listCount/limit+0.7);
		
		//총 페이지 수
		pageCount = listCount/limit + (listCount%limit==0?0:1);
				
		//한 페이지에서 뿌려줄 페이지 수는 3개
		pageBlock=pageCount;
		
		startPage=(((int)((double)currentPage/pageBlock+0.7))-1)*pageBlock+1;
		endPage=startPage+pageBlock -1;
		
		
		//마지막 페이지 처리
		if(endPage<pageCount) {
			endPage=pageCount;
		}
		
		//페이징 처리 변수 담아줄 Pagenation 객체
		Pagenation pn = new Pagenation(currentPage, listCount,limit, maxPage, startPage,endPage,pageBlock,pageCount);

		//화면에 뿌려 줄 게시판 리스트 조회
		ArrayList list = nService.selectList(currentPage,limit);
		
		int result = new noticeBoardService().deletenoticeBoard(nno2);
		
		RequestDispatcher view = null;
		if(result>0) {
			view=request.getRequestDispatcher("views/noticeBoard/noticeBoardListView.jsp"); //다른 페이지List보는 페이지로 이동하도록 바꾸기***
			request.setAttribute("list", list); 
			request.setAttribute("pn", pn);
			System.out.println("어디서헤메고있는거니 성공이니");
			request.getSession().invalidate(); 
		}else {
			view=request.getRequestDispatcher("views/common/errorPage.jsp");
			System.out.println("아님 실패니");
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
