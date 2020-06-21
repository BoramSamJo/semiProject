package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.QnADao;
import board.model.vo.Pagination;
import board.model.vo.QAnswer;
import board.model.vo.QnABoard;
import member.model.dao.MemberDao;

public class QnAService {
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new QnADao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<QnABoard> selectQnAList(Pagination p) {
		Connection conn = getConnection();
		
		ArrayList<QnABoard> qList = new QnADao().selectQnAList(conn, p);
		
		close(conn);
		
		return qList;
	}

	public ArrayList<QAnswer> selectQAnswerList() {
		Connection conn = getConnection();
		
		ArrayList<QAnswer> qAList = new QnADao().selectQAnswerList(conn);
		
		close(conn);
		
		return qAList;
	}
	
	public int getSearchQListCount(String colName, String searchText) {
		Connection conn = getConnection();
		
		int listCount = new QnADao().getSearchQListCount(conn, colName, searchText);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<QnABoard> searchQnAList(Pagination p, String colName, String searchText) {
		Connection conn = getConnection();
		
		ArrayList<QnABoard> qList = new QnADao().searchQnAList(conn, p, colName, searchText);
		
		close(conn);
		
		return qList;
	}

	public ArrayList<QAnswer> searchQAnswerList(String colName) {
		Connection conn = getConnection();
		
		ArrayList<QAnswer> qAList = new QnADao().searchQAnswerList(conn, colName);
		
		close(conn);
		
		return qAList;
	}

	
	public int selectMemberNo(String userId) {
		Connection conn = getConnection();
		
		int mNo = new QnADao().selectMemberNo(conn, userId);
		
		close(conn);
		
		return mNo;
	}
	
	
	public int insertQnaAsk(int mNo, String title, String password, int category, String content) {
		Connection conn = getConnection();
		
		int result = new QnADao().insertQnaAsk(conn, mNo, title, password, category, content);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertAnswer(int mNo, int qNo, String qAContent) {
		Connection conn = getConnection();
		
		int result = new QnADao().insertAnswer(conn, mNo, qNo, qAContent);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int updateAnswer(String qANo, String qAContent, int qNo) {
		Connection conn = getConnection();
		
		int result = new QnADao().updateAnswer(conn, qANo, qAContent, qNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int deleteQnA(String qNo, String qANo) {
		Connection conn = getConnection();
		
		int result = new QnADao().deleteQnA(conn, qNo, qANo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int getSearchByCategoryListCount(String colName, String givenQuery, int colCategory) {
		Connection conn = getConnection();
		
		int listCount = new QnADao().getSearchByCategoryListCount(conn, colName, givenQuery, colCategory);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<QnABoard> searchByQCategory(Pagination p, String colName, String givenQuery, int colCategory) {
		Connection conn = getConnection();
		
		ArrayList<QnABoard> qList = new QnADao().searchByQCategory(conn, p, colName, givenQuery, colCategory);
		
		close(conn);
		
		return qList;
	}

	public int getSearchByAnswerListCount(String colName, String givenQuery, String aStatus) {
		Connection conn = getConnection();
		
		int listCount = new QnADao().getSearchByAnswerListCount(conn, colName, givenQuery, aStatus);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<QnABoard> searchByQAnswer(Pagination p, String colName, String givenQuery, String aStatus) {
		Connection conn = getConnection();
		
		ArrayList<QnABoard> qList = new QnADao().searchByQAnswer(conn, p, colName, givenQuery, aStatus);
		
		close(conn);
		
		return qList;
	}

	public int getSearchByTextListCount(String colName, String givenQuery, String searchText) {
		Connection conn = getConnection();
		
		int listCount = new QnADao().getSearchByTextListCount(conn, colName, givenQuery, searchText);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<QnABoard> searchByQText(Pagination p, String colName, String givenQuery, String searchText) {
		Connection conn = getConnection();
		
		ArrayList<QnABoard> qList = new QnADao().searchByQText(conn, p, colName, givenQuery, searchText);
		
		close(conn);
		
		return qList;
	}


}
