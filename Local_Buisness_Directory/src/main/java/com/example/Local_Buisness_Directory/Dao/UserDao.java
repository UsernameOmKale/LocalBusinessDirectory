package com.example.Local_Buisness_Directory.Dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.Local_Buisness_Directory.Entity.UserEntity;
import com.example.Local_Buisness_Directory.Repo.UserRepo;

@Repository
public class UserDao {
	@Autowired
	UserRepo userRepo;

	public UserEntity UserSaveData(UserEntity userEntity) {
		return userRepo.save(userEntity);
	}

	public UserEntity CheckUserLogin(String username, String password) {
		return userRepo.findByUsernameAndPassword(username,password);
	}

	public UserEntity findById(int id) {
		return userRepo.findById(id).get();
		
	}
	
	
	public UserEntity UpdateProfile(int id, UserEntity userEntity) {
	    Optional<UserEntity> optional = userRepo.findById(id);
	    
	
	    
	    
	    if (optional.isPresent()) {
	        UserEntity userEntity2 = optional.get();
	        
	        if (userEntity.getUsername() != null) {
	            userEntity2.setUsername(userEntity.getUsername());
	        }
	        if (userEntity.getPassword() != null) {
	            userEntity2.setPassword(userEntity.getPassword());
	        }
	        if (userEntity.getName() != null) {
	            userEntity2.setName(userEntity.getName());
	        }
	        if (userEntity.getEmail() != null) {
	            userEntity2.setEmail(userEntity.getEmail());
	        }
	        if (userEntity.getMobile() != null) {
	            userEntity2.setMobile(userEntity.getMobile());
	        }
	        if (userEntity.getAddress() != null) {
	            userEntity2.setAddress(userEntity.getAddress());
	        }
	        if (userEntity.getGender() != null) {
	            userEntity2.setGender(userEntity.getGender());
	        }
	      

	        return userRepo.save(userEntity2); // Save the updated entity and return it
	    }
	    return null; // Return null if user not found
	}

	public UserEntity FindUserAccount(String username, String email, String mobile) {
		return userRepo.findByUsernameAndEmailAndMobile(username,email,mobile);
	}
}
