package noticeBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import noticeBoard.model.dao.noticeBoardDao;
import noticeBoard.model.vo.noticeBoard;

import static common.JDBCTemplete.*;

public class noticeBoardService {
	
	//전체 게시글 수 조회 메소드
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new noticeBoardDao().getListCount(conn);
		close(conn);
		
		
		return listCount;
	}

	//화면에 뿌려 줄 게시판 리스트 조회 메소드(select 작업)
	public ArrayList selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList list = new noticeBoardDao().selectList(conn,currentPage,limit);
		
		close(conn);
		
		return list;
	}
	
	//공지사항 글 작성(insert작업)
	public int insertBoard(noticeBoard nb) {
		Connection conn = getConnection();
		
		int result = new noticeBoardDao().insertBoard(conn,nb);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	//공지사항 글 번호로 글 조회(상세보기-Detail에 뿌릴 것 -select작업)
	public noticeBoard selectBoard(int nno2) {
		Connection conn = getConnection();
		noticeBoard notiBoard = new noticeBoardDao().selectBoard(conn,nno2);
		
		close(conn);
		
		return notiBoard;
	}
	
	//공지사항 글 수정(update 작업)
//	public int updateBoard(noticeBoard nb, int nno2) {
//		Connection conn = getConnection();
//		
//		int result = new noticeBoardDao().updateBoard(conn,nb,nno2);
//		
//		if(result>0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return result;
//		
//	}
	
	//공지사항 글 삭제(delete 작업)
	public int deletenoticeBoard(int nno2) {
		Connection conn = getConnection();
		
		int result = new noticeBoardDao().deletenoticeBoard(conn,nno2);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	//공지사항 글 수정(update 작업)
	public int updateBoard(noticeBoard nb) {
		Connection conn = getConnection();
		
		int result = new noticeBoardDao().updateBoard(conn,nb);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
		
	}
	
	//공지사항 글 검색
	public ArrayList searchBoard(String selectBox, String word) {
		Connection conn = getConnection();
		
		ArrayList list = new noticeBoardDao().searchBoard(conn,selectBox,word);
		
		close(conn);
		
		return list;
		
	}



}
