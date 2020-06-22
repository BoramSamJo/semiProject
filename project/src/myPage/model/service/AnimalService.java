package myPage.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import myPage.model.dao.AnimalDao;
import myPage.model.vo.Animal;;

public class AnimalService {


	public static ArrayList<Animal> changeAnimal(Animal a) {
		Connection conn = getConnection();
		ArrayList<Animal> aList = new ArrayList();
		int result = 0;
		
		aList = AnimalDao.searchPet(conn, a);
		if(aList.isEmpty()) {
			result = AnimalDao.insertPet(conn, a);
		}else {
			result = AnimalDao.changeAnimal(conn, a);
		}

		if(result>0) {
			commit(conn);
			aList = AnimalDao.searchPet(conn, a);
		}else {
			rollback(conn);
		}
		
		return aList;
	}

	public static ArrayList<Animal> deleteAnimal(Animal a) {
		Connection conn = getConnection();
		ArrayList<Animal> aList = new ArrayList();
		
		int result = AnimalDao.deleteAnimal(conn, a);
		
		if(result>0) {
			commit(conn);
			aList = AnimalDao.searchPet(conn, a);
		}else {
			rollback(conn);
		}
		
		return aList;
	}

}
