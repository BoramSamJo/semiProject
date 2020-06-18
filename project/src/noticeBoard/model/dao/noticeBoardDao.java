package noticeBoard.model.dao;

import static common.JDBCTemplete.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import noticeBoard.model.vo.noticeBoard;

public class noticeBoardDao {

	//전체 게시글 수 조회 메소드
	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT COUNT(*) FROM NOTICEBOARD"; //8개 반환
		
		int result =0;
		
		try {
			pstmt=conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return result;
	}

	//화면에 뿌려 줄 게시판 리스트 조회 메소드
	public ArrayList selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList list = new ArrayList();
		
		int startRow = (currentPage-1)*limit +1;
		int endRow = currentPage *limit;
		
//출력확인		System.out.println("startRow: " +startRow +",endRow: " + endRow);
		
		String query ="SELECT * FROM (SELECT * FROM NOTICEBOARD ORDER BY N_NO DESC) A WHERE N_NO BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				noticeBoard b = new noticeBoard(rs.getInt("N_NO"),
												rs.getInt("MEMBER_NO"),
												rs.getString("N_TITLE"),
												rs.getString("N_CONTENT"),
												rs.getDate("CREATE_DATE"),
												rs.getDate("MODIFY_DATE"),
												rs.getString("STATUS"));
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}
				
		return list;
	}
	

	
	//공지사항 글 작성(insert작업)
	public int insertBoard(Connection conn, noticeBoard nb) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO NOTICEBOARD VALUES((SELECT MAX(N_NO)+1 FROM NOTICEBOARD),?,?,?,SYSDATE,SYSDATE,'Y')";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, nb.getMemberNo());
			pstmt.setString(2, nb.getnTitle());
			pstmt.setString(3, nb.getnContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//공지사항 글 번호로 글 조회(상세보기-Detail에 뿌릴 것)
	public noticeBoard selectBoard(Connection conn, int nno2) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		noticeBoard notiBoard = null;
		
		String query = "SELECT * FROM NOTICEBOARD WHERE N_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, nno2);
			
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				notiBoard = new noticeBoard(rs.getInt("N_NO"),
						rs.getInt("MEMBER_NO"),
						rs.getString("N_TITLE"),
						rs.getString("N_CONTENT"),
						rs.getDate("CREATE_DATE"),
						rs.getDate("MODIFY_DATE"),
						rs.getString("STATUS"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return notiBoard;
	}

	
	//공지사항 글 수정(update 작업)
//	public int updateBoard(Connection conn, noticeBoard nb, int nno2) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query ="UPDATE NOTICEBOARD SET N_TITLE=?,N_CONTENT=?,MODIFY_DATE=SYSDATE WHERE N_NO=?";
//		
//		try {
//			pstmt=conn.prepareStatement(query);
//			pstmt.setString(1, nb.getnTitle());
//			pstmt.setString(2, nb.getnContent());
//			pstmt.setInt(3, nno2); 
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}
//		
//		return result;
//		
//	}
	
	//공지사항 삭제(delete작업)
	public int deletenoticeBoard(Connection conn, int nno2) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM NOTICEBOARD WHERE N_NO=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, nno2);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//공지사항 글 수정(update 작업)
	public int updateBoard(Connection conn, noticeBoard nb) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query ="UPDATE NOTICEBOARD SET N_TITLE=?,N_CONTENT=?,MODIFY_DATE=SYSDATE WHERE N_NO=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, nb.getnTitle());
			pstmt.setString(2, nb.getnContent());
			pstmt.setInt(3, nb.getnNo()); 
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//글 검색 기능
	public ArrayList searchBoard(Connection conn, String selectBox, String word) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList list = new ArrayList();
		
		try {
		//제목으로 검색
		if(selectBox.equals("ntilte")) {
			String query ="SELECT * FROM NOTICEBOARD WHERE N_TITLE LIKE ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+word+"%");

			
		//내용으로 검색	
		}else if(selectBox.equals("ncontent")) {
			String query ="SELECT * FROM NOTICEBOARD WHERE N_CONTENT LIKE ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+word+"%");
		
			
		//제목+내용으로 검색	
		}else if(selectBox.equals("ntitle_content")) {
			String query ="SELECT * FROM NOTICEBOARD WHERE N_CONTENT LIKE ? OR N_TITLE LIKE ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+word+"%");
			pstmt.setString(2, "%"+word+"%");
		
			
		//나머지
		}else {
			String query="SELECT * FORM NOTICEBOARD";
			pstmt = conn.prepareStatement(query);
		}
		
		rs = pstmt.executeQuery();
		while(rs.next()) {
			noticeBoard b = new noticeBoard(rs.getInt("N_NO"),
					rs.getInt("MEMBER_NO"),
					rs.getString("N_TITLE"),
					rs.getString("N_CONTENT"),
					rs.getDate("CREATE_DATE"),
					rs.getDate("MODIFY_DATE"),
					rs.getString("STATUS"));
			
			list.add(b);
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
		close(rs);
	}
	return list;
	
	}
}



