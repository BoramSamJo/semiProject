package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.SketchBoardDao;
import board.model.vo.Attachment;
import board.model.vo.Reply;
import board.model.vo.SketchBoard;

public class SketchBoardService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new SketchBoardDao().getListCount(conn);

		close(conn);
		
		return listCount;
	}

	public ArrayList<SketchBoard> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		
		ArrayList list = new SketchBoardDao().selectList(conn, currentPage, limit);
		
		close(conn);
		
		
		return list;
	}


	public ArrayList<SketchBoard> selectList(SketchBoard sb) {
		Connection conn = getConnection();
		
		ArrayList<SketchBoard> list = new SketchBoardDao().selectList(conn, sb);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Attachment> selectFlist(SketchBoard sb) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> fList = new SketchBoardDao().selectFList(conn, sb);
		
		close(conn);
		
		return fList;
	}

	public int updateCount(int sbNo) {
		Connection conn = getConnection();
		
		int result = new SketchBoardDao().updateCount(conn, sbNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public SketchBoard selectList(int sbNo) {
		
		Connection conn = getConnection();
		
		SketchBoard sb = new SketchBoardDao().selectList(conn, sbNo);
		
		close(conn);
		
		return sb;
	}

	public Attachment selectFlist(int sbNo) {
		Connection conn = getConnection();
		
		Attachment at = new SketchBoardDao().selectFlist(conn, sbNo);
		
		close(conn);
		
		return at;
	}

	public int insertSketchBoard(SketchBoard sb) {
		Connection conn = getConnection();
		
		int result = new SketchBoardDao().insertSketchBoard(conn, sb);
		
		close(conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
		
	}

	public ArrayList<Attachment> selectFlist() {
		Connection conn = getConnection();
		
		ArrayList<Attachment> fList = new SketchBoardDao().selectFlist(conn);
		
		close(conn);
		
		return fList;
	}

	public int insertSketchBoard(SketchBoard sb, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		SketchBoardDao sbd = new SketchBoardDao();
		
		int result = sbd.insertSketchBoard(conn, sb);
		int result2 = sbd.insertSketchBoard2(conn, fileList);
		
		if(result > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
			result = 0;
		}
		
		close(conn);
		return result;

	}

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		
		SketchBoardDao sbd = new SketchBoardDao();
		
		int result = sbd.insertReply(conn, r);
		
		ArrayList<Reply> rList = new ArrayList<>();
		
		if(result>0) {
			commit(conn);
			rList = sbd.selectReplyList(conn, r.getSbNo());
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		return rList;
	}

}

