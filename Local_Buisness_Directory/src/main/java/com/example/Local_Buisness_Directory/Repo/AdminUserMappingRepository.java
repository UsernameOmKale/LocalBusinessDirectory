package com.example.Local_Buisness_Directory.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.Local_Buisness_Directory.Entity.AdminUserMappingEntity;

public interface AdminUserMappingRepository extends JpaRepository<AdminUserMappingEntity,Integer>
{

	@Query(value = "SELECT * FROM localbuisnessdirectory_db.admin_user_mapping_entity WHERE aid = :aid AND user_id = :id", nativeQuery = true)
	public AdminUserMappingEntity findByAidAndId(@Param("aid") int aid, @Param("id") int id);

	
	@Query(value = "SELECT * FROM localbuisnessdirectory_db.admin_user_mapping_entity aue "
            + "INNER JOIN localbuisnessdirectory_db.user_entity ue ON aue.user_id = ue.id "
            + "WHERE aue.user_id = :id", nativeQuery = true)
    public List<AdminUserMappingEntity> FindAllAdminByUserId(@Param("id") int id);



	
	
}
