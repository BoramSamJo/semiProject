package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import member.model.vo.Animal;
import static common.JDBCTemplete.*;

public class AnimalDao {

	public ArrayList<Animal> animaldata(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Animal animal = null;
		ArrayList<Animal> alist = new ArrayList<Animal>();
		String query = "SELECT * FROM ANIMAL";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
					animal = new Animal(rs.getInt("A_NO"),
							rs.getInt("MEMBER_NO"),
							rs.getString("A_NAME"),
							rs.getString("KIND"),
							rs.getDouble("WEIGHT"),
							rs.getString("STATUS"));	
					alist.add(animal);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		
		return alist;
	}

//	public int updateAnimaldata(Connection conn, int mNo) {
//		PreparedStatement pstmt = null;
//		int updateAnimal = 0;
//		
//		String query = "INSERT INTO ANIMAL VALUES((SELECT NVL(MAX(a_no), 0)+1 FROM ANIMAL), ?, ?, ?, ?, DEFAULT)";
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, ());
//			pstmt.setString(2, updateAnimal.getaName());
//			pstmt.setString(3, updateAnimal.getKind());
//			pstmt.setDouble(4, updateAnimal.getWeight());
//			updateAnimal = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}
//		return 0;
//	}

}
