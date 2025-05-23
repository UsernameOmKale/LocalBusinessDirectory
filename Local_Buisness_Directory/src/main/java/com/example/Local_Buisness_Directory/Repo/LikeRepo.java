package com.example.Local_Buisness_Directory.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.Local_Buisness_Directory.Entity.AdminEntity;
import com.example.Local_Buisness_Directory.Entity.AdminUserMappingEntity;
import com.example.Local_Buisness_Directory.Entity.LikeEntity;

public interface LikeRepo extends JpaRepository<LikeEntity, Integer>
{

	@Query(value = "SELECT * FROM localbuisnessdirectory_db.like_entity WHERE aid = :aid AND user_id = :id", nativeQuery = true)
	public LikeEntity findByAidAndId(@Param("aid") int aid, @Param("id") int id);
	
	
	@Query(value = "SELECT * FROM localbuisnessdirectory_db.like_entity aue "
            + "INNER JOIN localbuisnessdirectory_db.user_entity ue ON aue.user_id = ue.id "
            + "WHERE aue.aid = :aid", nativeQuery = true)
    public List <LikeEntity> FindAllUserByAid(@Param("aid") int aid);
	
	@Query(value = "SELECT COUNT(*) FROM localbuisnessdirectory_db.like_entity WHERE aid = :aid", nativeQuery = true)
    public int getSearchCount(@Param("aid") int aid);

	
	
}
