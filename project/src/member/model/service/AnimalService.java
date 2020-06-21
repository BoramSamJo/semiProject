package member.model.service;

import member.model.dao.AnimalDao;
import member.model.vo.Animal;
import static common.JDBCTemplete.*;

import java.sql.Connection;
import java.util.ArrayList;

public class AnimalService {

	public ArrayList<Animal> animaldata() {
		Connection conn = getConnection();
		
		ArrayList<Animal> animal = new AnimalDao().animaldata(conn);
		close(conn);
		
		return animal;
	}

//	public int insertAnimaldata(int mNo) {
//		Connection conn = getConnection();
//		
//		int updateAnimal = new AnimalDao().updateAnimaldata(conn,mNo);
//		
//		if(updateAnimal>0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		
//		return updateAnimal;
//	}

}
