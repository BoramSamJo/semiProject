package faqBoard.model.dao;

import static common.JDBCTemplete.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import faqBoard.model.vo.faqBoard;
//import noticeBoard.model.vo.noticeBoard;

public class faqBoardDao {
	
	//전체 게시글 수 조회 메소드
	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT COUNT(*) FROM FAQBOARD";
		
		int result=0;
		
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
		int endRow = currentPage *limit -1;
		
		
		String query ="SELECT * FROM (SELECT * FROM FAQBOARD ORDER BY F_NO DESC) A WHERE F_NO BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				faqBoard b = new faqBoard(rs.getInt("F_NO"),
												rs.getInt("C_NO"),
												rs.getInt("MEMBER_NO"),
												rs.getString("F_TITLE"),
												rs.getString("F_CONTENT"),
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

	//faq삭제 
	public int deletefaqBoard(Connection conn, int fno2) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM FAQBOARD WHERE F_NO=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, fno2);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}

	//검색
	public ArrayList searchBoard(Connection conn, String word) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList list = new ArrayList();
		
		
		String query = "SELECT * FROM FAQBOARD WHERE F_CONTENT LIKE  ? OR F_TITLE LIKE ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+word+"%");
			pstmt.setString(2, "%"+word+"%");
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				faqBoard b = new faqBoard(rs.getInt("F_NO"),
						rs.getInt("C_NO"),
						rs.getInt("MEMBER_NO"),
						rs.getString("F_TITLE"),
						rs.getString("F_CONTENT"),
						rs.getDate("CREATE_DATE"),
						rs.getDate("MODIFY_DATE"),
						rs.getString("STATUS"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}


	
	//카테고리별 이동
	public ArrayList selectcateList(Connection conn, String cate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList list = new ArrayList();
		
		String cate1="예약문의";
		String cate2="가격문의";
		String cate3="보험/장례";
		String cate4="기타문의";
		
		
		try {
			
			if(cate.equals(cate1)) {
				String query = "SELECT * FROM FAQBOARD WHERE C_NO=1";
				pstmt=conn.prepareStatement(query);
			}else if(cate.equals(cate2)) {
				String query = "SELECT * FROM FAQBOARD WHERE C_NO=2";
				pstmt=conn.prepareStatement(query);
			}else if(cate.equals(cate3)) {
				String query = "SELECT * FROM FAQBOARD WHERE C_NO=3";
				pstmt=conn.prepareStatement(query);
			}else if(cate.equals(cate4)){
				String query = "SELECT * FROM FAQBOARD WHERE C_NO=4";
				pstmt=conn.prepareStatement(query);
			}else {
				String query = "SELECT * FROM FAQBOARD";
				pstmt=conn.prepareStatement(query);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				faqBoard b = new faqBoard(rs.getInt("F_NO"),
												rs.getInt("C_NO"),
												rs.getInt("MEMBER_NO"),
												rs.getString("F_TITLE"),
												rs.getString("F_CONTENT"),
												rs.getDate("CREATE_DATE"),
												rs.getDate("MODIFY_DATE"),
												rs.getString("STATUS"));
				list.add(b);
			}
						
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}

		return list;
	}
	
	//글 작성(insert작업)
	public int insertBoard(Connection conn, faqBoard fb, String selectBox) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
//		String query = "INSERT INTO FAQBOARD VALUES((SELECT MAX(F_NO)+1 FROM FAQBOARD),?,?,?,?,SYSDATE,SYSDATE,'Y')  ";
		
		try {
			if(selectBox.equals("first")) {
				String query = "INSERT INTO FAQBOARD VALUES((SELECT MAX(F_NO)+1 FROM FAQBOARD),1,?,?,?,SYSDATE,SYSDATE,'Y')";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, fb.getMemberNo());
				pstmt.setString(2, fb.getfTitle());
				pstmt.setString(3, fb.getfContent());
			}else if(selectBox.equals("second")) {
				String query = "INSERT INTO FAQBOARD VALUES((SELECT MAX(F_NO)+1 FROM FAQBOARD),2,?,?,?,SYSDATE,SYSDATE,'Y')";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, fb.getMemberNo());
				pstmt.setString(2, fb.getfTitle());
				pstmt.setString(3, fb.getfContent());
			}else if(selectBox.equals("third")) {
				String query = "INSERT INTO FAQBOARD VALUES((SELECT MAX(F_NO)+1 FROM FAQBOARD),3,?,?,?,SYSDATE,SYSDATE,'Y')";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, fb.getMemberNo());
				pstmt.setString(2, fb.getfTitle());
				pstmt.setString(3, fb.getfContent());
			}else if(selectBox.equals("forth")) {
				String query = "INSERT INTO FAQBOARD VALUES((SELECT MAX(F_NO)+1 FROM FAQBOARD),4,?,?,?,SYSDATE,SYSDATE,'Y')";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, fb.getMemberNo());
				pstmt.setString(2, fb.getfTitle());
				pstmt.setString(3, fb.getfContent());
			}
			
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	



}
