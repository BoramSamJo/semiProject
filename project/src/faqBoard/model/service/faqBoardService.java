package faqBoard.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import faqBoard.model.dao.faqBoardDao;
import faqBoard.model.vo.faqBoard;
/*import noticeBoard.model.dao.noticeBoardDao;*/
import noticeBoard.model.dao.noticeBoardDao;
import noticeBoard.model.vo.noticeBoard;

public class faqBoardService {
	
	//1. 게시판 리스트 총 갯수 구하기
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new faqBoardDao().getListCount(conn);
		close(conn);
		
		
		return listCount;
	}

	//화면에 뿌려 줄 게시판 리스트 조회(select)
	public ArrayList selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList list = new faqBoardDao().selectList(conn,currentPage,limit);
		
		close(conn);
		
		return list;
	}

	//faq 삭제 기능
	public int deletefaqBoard(int fno2, int cno2) {
		Connection conn = getConnection();
		
		int result = new faqBoardDao().deletefaqBoard(conn,fno2, cno2);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
		
		return result;
	
	}
	
	//검색 기능(관리자)
	public ArrayList searchBoard(String selectBox,String word) {
		Connection conn = getConnection();
		
		ArrayList list = new faqBoardDao().searchBoard(conn,selectBox,word);
		
		close(conn);
		
		return list;
	}
	
	//검색 기능(사용자)
		public ArrayList searchBoard1(String word) {
			Connection conn = getConnection();
			
			ArrayList list = new faqBoardDao().searchBoard1(conn,word);
			
			close(conn);
			
			return list;
		}
	

	
	
	//카테고리 리스트
	public ArrayList selectcateList(String cate) {
		Connection conn = getConnection();
		
		ArrayList list = new faqBoardDao().selectcateList(conn,cate);
		
		close(conn);
		
		return list;

	}

	// 글 작성(insert작업)
	public int insertBoard(faqBoard fb,String selectBox) {
		Connection conn = getConnection();
		
		int result = new faqBoardDao().insertBoard(conn,fb,selectBox);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}

	//faq상세보기(관리자)
	public faqBoard selectfBoard(int fno2, int cno2) {
		Connection conn = getConnection();
		faqBoard fBoard = new faqBoardDao().selectfBoard(conn,fno2,cno2);
		
		close(conn);
		
		return fBoard;
	
	}

	//글 수정
	public int updatefBoard(faqBoard fbu) {
		Connection conn = getConnection();
		
		int result = new faqBoardDao().updatefBoard(conn,fbu);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
		return result;
	}
	

	
	//카테고리 리스트
//	public ArrayList categoryselectList(int currentPage, int limit, int categorych) {
//		Connection conn = getConnection();
//		ArrayList list = new faqBoardDao().categoryselectList(conn,currentPage,limit,categorych);
//		
//		close(conn);
//		
//		return list;
//		
//	}

	


}
