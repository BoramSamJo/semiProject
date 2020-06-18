package faqBoard.model.service;

import static common.JDBCTemplete.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import faqBoard.model.dao.faqBoardDao;
import faqBoard.model.vo.faqBoard;
/*import noticeBoard.model.dao.noticeBoardDao;*/
import noticeBoard.model.dao.noticeBoardDao;

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
	public int deletefaqBoard(int fno2) {
		Connection conn = getConnection();
		
		int result = new faqBoardDao().deletefaqBoard(conn,fno2);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
		
		return result;
	
	}
	
	//검색 기능
	public ArrayList searchBoard(String word) {
		Connection conn = getConnection();
		
		ArrayList list = new faqBoardDao().searchBoard(conn,word);
		
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
