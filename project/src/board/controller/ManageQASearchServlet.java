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
 * Servlet implementation class ManageQASearchServlet
 */
@WebServlet("/manageSearchQA.bo")
public class ManageQASearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageQASearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isAnswer = request.getParameter("isAnswer");
		String givenQuery = request.getParameter("givenQuery");
		
		String colName = "ANSWER";
		String AStatus = "";
		switch(isAnswer) {
		case "answer": AStatus="Y";
			break;
		case "noAnswer": AStatus="N";//반드시 조인한테이블을 사용하거나 뷰를 사용해야겠지
			break;
		}

		//0. 페이징처리 
		//1) 리스트 총 개수 구하기
		int listCount = new QnAService().getSearchByAnswerListCount(colName, givenQuery, AStatus);
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
		ArrayList<QnABoard> qList = new QnAService().searchByQAnswer(p, colName, givenQuery, AStatus);
		
		//2. QnA답변 불러오기
		ArrayList<QAnswer> qAList = new QnAService().selectQAnswerList();//기존꺼 활용
		
		//3. 쿼리문 불러오기
		String query = "SELECT * FROM ("+givenQuery+") WHERE "+colName+" = '"+AStatus+"'";
		
		//4. 전부 성공했다면 쿼리문을 가지고 돌아가기
		RequestDispatcher veiw = null;
		if(!qList.isEmpty()) {
			request.setAttribute("qList", qList);
			request.setAttribute("qAList", qAList);
			request.setAttribute("p", p);
			request.setAttribute("isA", "true");
			request.setAttribute("isAnswer", isAnswer);
			request.setAttribute("givenQuery", givenQuery);
			if(givenQuery.contains("QC_NO =")) {
				request.setAttribute("isC", "past");
			}
			if(givenQuery.contains("LIKE")) {
				request.setAttribute("isT", "past");
			}
			request.setAttribute("query", query);
			request.getRequestDispatcher("views/manage/manageQnA.jsp").forward(request, response);
		}else {
			request.setAttribute("qList", qList);
			request.setAttribute("qAList", qAList);
			request.setAttribute("p", p);
			request.setAttribute("isA", "true");
			if(givenQuery.contains("QC_NO =")) {
				request.setAttribute("isC", "past");
			}
			if(givenQuery.contains("LIKE")) {
				request.setAttribute("isT", "past");
			}
			request.setAttribute("isAnswer", isAnswer);
			request.setAttribute("givenQuery", givenQuery);
			request.setAttribute("query", query);
			request.setAttribute("msg", "qna게시글조회 실패");
			request.getRequestDispatcher("views/manage/manageQnA.jsp").forward(request, response);
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
