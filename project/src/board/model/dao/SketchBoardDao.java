package board.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.model.vo.Attachment;
import board.model.vo.SbReply;
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

		String query = "SELECT * FROM(SELECT ROWNUM RNUM, S.* FROM SKETCHBOARD S ORDER BY SB_NO DESC) WHERE (RNUM BETWEEN ? AND ?) AND STATUS = 'Y'";

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
	
	//전체 글 사진 불러오기
	public ArrayList<Attachment> selectFlist(Connection conn, ArrayList<SketchBoard> list) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SketchBoard sb = new SketchBoard();
		int sbNo = 0;

		ArrayList<Attachment> fList = new ArrayList<>();

		String query = "SELECT * FROM ATTACHMENT WHERE SB_NO = ?";

		try {
			for (int i = 0; i < list.size(); i++) {
				sb = list.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, sb.getSbNo());

				rs = pstmt.executeQuery();

				while (rs.next()) {
					Attachment at = new Attachment(rs.getInt("FILE_NO"), rs.getInt("SB_NO"),
							rs.getString("ORIGIN_NAME"), rs.getString("CHANGE_NAME"), rs.getString("FILE_PATH"),
							rs.getDate("UPLOAD_DATE"));
					fList.add(at);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		System.out.println("사진 : " +fList);
		return fList;
	}

	// 게시글 상세보기(글)
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

	// 게시글 상세보기(사진)
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

	// 게시글 상세보기(글)
	public SketchBoard selectList(Connection conn, int sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		SketchBoard sb = new SketchBoard();

		String query = "SELECT SB_NO, S.MEMBER_NO, SB_TITLE, SB_CONTENT, CREATE_DATE, S.MODIFY_DATE, COUNT, S.STATUS, M.MEMBER_NAME FROM SKETCHBOARD S JOIN MEMBER M ON(S.MEMBER_NO=M.MEMBER_NO) WHERE SB_NO = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				sb = new SketchBoard(rs.getInt("SB_NO"), rs.getInt("MEMBER_NO"), rs.getString("SB_TITLE"),
						rs.getString("SB_CONTENT"), rs.getDate("CREATE_DATE"), rs.getDate("MODIFY_DATE"),
						rs.getInt("COUNT"), rs.getString("STATUS"), rs.getString("MEMBER_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return sb;
	}

	// 게시글 상세보기(사진)
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

		String query = "INSERT INTO SKETCHBOARD VALUES((SELECT NVL(MAX(SB_NO), 0)+1 FROM SKETCHBOARD), ?, ?, ?, SYSDATE, SYSDATE, 0, 'Y')";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sb.getMemberNo());
			pstmt.setString(2, sb.getSbTitle());
			pstmt.setString(3, sb.getSbContent());

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

		String query = "INSERT INTO ATTACHMENT VALUES((SELECT NVL(MAX(FILE_NO), 0)+1 FROM ATTACHMENT), (SELECT NVL(MAX(SB_NO), 0)+1 FROM ATTACHMENT), ?, ?, ?, SYSDATE)";

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

//		System.out.println("dao fwrite : " + result);
		return result;

	}
	
	
	// 댓글 작성
	public int insertReply(Connection conn, SbReply r) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO SB_REPLY VALUES((SELECT NVL(MAX(R_NO), 0)+1 FROM SB_REPLY), ?, ?, ?, SYSDATE, SYSDATE, 'Y')";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getSbNo());
			pstmt.setInt(2, r.getMemberNo());
			pstmt.setString(3, r.getrContent());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 댓글 불러오기
	public ArrayList<SbReply> selectReplyList(Connection conn, int sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<SbReply> rList = new ArrayList<>();

		String query = "SELECT * FROM (SELECT R_NO, S.SB_NO, S.MEMBER_NO, R_CONTENT, CREATE_DATE, S.MODIFY_DATE, S.STATUS, M.MEMBER_NAME FROM SB_REPLY S JOIN MEMBER M ON(S.MEMBER_NO = M.MEMBER_NO) ORDER BY CREATE_DATE DESC) WHERE SB_NO = ? AND STATUS='Y'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				rList.add(new SbReply(rs.getInt("R_NO"), rs.getInt("SB_NO"), rs.getInt("MEMBER_NO"),
						rs.getString("R_CONTENT"), rs.getDate("CREATE_DATE"), rs.getDate("MODIFY_DATE"),
						rs.getString("STATUS"), rs.getString("MEMBER_NAME")));

			}
