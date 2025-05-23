package com.example.Local_Buisness_Directory.Dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.Local_Buisness_Directory.Entity.AdminEntity;
import com.example.Local_Buisness_Directory.Repo.AdminRepo;

@Repository
public class AdminDao {

	@Autowired
	AdminRepo adminRepo;

	public AdminEntity AdminSaveData(AdminEntity adminEntity) {
		
		return adminRepo.save(adminEntity);
		
	}

	public AdminEntity CheckAdminLogin(String username, String password) {
		return adminRepo.findByUsernameAndPassword(username,password);
	}

	public List<AdminEntity> GetAllAdminData() {
        return adminRepo.findAll();
		
	}

	public AdminEntity findById(int aid) {
		return adminRepo.findById(aid).get();
	}
	
	
	public AdminEntity UpdateProfile(int aid, AdminEntity adminEntity) {
	    Optional<AdminEntity> optional = adminRepo.findById(aid);
	    
	
	    
	    
	    if (optional.isPresent()) {
	        AdminEntity adminEntity2 = optional.get();
	        
	       

	        if (adminEntity.getUsername() != null) {
	        	adminEntity2.setUsername(adminEntity.getUsername());
	        }
	        if (adminEntity.getPassword() != null) {
	        	adminEntity2.setPassword(adminEntity.getPassword());
	        }
	        if (adminEntity.getName() != null) {
	        	adminEntity2.setName(adminEntity.getName());
	        }
	        if (adminEntity.getEmail() != null) {
	        	adminEntity2.setEmail(adminEntity.getEmail());
	        }
	        if (adminEntity.getMobile() != null) {
	        	adminEntity2.setMobile(adminEntity.getMobile());
	        }
	        if (adminEntity.getCity() != null) {
	        	adminEntity2.setCity(adminEntity.getCity());
	        }
	        if (adminEntity.getAddress() != null) {
	        	adminEntity2.setAddress(adminEntity.getAddress());
	        }
	        if (adminEntity.getBusinessName() != null) {
	        	adminEntity2.setBusinessName(adminEntity.getBusinessName());
	        }
	        if (adminEntity.getOtherBusiness() != null) {
	        	adminEntity2.setOtherBusiness(adminEntity.getOtherBusiness());
	        }
	        if (adminEntity.getGender() != null) {
	        	adminEntity2.setGender(adminEntity.getGender());
	        }
	      

	        return adminRepo.save(adminEntity2); // Save the updated entity and return it
	    }
	    return null; // Return null if user not found
	}

	public AdminEntity FindAdminAccount(String username, String mobile, String email) {
		return adminRepo.findByUsernameAndMobileAndEmail(username,mobile,email);
	}
}
