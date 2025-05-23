package com.example.Local_Buisness_Directory.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.Local_Buisness_Directory.Entity.ResponseEntity;

public interface ResponseRepo extends JpaRepository<ResponseEntity, Integer>
{

	@Query(value = "SELECT * FROM localbuisnessdirectory_db.response_entity WHERE aid = :aid AND user_id = :id", nativeQuery = true)
     public	ResponseEntity findByAidAndId(int aid, int id);
   
	
	@Query(value = "SELECT COUNT(*) FROM localbuisnessdirectory_db.response_entity WHERE aid = :aid", nativeQuery = true)
	public int getResponseCount(int aid);


}
