package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.SketchBoardService;
import board.model.vo.Attachment;
import board.model.vo.Pagination;
import board.model.vo.SketchBoard;

/**
 * Servlet implementation class ManageSketchBoardSearchServlet
 */
@WebServlet("/searchBoard.ms")
public class ManageSketchBoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageSketchBoardSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchText = request.getParameter("searchText");

		System.out.println("검색어 : " + searchText);
		SketchBoardService sbs = new SketchBoardService();
		// 1_1. 게시판 리스트 총 갯수 구하기
		int listCount = new SketchBoardService().searchListCount(searchText);
//		System.out.println("서블릿에서 리스트 카운트 : " +listCount);

		// -------------- 페이징 처리 ---------------
		int currentPage; // 현재 페이지를 표시 할 변수
		int limit; // 한 페이지에 게시글이 몇 개가 보여질 것인지
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한번에 표시될 페이지가 시작 할 페이지
		int endPage; // 한번에 표시될 페이지가 끝나는 페이지

		currentPage = 1;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.valueOf(request.getParameter("currentPage"));
			if (currentPage < 1) {
				currentPage = 1;
			}
		}

		System.out.println("서블릿에서 현재페이지 : " + currentPage);
		limit = 9;

		maxPage = (int) ((double) listCount / limit + 0.9);
		if (currentPage > maxPage) {
			currentPage = maxPage;
		}

		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		Pagination pn = new Pagination(currentPage, listCount, limit, maxPage, startPage, endPage);

		ArrayList<SketchBoard> list = new SketchBoardService().selectSearchList(currentPage, limit, searchText);
		System.out.println("서블릿에서 list : " + list);

		ArrayList<Attachment> fList = new SketchBoardService().selectFlist(list);

		RequestDispatcher view = null;

//		System.out.println(list);
//		System.out.println(fList);

		if (!list.isEmpty() && !fList.isEmpty()) {
			request.setAttribute("pn", pn);
			request.setAttribute("list", list);
			request.setAttribute("fList", fList);
			request.setAttribute("searchText", searchText);
			request.setAttribute("isSearch", "true");
			view = request.getRequestDispatcher("views/manage/manageSketchBoardList.jsp");
		} else {
			request.setAttribute("pn", pn);
			request.setAttribute("list", list);
			request.setAttribute("fList", fList);
			request.setAttribute("searchText", searchText);
			request.setAttribute("isSearch", "true");
			request.setAttribute("msg", "게시글 조회 실패!");
			view = request.getRequestDispatcher("views/manage/manageSketchBoardList.jsp");
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
