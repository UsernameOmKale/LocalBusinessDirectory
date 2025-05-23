package com.example.Local_Buisness_Directory.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Local_Buisness_Directory.Dao.AdminDao;
import com.example.Local_Buisness_Directory.Dao.UserDao;
import com.example.Local_Buisness_Directory.Entity.AdminEntity;
import com.example.Local_Buisness_Directory.Entity.AdminUserMappingEntity;
import com.example.Local_Buisness_Directory.Entity.UserEntity;
import com.example.Local_Buisness_Directory.Repo.AdminUserMappingRepository;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
public class AdminUserController {

    @Autowired
    private AdminDao adminDao;

    @Autowired
    private UserDao userDao;
    
    @Autowired
    AdminUserMappingRepository adminUserMappingRepository;

    @GetMapping("/store")
    public String storeAdminUserMapping(@RequestParam("aid") int aid, @RequestParam("id") int id,Model model) {

        // Retrieve the Admin and User based on the given IDs
        AdminEntity admin = adminDao.findById(aid);
        UserEntity user = userDao.findById(id);

        if (admin != null && user != null) {
        	
        	
        	AdminUserMappingEntity dataExist = adminUserMappingRepository.findByAidAndId(aid,id);
        	
        	if(dataExist != null) {
        		
        		model.addAttribute("dataExist","dataExist");
        		
        		List<AdminEntity> adminEntity =  adminDao.GetAllAdminData();
        		model.addAttribute("Admin_model",adminEntity);
        		
        		UserEntity userEntity = userDao.findById(id);
        		model.addAttribute("User_model",userEntity);
        		
        		return "user/BuisnessDirectory";
        		
        	}
        	else {
            // Create and save the mapping
            AdminUserMappingEntity mapping = new AdminUserMappingEntity();
            mapping.setAdmin(admin);
            mapping.setUser(user);
            
            model.addAttribute("dataSaved","dataSaved");
            // Save the mapping to the database (assuming you have a repository)
            adminUserMappingRepository.save(mapping);

            UserEntity userEntity = userDao.findById(id);
    		model.addAttribute("User_model",userEntity);
    		
            List<AdminEntity> adminEntity =  adminDao.GetAllAdminData();
    		model.addAttribute("Admin_model",adminEntity);
    		
            // Optionally, you can add a success message to pass to the view
            return "user/BuisnessDirectory";  // Redirect to some page with success message
        	}
        }

        // If admin or user is not found, handle the case accordingly
        return null;  // Redirect with error message
    }
    
    
    @GetMapping("/StoredList")
	public String GetAdminAllData(Model model,@RequestParam int id) {
		UserEntity userEntity = userDao.findById(id);
		model.addAttribute("User_model",userEntity);
		 
		
		List<AdminUserMappingEntity> adminUserMappingEntities = adminUserMappingRepository.FindAllAdminByUserId(id);
		model.addAttribute("StoredList",adminUserMappingEntities);
		return "user/StoredDetails";
	}
    
    @GetMapping("/DeleteStore")
    public String postMethodName(@RequestParam int mappingId , @RequestParam int id ,Model model) {
    	UserEntity userEntity = userDao.findById(id);
		model.addAttribute("User_model",userEntity);
		 
		adminUserMappingRepository.deleteById(mappingId);
    	
		List<AdminUserMappingEntity> adminUserMappingEntities = adminUserMappingRepository.FindAllAdminByUserId(id);
		model.addAttribute("StoredList",adminUserMappingEntities);
		return "user/StoredDetails";
    }
    
	
}