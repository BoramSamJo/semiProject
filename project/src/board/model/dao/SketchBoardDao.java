package board.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.model.vo.Attachment;
import board.model.vo.Reply;
import board.model.vo.SketchBoard;

public class SketchBoardDao {

	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "SELECT COUNT(*) FROM SKETCHBOARD";

		int listCount = 0;

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return listCount;
	}

	// 전체 글 조회를 위한 리스트
	public ArrayList<SketchBoard> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<SketchBoard> list = new ArrayList<>();

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = currentPage * limit;

		String query = "SELECT * FROM(SELECT ROWNUM RNUM, S.* FROM SKETCHBOARD S ORDER BY SB_NO DESC) WHERE RNUM BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SketchBoard sb = new SketchBoard(rs.getInt("SB_NO"), rs.getInt("MEMBER_NO"), rs.getString("SB_TITLE"),
						rs.getString("SB_CONTENT"), rs.getDate("CREATE_DATE"), rs.getDate("MODIFY_DATE"),
						rs.getInt("COUNT"), rs.getString("STATUS"));
				list.add(sb);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 전체 글 조회를 위한 사진 리스트
	public ArrayList<Attachment> selectFlist(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Attachment> fList = new ArrayList<>();

		String query = "SELECT* FROM ATTACHMENT ORDER BY SB_NO DESC";
		try {
			pstmt = conn.prepareStatement(query);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				Attachment at = new Attachment(rs.getInt("FILE_NO"), 
												rs.getInt("SB_NO"), 
												rs.getString("ORIGIN_NAME"),
												rs.getString("CHANGE_NAME"), 
												rs.getString("FILE_PATH"), 
												rs.getDate("UPLOAD_DATE"));
				fList.add(at);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return fList;
	}

	// 게시글 상세보기
	public ArrayList<SketchBoard> selectList(Connection conn, SketchBoard sb) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<SketchBoard> list = new ArrayList<>();

		String query = "SELECT * FROM SKETCHBOARD WHERE SB_NO = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sb.getSbNo());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SketchBoard s = new SketchBoard(rs.getInt("SB_NO"), rs.getInt("MEMBER_NO"), rs.getString("SB_TITLE"),
						rs.getString("SB_CONTENT"), rs.getDate("CREATE_DATE"), rs.getDate("MODIFY_DATE"),
						rs.getInt("COUNT"), rs.getString("STATUS"));
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	//	게시글 상세보기
	public ArrayList<Attachment> selectFList(Connection conn, SketchBoard sb) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Attachment> fList = new ArrayList<>();

		String query = "SELECT * FROM ATTACHMENT WHERE SB_NO = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sb.getSbNo());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Attachment at = new Attachment(rs.getInt("FILE_NO"), rs.getInt("SB_NO"), rs.getString("ORIGIN_NAME"),
						rs.getString("CHANGE_NAME"), rs.getString("FILE_PATH"), rs.getDate("UPLOAD_DATE"));
				fList.add(at);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return fList;
	}

	// 조회수 증가
	public int updateCount(Connection conn, int sbNo) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = "UPDATE SKETCHBOARD SET COUNT = COUNT+1 WHERE SB_NO = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}
	
	// 게시글 상세보기
	public SketchBoard selectList(Connection conn, int sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		SketchBoard sb = new SketchBoard();

		String query = "SELECT * FROM SKETCHBOARD WHERE SB_NO = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				sb = new SketchBoard(rs.getInt("SB_NO"), rs.getInt("MEMBER_NO"), rs.getString("SB_TITLE"),
						rs.getString("SB_CONTENT"), rs.getDate("CREATE_DATE"), rs.getDate("MODIFY_DATE"),
						rs.getInt("COUNT"), rs.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return sb;
	}
	
	// 게시글 상세보기
	public Attachment selectFlist(Connection conn, int sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Attachment at = new Attachment();

		String query = "SELECT * FROM ATTACHMENT WHERE SB_NO = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				at = new Attachment(rs.getInt("FILE_NO"), rs.getInt("SB_NO"), rs.getString("ORIGIN_NAME"),
						rs.getString("CHANGE_NAME"), rs.getString("FILE_PATH"), rs.getDate("UPLOAD_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return at;
	}

	// 게시글 작성(제목, 글)
	public int insertSketchBoard(Connection conn, SketchBoard sb) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = "INSERT INTO SKETCHBOARD VALUES((SELECT ISNULL(MAX(SB_NO) + 1, 1) FROM SKETCHBOARD), 34, ?, ?, SYSDATE, SYSDATE, 0, 'Y')";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sb.getSbTitle());
			pstmt.setString(2, sb.getSbContent());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	// 게시글 작성(사진)
	public int insertSketchBoard2(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO ATTACHMENT VALUES((SELECT ISNULL(MAX(FILE_NO) + 1, 1) FROM ATTACHMENT), (SELECT ISNULL(MAX(SB_NO) + 1, 1) FROM ATTACHMENT), ?, ?, ?, SYSDATE)";

		try {
			for (int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);

					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, at.getOriginName());
					pstmt.setString(2, at.getChangeName());
					pstmt.setString(3, at.getFilePath());

				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public int insertReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO SB_REPLY VALUES((SELECT ISNULL(MAX(R_NO) + 1, 1) FROM SB_REPLY), (SELECT ISNULL(MAX(SB_NO) + 1, 1) FROM SB_REPLY), (SELECT ISNULL(MAX(MEMBER_NO) + 1, 1) FROM SB_REPLY), ?, SYSDATE, SYSDATE, 'Y')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getrContent());
			
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Reply> rList = new ArrayList<>();
		
		String query = "SELECT * FROM REPLY WHERE SB_NO = ?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rList.add(new Reply(rs.getInt("R_NO"),
									rs.getInt("SB_NO"),
									rs.getInt("MEMBER_NO"),
									rs.getString("R_CONTENT"),
									rs.getDate("CREATE_DATE"),
									rs.getDate("MODIFY_DATE"),
									rs.getString("STATUS")));
				
			}
			System.out.println(rList);
		} catch (SQLException e) {
						e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		
		return rList;
	}

}
