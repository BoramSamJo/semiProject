package searchMe.model.dao;

import static common.JDBCTemplete.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import member.model.vo.Member;

public class SearchDao {

	public static ArrayList<Member> searchId(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m2 = null;
		ArrayList<Member> mList = new ArrayList();
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_NAME=? AND EMAIL=? AND STATUS='Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getmId());
			pstmt.setString(2, m.getmPwd());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				m2 = new Member(rs.getInt("MEMBER_NO"),
								rs.getString("MEMBER_ID"),
								rs.getString("MEMBER_PWD"),
								rs.getString("MEMBER_NAME"),
								rs.getString("PHONE"),
								rs.getString("EMAIL"),
								rs.getString("ADDRESS"),
								rs.getString("ENROLL_DATE"),
								rs.getString("MODIFY_DATE"),
								rs.getString("STATUS"));
				mList.add(m2);
				System.out.println(mList);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return mList;
	}

	public static Member searchPwd(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m2 = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_NAME=? AND MEMBER_ID=? AND EMAIL=? AND STATUS='Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getmName());
			pstmt.setString(2, m.getmId());
			pstmt.setString(3, m.getEmail());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				m2 = new Member(rs.getInt("MEMBER_NO"),
								rs.getString("MEMBER_ID"),
								rs.getString("MEMBER_PWD"),
								rs.getString("MEMBER_NAME"),
								rs.getString("PHONE"),
								rs.getString("EMAIL"),
								rs.getString("ADDRESS"),
								rs.getString("ENROLL_DATE"),
								rs.getString("MODIFY_DATE"),
								rs.getString("STATUS"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return m2;
	}

	public static int newPwd(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		Member m2 = null;
		
		StringBuffer temp = new StringBuffer();
	    Random rnd = new Random();
	    for(int i = 0; i < 10; i++) {
	       int rIndex = rnd.nextInt(3);
	       switch(rIndex) {
	       case 0 : 
	          temp.append((char)((int)(rnd.nextInt(26))+97));
	          break;
	       case 1 :
	          temp.append((char)((int) (rnd.nextInt(26))+65));
	          break;
	       case 2 :
	          temp.append((rnd.nextInt(10)));
	          break;
	       }
	    }
		
		String query = "UPDATE MEMBER SET MEMBER_PWD=? WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, temp.toString());
			pstmt.setString(2, m.getmId());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
