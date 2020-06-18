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
import noticeBoard.model.vo.noticeBoard;

/**
 * Servlet implementation class noticeBoardListview
 */
@WebServlet("/list.bo")
public class noticeBoardListviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeBoardListviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		noticeBoardService nService = new noticeBoardService();
		
		//1. 게시판 리스트 총 갯수 구하기
		int listCount = nService.getListCount();
		System.out.println("DB갔다가 게시판 개수잘 뽑아오는 지 확인 : "+listCount);
		
		//2.페이징 처리하기
		//페이징 처리 변수 선언
		int currentPage;		//현재 페이지
		int limit; 				//게시글 갯수
		int maxPage;			//맨 끝페이지 번호
		int startPage;			//현재 페이지에서 시작번호
		int endPage;			//현재 페이지에서 끝번호
		int pageBlock;			//한 페이지에 뿌려줄 페이지 수
		int pageCount;			//총 페이지 수 
		
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
//		startPage=((currentPage-1)/pageBlock)*pageBlock+1;
//		endPage=startPage+pageBlock-1;
//	
		
		//마지막 페이지 처리
		if(endPage<pageCount) {
			endPage=pageCount;
		}
		
		//페이징 처리 변수 담아줄 Pagenation 객체
		Pagenation pn = new Pagenation(listCount,currentPage,limit, maxPage, startPage,endPage,pageBlock,pageCount);
		
		
		//화면에 뿌려 줄 게시판 리스트 조회
		ArrayList list = nService.selectList(currentPage,limit);
		
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
