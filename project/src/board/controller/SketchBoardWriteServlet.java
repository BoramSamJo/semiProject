package board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.model.service.QnAService;
import board.model.service.SketchBoardService;
import board.model.vo.Attachment;
import board.model.vo.SketchBoard;
import member.model.vo.Member;

/**
 * Servlet implementation class SketchBoardWriteServlet
 */
@WebServlet("/write.sb")
public class SketchBoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SketchBoardWriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		
		String userId = (String)request.getSession().getAttribute("userId");
		if(userId==null) {
			userId = ((Member)request.getSession().getAttribute("loginUser")).getmId();
		}
		
		System.out.println(userId);
		
		int mNo = new SketchBoardService().selectMemberNo(userId);

		int maxSize = 1024 * 1024 * 10;

		String root = request.getSession().getServletContext().getRealPath("/"); // web/와 같음, getRealPath("/")를 안붙이면 경로가
																					// path:~와 같은 식으로 표현 됨
		System.out.println(root);
		String savePath = root + "uploadFiles/"; // c드라이브 기준으로 적어야 됨, /로 끝내야 됨
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		String title = multiRequest.getParameter("title");
		String content = multiRequest.getParameter("textarea");
		
		SketchBoard sb = new SketchBoard();
		sb.setSbTitle(title);
		sb.setSbContent(content);
		sb.setMemberNo(mNo);

		ArrayList<String> changeName = new ArrayList<>();

		ArrayList<String> originName = new ArrayList<>();

		// getFileNames() - form태그에서 전송된 파일 리스트들의 name들을 반환한다.
		Enumeration<String> files = multiRequest.getFileNames(); // 반환형이 enumeration임 -> hasMoreElements로 꺼냄
		while (files.hasMoreElements()) {

			// 전송 순서 역순으로 파일을 가져옴
			String name = files.nextElement();

			if (multiRequest.getFilesystemName(name) != null) {
				// getFilesystemName() - 다른 이름으로 변화된(rename) 파일을 가져오는 메소드
				changeName.add(multiRequest.getFilesystemName(name));
				// getOriginalFileName() - 실제 사용자가 업로드 했던 파일명
				originName.add(multiRequest.getOriginalFileName(name));

				// 두 개 같이 저장중이니까 리스트 사이즈가 같음
			}
		}
		
		System.out.println("changeName : " + changeName);
		System.out.println("originName : " + originName);
		
		
		ArrayList<Attachment> fileList = new ArrayList<>();
		// 역순으로 파일이 list에 저장되었기 때문에 반복문을 통해 다시 역순을 수행해서 전송하자
		// 파일에 대한 모든 정보를 저장함
		for(int i = originName.size()-1; i>= 0; i--) {	//for문 잘 확인할 것
			Attachment at = new Attachment();
			at.setFilePath(savePath);
			at.setOriginName(originName.get(i));
			at.setChangeName(changeName.get(i));
			
			fileList.add(at);
		}
		
		int result = new SketchBoardService().insertSketchBoard(sb, fileList);

		if (result > 0) {
			response.sendRedirect("list.sb?currentPage=1"); // 경로상 이동이기 때문에 sendRedirect 사용
		} else {
			request.setAttribute("msg", "게시글 작성 실패");
			request.getRequestDispatcher("views/board/sketchBoardList.jsp").forward(request, response);
			;
		}
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
