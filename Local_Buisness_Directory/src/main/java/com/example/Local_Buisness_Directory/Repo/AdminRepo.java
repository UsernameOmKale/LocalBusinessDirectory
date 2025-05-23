package com.example.Local_Buisness_Directory.Repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Local_Buisness_Directory.Entity.AdminEntity;

public interface AdminRepo extends JpaRepository<AdminEntity, Integer>
{

	public AdminEntity findByUsernameAndPassword(String username, String password);

	public AdminEntity findByUsernameAndMobileAndEmail(String username, String mobile, String email);

}
