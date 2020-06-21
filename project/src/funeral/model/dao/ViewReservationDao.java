package funeral.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import funeral.model.vo.FuneralProduct;
import funeral.model.vo.Reservation;
import funeral.model.vo.SelectProduct;
import member.model.vo.Animal;
import static common.JDBCTemplete.*;

public class ViewReservationDao {
	public int insertReservation(Connection conn, Reservation vr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO RESERVATION VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vr.getPlusDate());
			pstmt.setString(2, vr.getPlusTime());
			pstmt.setString(3, vr.getFuneralSelect());
			pstmt.setString(4, vr.getFuneralSelect1());
			pstmt.setString(5, vr.getFuneralSelect2());
			pstmt.setString(6, vr.getFuneralSelect3());
			pstmt.setString(7, vr.getUserName());
			pstmt.setString(8, vr.getPhone());
			pstmt.setString(9, vr.getAddress());
			pstmt.setString(10, vr.getpName());
			pstmt.setString(11, vr.getpWeight());
			pstmt.setString(12, vr.getpKindMain());
			pstmt.setString(13, vr.getpKindServe());
			
			result = pstmt.executeUpdate();
			System.out.println("dao 반환값 result :" +result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}close(pstmt);
		
		return result;
	}

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
				System.out.println("dao sp : "+sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return sp;
	}

	public int insertfl(Connection conn, String spNo, int fpNo, int animalNo, int memberNo, String reservationDate,
			String reservationTime) {
		PreparedStatement pstmt = null;
		int fl = 0;
		
		String query = "INSERT INTO FU_LIST VALUES((SELECT NVL(MAX(RESERVATION_NO), 0)+1 FROM FU_LIST),?,?,?,?,?,DEFAULT,?)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, fpNo);
			pstmt.setInt(2, animalNo);
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
				a = new Animal(rs.getInt("A_NO"),
								rs.getInt("MEMBER_NO"),
								rs.getString("A_NAME"),
								rs.getString("KIND"),
								rs.getDouble("WEIGHT"),
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
}
