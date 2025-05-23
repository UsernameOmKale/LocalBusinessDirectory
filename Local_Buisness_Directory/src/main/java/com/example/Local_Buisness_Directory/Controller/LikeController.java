package com.example.Local_Buisness_Directory.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Local_Buisness_Directory.Dao.AdminDao;
import com.example.Local_Buisness_Directory.Dao.UserDao;
import com.example.Local_Buisness_Directory.Entity.AdminEntity;
import com.example.Local_Buisness_Directory.Entity.AdminUserMappingEntity;
import com.example.Local_Buisness_Directory.Entity.LikeEntity;
import com.example.Local_Buisness_Directory.Entity.UserEntity;
import com.example.Local_Buisness_Directory.Repo.LikeRepo;

@Controller
public class LikeController {
	
	@Autowired
	LikeRepo likeRepo;
	
	@Autowired
    private AdminDao adminDao;

    @Autowired
    private UserDao userDao;
    
    @GetMapping("/like")
    public String storeAdminUserMapping(@RequestParam("aid") int aid, @RequestParam("id") int id,Model model) {

        // Retrieve the Admin and User based on the given IDs
        AdminEntity admin = adminDao.findById(aid);
        UserEntity user = userDao.findById(id);

        if (admin != null && user != null) {
        	
        	
        	LikeEntity likeDataExist = likeRepo.findByAidAndId(aid,id);
        	
        	if(likeDataExist != null) {
        		
        		model.addAttribute("likeDataExist","likeDataExist");
        		
        		List<AdminEntity> adminEntity =  adminDao.GetAllAdminData();
        		model.addAttribute("Admin_model",adminEntity);
        		
        		UserEntity userEntity = userDao.findById(id);
        		model.addAttribute("User_model",userEntity);
        		
        		return "user/BuisnessDirectory";
        		
        	}
        	else {
            // Create and save the mapping
            LikeEntity like = new LikeEntity();
            like.setAdmin(admin);
            like.setUser(user);
  
            model.addAttribute("likeSave","likeSave");
            // Save the mapping to the database (assuming you have a repository)
            likeRepo.save(like);

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
    
    
    @GetMapping("/AdminLeads")
   	public String GetAdminAllData(Model model,@RequestParam int aid) {
   		AdminEntity adminEntity = adminDao.findById(aid);
   		model.addAttribute("Admin_model",adminEntity);
   		 
   		
   		List<LikeEntity> likeEntities = likeRepo.FindAllUserByAid(aid);
   		model.addAttribute("LikeList",likeEntities);
   		return "admin/Leads";
   	}
    
    @GetMapping("/DeleteLike")
    public String postMethodName(@RequestParam int likeId , @RequestParam int aid ,Model model) {
    	AdminEntity adminEntity = adminDao.findById(aid);
		model.addAttribute("Admin_model",adminEntity);
		 
		likeRepo.deleteById(likeId);
    	
		List<LikeEntity> likeEntities = likeRepo.FindAllUserByAid(aid);
   		model.addAttribute("LikeList",likeEntities);
   		return "admin/Leads";
    }

}
