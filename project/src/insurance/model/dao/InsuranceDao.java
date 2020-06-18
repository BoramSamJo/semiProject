package insurance.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import insurance.model.vo.Insurance;
import static common.JDBCTemplate.*;

public class InsuranceDao {

	// DB넘어오는지 확인용
//	public ArrayList<Insurance> selectAllIns(Connection conn) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		ArrayList<Insurance> list = new ArrayList();
//		
//		String query = "SELECT * FROM INSURANCE";
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				Insurance ins = new Insurance();
//				ins.setInsCode(rs.getString("ins_code"));
//				ins.setInsName(rs.getString("ins_name"));
//				ins.setInsContent(rs.getString("ins_content"));
//				ins.setKind(rs.getString("kind"));
//				ins.setAge(rs.getInt("age"));
//				ins.setPrice(rs.getInt("price"));
//				
//				list.add(ins);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//			close(rs);
//		}
//		
//		return list;
//	}

	public Insurance calculateIns(Connection conn, Insurance ins) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Insurance ins2 = null;
		
		String query = "SELECT INS_NAME, INS_CONTENT, KIND, AGE, PRICE FROM INSURANCE WHERE AGE=? AND KIND=?";
		
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, ins.getAge());
			pstmt.setString(2, ins.getKind());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ins2 = new Insurance(rs.getString("INS_NAME"),
										rs.getString("INS_CONTENT"),
										rs.getString("KIND"),
										rs.getInt("AGE"),
										rs.getInt("PRICE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return ins2;
	}

}
