package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.QnAService;
import board.model.vo.Pagination;
import board.model.vo.QAnswer;
import board.model.vo.QnABoard;

/**
 * Servlet implementation class SearchQnABoardServlet
 */
@WebServlet("/searchQ.bo")
public class SearchQnABoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchQnABoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchText = request.getParameter("content");
		String searchKey = request.getParameter("selectBox");
		
		String colName = "";
		switch(searchKey) {
		case "title": colName="Q_TITLE";
			break;
		case "writer": colName="MEMBER_NAME";//반드시 조인한테이블을 사용하거나 뷰를 사용해야겠지
			break;
		}
		
		//0. 페이징처리 
		//1) 리스트 총 개수 구하기
		int listCount = new QnAService().getSearchQListCount(colName, searchText);
		int currentPage;
		int limit;		
		int maxPage;	
		int startPage;	
		int endPage;
		
		currentPage=1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.valueOf(request.getParameter("currentPage"));
			if(currentPage<1) {
				currentPage=1;
			}
		}
		limit=10;
		maxPage = (int)((double)listCount/limit + 0.9);
		if(currentPage > maxPage) {
			currentPage = maxPage;
		}
		startPage = (((int)((double)currentPage/limit + 0.9))-1)*limit+1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		Pagination p = new Pagination(currentPage, listCount, limit, maxPage, startPage, endPage);
				
		
		//1. QnA보드리스트 불러오기
		ArrayList<QnABoard> qList = new QnAService().searchQnAList(p, colName, searchText);
		
		//2. QnA답변 불러오기
		ArrayList<QAnswer> qAList = new QnAService().selectQAnswerList();//기존꺼 활용
		
		//3. 뿌리기
		RequestDispatcher veiw = null;
		if(!qList.isEmpty()) {
			request.setAttribute("qList", qList);
			request.setAttribute("qAList", qAList);
			request.setAttribute("p", p);
			request.setAttribute("isSearch", "true");
			request.setAttribute("selectBox", searchKey);
			request.setAttribute("content", searchText);
			request.getRequestDispatcher("views/board/qnaBoard.jsp").forward(request, response);
		}else {
			request.setAttribute("qList", qList);
			request.setAttribute("qAList", qAList);
			request.setAttribute("p", p);
			request.setAttribute("isSearch", "true");
			request.setAttribute("selectBox", searchKey);
			request.setAttribute("content", searchText);
			request.setAttribute("msg", "qna게시글조회 실패");
			request.getRequestDispatcher("views/board/qnaBoard.jsp").forward(request, response);
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
