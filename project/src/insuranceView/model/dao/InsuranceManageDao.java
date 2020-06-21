package insuranceView.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.model.vo.Pagination;
import insuranceView.model.vo.InsuranceManage;

public class InsuranceManageDao {

	public static ArrayList<InsuranceManage> firstUpdate(Connection conn, Pagination p) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InsuranceManage ins = null;
		ArrayList<InsuranceManage> iList = new ArrayList();
		
		int currentPage = p.getCurrentPage();
		int limit = p.getLimit();
		int startRow = (currentPage-1)*limit+1;
		int endRow = currentPage*limit;
		System.out.println("current : "+currentPage);
		String query = "SELECT * FROM (SELECT ROWNUM RNUM,I.* FROM INSLIST I) WHERE RNUM BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				ins = new InsuranceManage(rs.getInt(1),
										  rs.getString("MEMBER_NAME"),
										  rs.getString("ENROLL_DATE"),
										  rs.getString("STATUS"),
										  rs.getString("INS_NAME"),
										  rs.getString("INS_CONTENT"),
										  rs.getInt("PRICE"),
										  rs.getString("PHONE"),
										  rs.getInt("INS_NO"),
										  rs.getString("EMAIL"));
				iList.add(ins);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("Dao_iList(null) : "+iList);
		return iList;
	}

	public static int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		String query = "SELECT COUNT(INS_NO) FROM INSLIST";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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

	public static int getListCount(Connection conn, String select, String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		String query = "SELECT COUNT(*) FROM INSLIST WHERE "+select+" LIKE '"+search+"%'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("Dao_listCount : "+listCount);
		return listCount;
	}

	public static ArrayList<InsuranceManage> getInsList(Connection conn, Pagination p, String select, String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InsuranceManage ins = null;
		ArrayList<InsuranceManage> iList = new ArrayList();
		
		int currentPage = p.getCurrentPage();
		int limit = p.getLimit();
		int startRow = (currentPage-1)*limit+1;
		int endRow = currentPage*limit;
		System.out.println("current : "+currentPage);
		String query = "SELECT * FROM (SELECT ROWNUM RNUM,I.* FROM INSLIST I WHERE "+select+" LIKE '"+search+"%') WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				ins = new InsuranceManage(rs.getInt(1),
										  rs.getString("MEMBER_NAME"),
										  rs.getString("ENROLL_DATE"),
										  rs.getString("STATUS"),
										  rs.getString("INS_NAME"),
										  rs.getString("INS_CONTENT"),
										  rs.getInt("PRICE"),
										  rs.getString("PHONE"),
										  rs.getInt("INS_NO"),
										  rs.getString("EMAIL"));
				iList.add(ins);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("Dao_iList : "+iList);
		return iList;
	}


}
