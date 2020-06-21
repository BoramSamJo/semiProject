package insuranceView.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Pagination;
import insuranceView.model.service.InsuranceManageService;
import insuranceView.model.vo.InsuranceManage;

/**
 * Servlet implementation class searchInsuranceServlet
 */
@WebServlet("/search.ins")
public class searchInsuranceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchInsuranceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchText = request.getParameter("content");
		String searchKey = request.getParameter("selectSearch");
		ArrayList<InsuranceManage> iList = new ArrayList();
		int listCount = 0;
		System.out.println(searchText);
		System.out.println(searchKey);
		if(searchKey=="all" || searchText==null || searchText=="") {
			listCount = InsuranceManageService.getListCount();
		} else {
			listCount = InsuranceManageService.getListCount(searchKey, searchText);			
		}

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
		
		if(searchKey=="all" || searchText==null|| searchText=="") {
			iList = InsuranceManageService.firstUpdate(p);
		} else {
			iList = InsuranceManageService.getInsList(p, searchKey, searchText);			
		}

		ArrayList<String> endDate = new ArrayList();
		for(int i=0; i<iList.size(); i++) {
			int end = (Integer.valueOf(iList.get(i).getEnrollDate().substring(0,4))+1);
			String end2 = Integer.valueOf(end).toString();
			endDate.add(end2.concat(iList.get(i).getEnrollDate().substring(4,10)));
		}
		
		RequestDispatcher view = null;

		if(!iList.isEmpty()) {
			request.setAttribute("iList", iList);
			request.setAttribute("p", p);
			request.setAttribute("endDate", endDate);
			request.setAttribute("isSearch", "true");
			request.setAttribute("searchText", searchText);
			request.setAttribute("searchKey", searchKey);
			view = request.getRequestDispatcher("views/manage/insuranceManage.jsp");
		}else {
			request.setAttribute("iList", iList);
			request.setAttribute("p", p);
			view = request.getRequestDispatcher("views/manage/insuranceManage.jsp");
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
