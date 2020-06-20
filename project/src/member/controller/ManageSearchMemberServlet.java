package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Pagination;
import member.model.service.MemberService;
import member.model.vo.Animal;
import member.model.vo.Member;

/**
 * Servlet implementation class ManageSearchMemberServlet
 */
@WebServlet("/searchMember.me")
public class ManageSearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageSearchMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectFind = request.getParameter("selectFind");
		String searchText = request.getParameter("searchText");
		String completeDate = request.getParameter("completeDate");
		
		String colName = "";
		switch(selectFind) {
		case "FindUserName" : colName="MEMBER_NAME";
			break;
		case "FinduserId" : colName="MEMBER_ID";
			break;
		case "FindPhone" : colName="PHONE";
			break;
		case "FindIns" : colName="INS";//ins_list에 member_no가 매치되는 사람
			break;
		case "FindFu" : colName="FU";//fu_list에 member_no가 매치되는 사람
			break;
		}
		
		System.out.println(colName);
		
		
		if(completeDate==null) {//일반적인 서치하러 감
			//0. 페이징처리 
			//1) 리스트 총 개수 구하기
			int listCount = new MemberService().getSearchListCount(colName, searchText);
			System.out.println(listCount);
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
			
			ArrayList<Member> mList = new MemberService().searchMember(p, colName, searchText);
			
			ArrayList<Animal> aList = new MemberService().selectAllAnimal();
			
			RequestDispatcher veiw = null;
			if(listCount==0) {
				request.setAttribute("member", mList);
				request.setAttribute("animal", aList);
				request.setAttribute("p", p);
				request.setAttribute("isSearch", "true");
				request.getRequestDispatcher("views/manage/manageMember.jsp").forward(request, response);
				return;
			}
			if(!mList.isEmpty()) {
				request.setAttribute("member", mList);
				request.setAttribute("animal", aList);
				request.setAttribute("p", p);
				request.setAttribute("isSearch", "true");
				request.getRequestDispatcher("views/manage/manageMember.jsp").forward(request, response);
			}else {
				request.setAttribute("p", p);
				request.setAttribute("msg", "회원조회 실패");
				request.getRequestDispatcher("views/manage/manageMember.jsp").forward(request, response);
			}
			
		}else if(searchText==null) {//장례완료 회원 중 일정 날짜가 경과한 회원 조회
			//0. 페이징처리 
			//1) 리스트 총 개수 구하기
			int listCount = new MemberService().getForMailListCount(colName, completeDate);
			System.out.println(listCount);
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
			
			ArrayList<Member> mList = new MemberService().searchForMail(p, colName, completeDate);
			
			ArrayList<Animal> aList = new MemberService().selectAllAnimal();
			
			RequestDispatcher veiw = null;
			if(listCount==0) {
				request.setAttribute("member", mList);
				request.setAttribute("animal", aList);
				request.setAttribute("p", p);
				request.setAttribute("isSearch", "true");
				if(colName.equals("INS")) {
					request.setAttribute("isIns", "true");
				}else {
					request.setAttribute("isFu", "true");
				}
				request.getRequestDispatcher("views/manage/manageMember.jsp").forward(request, response);
				return;
			}
			if(!mList.isEmpty()) {
				request.setAttribute("member", mList);
				request.setAttribute("animal", aList);
				request.setAttribute("p", p);
				request.setAttribute("sendCompleteDate", completeDate);
				request.setAttribute("isSearch", "true");
				if(colName.equals("INS")) {
					request.setAttribute("isIns", "true");
				}else {
					request.setAttribute("isFu", "true");
				}
				request.getRequestDispatcher("views/manage/manageMember.jsp").forward(request, response);
			}else {
				request.setAttribute("p", p);
				request.setAttribute("msg", "회원조회 실패");
				request.getRequestDispatcher("views/manage/manageMember.jsp").forward(request, response);
			}
			
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
