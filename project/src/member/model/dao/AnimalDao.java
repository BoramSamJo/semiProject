package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import member.model.vo.Animal;
import static common.JDBCTemplate.*;

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
					animal = new Animal(rs.getString("A_NO"),
							rs.getInt("MEMBER_NO"),
							rs.getString("A_NAME"),
							rs.getString("KIND"),
							rs.getString("WEIGHT"),
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

}
