package board.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.model.vo.Pagination;
import board.model.vo.QAnswer;
import board.model.vo.QnABoard;
import member.model.vo.Member;

public class QnADao {

	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		String query = "SELECT COUNT(*) FROM QNABOARD WHERE STATUS = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return listCount;
	}

	
	public ArrayList<QnABoard> selectQnAList(Connection conn, Pagination p) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnABoard q = null;
		ArrayList<QnABoard> qlist = new ArrayList<>();
		
		int currentPage = p.getCurrentPage();
		int limit = p.getLimit();
		int startRow = (currentPage-1)*limit+1;
		int endRow = currentPage*limit;

		
		String query = "SELECT * \r\n" + 
				"FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT Q_NO,  Q_TITLE, Q_CONTENT, Q.CREATE_DATE, Q.MODIFY_DATE, Q.STATUS, Q_PWD, MEMBER_NO, ANSWER, MEMBER_NAME, QC_NAME\r\n" + 
				"                                                                                FROM QNABOARD Q\r\n" + 
				"                                                                                JOIN Q_CATEGORY USING(QC_NO)\r\n" + 
				"                                                                                JOIN MEMBER USING(MEMBER_NO) \r\n" + 
				"                                                                                WHERE Q.STATUS='Y'\r\n" + 
				"                                                                                ORDER BY CREATE_DATE DESC) A\r\n" + 
				"                                                                                )\r\n" + 
				"WHERE RNUM BETWEEN ? AND ?";
//		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				q = new QnABoard(
								rs.getInt(1)
								, rs.getInt("Q_NO")
								, rs.getString("MEMBER_NAME")
								, rs.getString("Q_TITLE")
								, rs.getString("Q_CONTENT")
								, rs.getString("CREATE_DATE")
								, rs.getString("MODIFY_DATE")
								, rs.getString("Q_PWD")
								, rs.getString("ANSWER")
								, rs.getString("QC_NAME")
								, rs.getInt("MEMBER_NO")
								, rs.getString("STATUS")
								);
				qlist.add(q);
//				System.out.println(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return qlist;
	}


	public ArrayList<QAnswer> selectQAnswerList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QAnswer qA = null;
		ArrayList<QAnswer> qAList = new ArrayList<>();
		
		String query = "SELECT * FROM Q_ANSWER WHERE STATUS='Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				qA = new QAnswer(
								rs.getInt("QA_NO")
								, rs.getInt("MEMBER_NO")
								, rs.getInt("Q_NO")
								, rs.getString("A_CONTENT")
								, rs.getString("CREATE_DATE")
								, rs.getString("MODIFY_DATE")
								, rs.getString("STATUS")
								);
				qAList.add(qA);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return qAList;
	}

	
	public int getSearchQListCount(Connection conn, String colName, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		String query = "SELECT COUNT(*) FROM QNABOARD JOIN MEMBER USING(MEMBER_NO) WHERE QNABOARD.STATUS = 'Y' AND "+colName+" LIKE '%"+searchText+"%'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return listCount;
	}

	
	public ArrayList<QnABoard> searchQnAList(Connection conn, Pagination p, String colName, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnABoard q = null;
		ArrayList<QnABoard> qlist = new ArrayList<>();
		
		int currentPage = p.getCurrentPage();
		int limit = p.getLimit();
		int startRow = (currentPage-1)*limit+1;
		int endRow = currentPage*limit;
		
		String query = "SELECT * \r\n" + 
				"FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT Q_NO,  Q_TITLE, Q_CONTENT, Q.CREATE_DATE, Q.MODIFY_DATE, Q.STATUS, Q_PWD, ANSWER, MEMBER_NAME, QC_NAME\r\n" + 
				"                                                                                FROM QNABOARD Q\r\n" + 
				"                                                                                JOIN Q_CATEGORY USING(QC_NO)\r\n" + 
				"                                                                                JOIN MEMBER USING(MEMBER_NO) \r\n" + 
				"                                                                                WHERE Q.STATUS='Y'  AND "+colName+" LIKE '%"+searchText+"%'\r\n" + 
				"                                                                                ORDER BY CREATE_DATE DESC) A\r\n" + 
				"                                                                                )\r\n" + 
				"WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				q = new QnABoard(
								rs.getInt(1)
								, rs.getInt("Q_NO")
								, rs.getString("MEMBER_NAME")
								, rs.getString("Q_TITLE")
								, rs.getString("Q_CONTENT")
								, rs.getString("CREATE_DATE")
								, rs.getString("MODIFY_DATE")
								, rs.getString("Q_PWD")
								, rs.getString("ANSWER")
								, rs.getString("QC_NAME")
								, rs.getString("STATUS")
								);
				qlist.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return qlist;
	}
	

	public ArrayList<QAnswer> searchQAnswerList(Connection conn, String colName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QAnswer qA = null;
		ArrayList<QAnswer> qAList = new ArrayList<>();
		
		String query = "SELECT * FROM Q_ANSWER WHERE STATUS='Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				qA = new QAnswer(
								rs.getInt("QA_NO")
								, rs.getInt("MEMBER_NO")
								, rs.getInt("Q_NO")
								, rs.getString("A_CONTENT")
								, rs.getString("CREATE_DATE")
								, rs.getString("MODIFY_DATE")
								, rs.getString("STATUS")
								);
				qAList.add(qA);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return qAList;
	}

	
	public int selectMemberNo(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int mNo = 0;
		
		String query = "SELECT MEMBER_NO FROM MEMBER WHERE MEMBER_ID =?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mNo = rs.getInt("MEMBER_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return mNo;
	}
	
	
	public int insertQnaAsk(Connection conn, int mNo, String title, String password, int category,
			String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO QNABOARD VALUES((SELECT NVL(MAX(Q_NO), 0)+1 FROM QNABOARD), ?, ?, ?, SYSDATE, SYSDATE, DEFAULT, ?, DEFAULT, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, password);
			pstmt.setInt(5, category);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertAnswer(Connection conn, int mNo, int qNo, String qAContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		
		
		try {
			for(int i = 0; i < 2; i++) {
				if(i==0) {
					query = "INSERT INTO Q_ANSWER VALUES((SELECT NVL(MAX(QA_NO), 0)+1 FROM Q_ANSWER), ?, ?, ?, SYSDATE, SYSDATE, 'Y')";
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, mNo);
					pstmt.setInt(2, qNo);
					pstmt.setString(3, qAContent);
					result = pstmt.executeUpdate();
				}else {
					query = "UPDATE QNABOARD SET ANSWER='Y' WHERE Q_NO = ?";
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, qNo);
					result += pstmt.executeUpdate();
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public int updateAnswer(Connection conn,String qANo, String qAContent, int qNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		
		try {
			for(int i = 0; i < 2; i++) {
				if(i==0) {
					query = "UPDATE Q_ANSWER SET A_CONTENT=? WHERE QA_NO = ?";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, qAContent);
					pstmt.setString(2, qANo);
					result = pstmt.executeUpdate();
				}else {
					query = "UPDATE QNABOARD SET ANSWER='Y' WHERE Q_NO = ?";
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, qNo);
					result += pstmt.executeUpdate();
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteQnA(Connection conn, String qNo, String qANo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		
		try {
			for(int i = 0; i < 2; i++) {
				if(i==0) {
					query = "UPDATE QNABOARD SET STATUS='N' WHERE Q_NO = ?";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, qNo);
					result = pstmt.executeUpdate();
				}else {
					query = "UPDATE Q_ANSWER SET STATUS='N' WHERE QA_NO = ?";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, qANo);
					result += pstmt.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
