package myPage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import myPage.model.vo.Animal;

import static common.JDBCTemplate.close;

public class AnimalDao {

	public static int insertPet(Connection conn, Animal a) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO ANIMAL VALUES(SEQ_PNO.NEXTVAL, ?, ?, ?, ?, 'Y')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, a.getMemberNo());
			pstmt.setString(2, a.getaName());
			pstmt.setString(3, a.getKind());
			pstmt.setInt(4, a.getWeight());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static ArrayList<Animal> searchPet(Connection conn, Animal a) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Animal> aList = new ArrayList();
		Animal a2 = null;
		
		String query = "SELECT * FROM ANIMAL WHERE MEMBER_NO=? AND STATUS='Y'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, a.getMemberNo());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				a2 = new Animal(rs.getString("A_NO"),
								rs.getInt("MEMBER_NO"),
								rs.getString("A_NAME"),
								rs.getString("KIND"),
								rs.getInt("WEIGHT"),
								rs.getString("STATUS"));
				aList.add(a2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return aList;
	}

	public static int changeAnimal(Connection conn, Animal a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE ANIMAL SET A_NAME=?, KIND=?, WEIGHT=? WHERE A_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a.getaName());
			pstmt.setString(2, a.getKind());
			pstmt.setInt(3, a.getWeight());
			pstmt.setString(4, a.getaNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static int deleteAnimal(Connection conn, Animal a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE ANIMAL SET STATUS='N' WHERE A_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a.getaNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
