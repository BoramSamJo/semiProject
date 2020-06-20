package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.QnAService;

/**
 * Servlet implementation class ManageQWriteAnswerServlet
 */
@WebServlet("/writeAnswer.bo")
public class ManageQWriteAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageQWriteAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mNoS = request.getParameter("mNo");
		String qNoS = request.getParameter("qNo");
		String qAContent = request.getParameter("qAContent");
		String isUpdate = request.getParameter("isUpdate");
		
		System.out.println(isUpdate);
		
		int mNo = Integer.valueOf((mNoS.trim()));
		int qNo = Integer.valueOf((qNoS.trim()));
		
		int result = 0;
		if(isUpdate.equals("false")) {
			result = new QnAService().insertAnswer(mNo, qNo, qAContent);
			PrintWriter out = response.getWriter();
			if(result>0) {
				out.print("답변이 추가되었습니다");
				out.flush();
				out.close();
			}else {
				out.print("답변 추가 실패");
				out.flush();
				out.close();
			}
		}else {
			String qANo = request.getParameter("qANo").trim();
			result = new QnAService().updateAnswer(qANo, qAContent, qNo);
			PrintWriter out = response.getWriter();
			if(result>0) {
				out.print("답변이 수정되었습니다");
				out.flush();
				out.close();
			}else {
				out.print("답변 수정 실패");
				out.flush();
				out.close();
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
