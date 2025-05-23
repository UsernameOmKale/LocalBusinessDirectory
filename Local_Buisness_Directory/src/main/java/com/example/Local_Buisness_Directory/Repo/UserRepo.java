package com.example.Local_Buisness_Directory.Repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Local_Buisness_Directory.Entity.UserEntity;

public interface UserRepo extends JpaRepository<UserEntity, Integer>
{

   public UserEntity findByUsernameAndPassword(String username, String password);

   public UserEntity findByUsernameAndEmailAndMobile(String username, String email, String mobile);

}
