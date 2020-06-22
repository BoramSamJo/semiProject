package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.QnADao;
import board.model.dao.SketchBoardDao;
import board.model.vo.Attachment;
import board.model.vo.SbReply;
import board.model.vo.SketchBoard;
import member.model.vo.Member;

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

	public ArrayList<Attachment> selectFlist(ArrayList<SketchBoard> list) {
		Connection conn = getConnection();

		ArrayList<Attachment> fList = new SketchBoardDao().selectFlist(conn, list);

		return fList;
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

		if (result > 0) {
			commit(conn);
		} else {
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

//	public ArrayList<Attachment> selectFlist() {
//		Connection conn = getConnection();
//
//		ArrayList<Attachment> fList = new SketchBoardDao().selectFlist(conn);
//
//		close(conn);
//
//		return fList;
//	}

	public int insertSketchBoard(SketchBoard sb, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();

		SketchBoardDao sbd = new SketchBoardDao();

		int result = sbd.insertSketchBoard(conn, sb);
		int result2 = sbd.insertSketchBoard2(conn, fileList);

		if (result > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
			result = 0;
		}

		close(conn);
		return result;

	}

	public ArrayList<SbReply> insertReply(SbReply r) {
		Connection conn = getConnection();

		SketchBoardDao sbd = new SketchBoardDao();

		int result = sbd.insertReply(conn, r);

		ArrayList<SbReply> rList = new ArrayList<>();
		

		if (result > 0) {
			commit(conn);
			rList = sbd.selectReplyList(conn, r.getSbNo());

		} else {
			rollback(conn);
		}

		close(conn);
		
		
		return rList;
	}

	public int selectMemberNo(String userId) {
		Connection conn = getConnection();

		int mNo = new SketchBoardDao().selectMemberNo(conn, userId);

		close(conn);

		return mNo;
	}




	public ArrayList<SketchBoard> selectList(int currentPage, int limit, String searchText) {
		Connection conn = getConnection();
		
		ArrayList<SketchBoard> list = new SketchBoardDao().searchSketchBoard(conn, currentPage, limit, searchText);
		
		return list;
	}

	public ArrayList<SbReply> selectReply(int sbNo) {
		Connection conn = getConnection();
		
		ArrayList<SbReply> rList = new SketchBoardDao().selectReplyList(conn, sbNo);
		
		System.out.println("service " + rList);
		return rList;
	}

	public int modifyReply(SbReply sr) {
		Connection conn = getConnection();
		
//		System.out.println("service에서 수정rNo : " + sr.getrNo());
//		System.out.println("service에서 댓글수정 : " + sr.getrContent());
//		System.out.println("service에서 수정mNo : " + sr.getMemberNo());
//		System.out.println("service에서 수정sbNo : " + sr.getSbNo());
		
		SketchBoardDao sbd = new SketchBoardDao();
	
		int result = sbd.modifyReply(conn, sr);
		
		
		if(result>0) {
			commit(conn);
			
			
		}else {
			rollback(conn);
			result=0;
		}
		
		close(conn);
		return result;
	}

	public int deleteReply(SbReply sr) {
		Connection conn = getConnection();
		
//		System.out.println("서비스에서 rNo : " + sr.getrNo());
//		System.out.println("서비스에서 mNo : " + sr.getMemberNo());
//		System.out.println("서비스에서 sbNo : " + sr.getSbNo());
		
		SketchBoardDao sbd = new SketchBoardDao();
	
		int result = sbd.deleteReply(conn, sr);
		
		
		System.out.println("서비스에서 결과 : " + result);
		
		
		if(result>0) {
			commit(conn);
			
		}else {
			rollback(conn);
			result=0;
		}
		
		System.out.println("서비스단에서 댓글삭제 : " + result);
		
		
		close(conn);
		return result;
	}

	public int manageDeleteReply(SbReply sr) {
		Connection conn = null;
		
		SketchBoardDao sbd = new SketchBoardDao();
		
		int result = sbd.manageDeleteReply(conn, sr);
		
		
		System.out.println("서비스에서 결과 : " + result);
		
		
		if(result>0) {
			commit(conn);
			
		}else {
			rollback(conn);
			result=0;
		}
		
		System.out.println("서비스단에서 댓글삭제 : " + result);
		
		
		close(conn);
		return result;
	
	}

	public int manageDeleteSketchBoard(SketchBoard sb) {
		
		return 0;
	}

}