//			System.out.println(rList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("dao에서 댓글 : " + rList);
		return rList;
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

			if (rs.next()) {
				mNo = rs.getInt("MEMBER_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return mNo;
	}

	// 게시글 검색
	public ArrayList<SketchBoard> searchSketchBoard(Connection conn, int currentPage, int limit, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<SketchBoard> list = new ArrayList<>();

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = currentPage * limit;

		String query = "SELECT * FROM(SELECT ROWNUM RNUM, S.* FROM SKETCHBOARD S ORDER BY SB_NO DESC) WHERE (SB_TITLE LIKE ? OR SB_CONTENT LIKE ?) AND (RNUM BETWEEN ? AND ?) AND STATUS='Y'";
        
		try {	
		pstmt = conn.prepareStatement(query);
        pstmt.setString(1, "%"+searchText+"%");
        pstmt.setString(2, "%"+searchText+"%");
        pstmt.setInt(3, startRow);
        pstmt.setInt(4, endRow);
		
        rs = pstmt.executeQuery();
        
        while(rs.next()) {
        	SketchBoard sb = new SketchBoard(rs.getInt("SB_NO"),
        									rs.getInt("MEMBER_NO"),
        									rs.getString("SB_TITLE"),
        									rs.getString("SB_CONTENT"),
        									rs.getDate("CREATE_DATE"),
        									rs.getDate("MODIFY_DATE"),
        									rs.getInt("COUNT"),
        									rs.getString("STATUS"));
        	list.add(sb);	
        }
		}catch(SQLException e) {
		      e.printStackTrace();
		   }finally {
		      close(pstmt);
		      close(rs);
		   }
		   
		System.out.println("검색 후 리스트 : " + list);
		return list;
	}

	// 댓글 수정
	public int modifyReply(Connection conn, SbReply sr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		System.out.println("dao에서 수정rNo : " + sr.getrNo());
		System.out.println("dao에서 댓글수정 : " + sr.getrContent());
		System.out.println("dao에서 수정mNo : " + sr.getMemberNo());
		System.out.println("dao에서 수정sbNo : " + sr.getSbNo());
		
		String query = "UPDATE SB_REPLY SET R_CONTENT=?, MODIFY_DATE=SYSDATE WHERE R_NO=? AND SB_NO=? AND MEMBER_NO=?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sr.getrContent());
			pstmt.setInt(2, sr.getrNo());
			pstmt.setInt(3, sr.getSbNo());
			pstmt.setInt(4, sr.getMemberNo()); 
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

	// 댓글 삭제
	public int deleteReply(Connection conn, SbReply sr) {
		PreparedStatement pstmt = null;
		int result = 0;

		System.out.println("dao에서 삭제rNo : " + sr.getrNo());
		System.out.println("dao에서 삭제mNo : " + sr.getMemberNo());
		System.out.println("dao에서 삭제sbNo : " + sr.getSbNo());
		
		String query = "UPDATE SB_REPLY SET STATUS='N' WHERE R_NO=? AND SB_NO=? AND MEMBER_NO=?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sr.getrNo());
			pstmt.setInt(2, sr.getSbNo());
			pstmt.setInt(3, sr.getMemberNo()); 
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int manageDeleteReply(Connection conn, SbReply sr) {
		PreparedStatement pstmt = null;
		int result = 0;

		System.out.println("dao에서 삭제mNo : " + sr.getMemberNo());
		System.out.println("dao에서 삭제sbNo : " + sr.getSbNo());
		
		String query = "UPDATE SB_REPLY SET STATUS='N' WHERE R_NO=? AND SB_NO=?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sr.getrNo());
			pstmt.setInt(2, sr.getSbNo());
 
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}
