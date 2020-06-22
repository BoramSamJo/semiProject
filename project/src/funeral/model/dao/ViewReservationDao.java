package funeral.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import funeral.model.vo.FuneralProduct;
import funeral.model.vo.SelectProduct;
import member.model.vo.Animal;
import static common.JDBCTemplate.*;

public class ViewReservationDao {


	public int insertAnimal(Connection conn, int memberNo, String aName, double weight, String kind) {
		PreparedStatement pstmt = null;
		int insertA = 0;
		
		String query = "INSERT INTO ANIMAL VALUES((SELECT NVL(MAX(a_no), 0)+1 FROM ANIMAL),?,?,?,?,default)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, aName);
			pstmt.setString(3, kind);
			pstmt.setDouble(4, weight);
			insertA = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return insertA;
	}

	public FuneralProduct selectfp(Connection conn, String prodcutName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FuneralProduct fp = null;
		
		String query = "SELECT * FROM FUNERALPRODUCT WHERE PRODUCT_NAME=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, prodcutName);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				fp = new FuneralProduct(rs.getInt("PRODUCT_NO"),
										rs.getString("PRODUCT_NAME"),
										rs.getInt("PRICE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return fp;
	}

	public SelectProduct selectsp(Connection conn, String selectShroud, String selectCoffin, String selectCremation) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SelectProduct sp = null;
		
		System.out.println(selectShroud + ", " + selectCoffin + ", " + selectCremation);
		
		String query = "SELECT * FROM SELECTPRODUCT WHERE SELECT_SHROUD=? AND SELECT_COFFIN=? AND SELECT_CREMATION=?";
			
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, selectShroud);
			pstmt.setString(2, selectCoffin);
			pstmt.setString(3, selectCremation);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sp = new SelectProduct(rs.getString("SELECT_CODE"),
										rs.getString("SELECT_SHROUD"),
										rs.getString("SELECT_COFFIN"),
										rs.getString("SELECT_CREMATION"));
			}
			System.out.println(sp);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return sp;
	}
	
		

	public Animal selectA(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Animal a = null;
		
		String query = "SELECT * FROM ANIMAL WHERE MEMBER_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				a = new Animal(rs.getString("A_NO"),
								rs.getInt("MEMBER_NO"),
								rs.getString("A_NAME"),
								rs.getString("KIND"),
								rs.getString("WEIGHT"),
								rs.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return a;
	}

	public int insertfl(Connection conn, String spNo, int fpNo, String animalNo, int memberNo, String reservationDate,
			String reservationTime) {
		PreparedStatement pstmt = null;
		int fl = 0;
		
		String query = "INSERT INTO FU_LIST VALUES((SELECT NVL(MAX(RESERVATION_NO), 0)+1 FROM FU_LIST),?,?,?,?,?,DEFAULT,?)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, fpNo);
			pstmt.setString(2, animalNo);
			pstmt.setInt(3, memberNo);
			pstmt.setString(4, reservationDate);
			pstmt.setString(5, reservationTime);
			pstmt.setString(6, spNo);
			
			fl = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return fl;
	}
}
