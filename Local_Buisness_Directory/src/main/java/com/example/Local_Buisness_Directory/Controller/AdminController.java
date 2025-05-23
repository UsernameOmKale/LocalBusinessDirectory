package com.example.Local_Buisness_Directory.Controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Local_Buisness_Directory.Dao.AdminDao;
import com.example.Local_Buisness_Directory.Dao.UserDao;
import com.example.Local_Buisness_Directory.Entity.AdminEntity;
import com.example.Local_Buisness_Directory.Entity.LikeEntity;
import com.example.Local_Buisness_Directory.Entity.ResponseEntity;
import com.example.Local_Buisness_Directory.Entity.UserEntity;
import com.example.Local_Buisness_Directory.Repo.LikeRepo;
import com.example.Local_Buisness_Directory.Repo.ResponseRepo;


@Controller
public class AdminController {
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	LikeRepo likeRepo;
	
	@Autowired
	ResponseRepo responseRepo;
	
	@PostMapping("/AdminSaveData")
	public String UserSaveData( @ModelAttribute AdminEntity adminEntity) {
		adminDao.AdminSaveData(adminEntity);
		return "AdminSignUp";
	}
	
	@RequestMapping("/LogOut2")
	public String LogOut() {
		return "AdminSignIn";
	}
	
	
	
	@RequestMapping("/AdminProfile")
	public String AdminProfile(@RequestParam("aid") int aid,Model model) {
       AdminEntity adminEntity = adminDao.findById(aid);
       model.addAttribute("Admin_model",adminEntity);
		return "admin/AdminProfile";
	}
	
	@RequestMapping("/AdminHome")
	public String AdminHome(@RequestParam("aid") int aid,Model model) {
       AdminEntity adminEntity = adminDao.findById(aid);
       model.addAttribute("Admin_model",adminEntity);
	  return"admin/AdminHome";
	}
	
	
	
	
	
	
	
	@RequestMapping("/SearchAndResponse")
	public String SearchAndResponse(@RequestParam("aid") int aid,Model model) {
       AdminEntity adminEntity = adminDao.findById(aid);
       model.addAttribute("Admin_model",adminEntity);
       
       int searchCount2 = likeRepo.getSearchCount(aid); 
       model.addAttribute("search_count", searchCount2);
       
       int responsecount = responseRepo.getResponseCount(aid); 
       model.addAttribute("response_count", responsecount);
       
		return "admin/SearchAndResponse";
	}
	
	
	
	
	
	
	
	@GetMapping("/CheckAdminLogin")
	public String CheckAdminLogin(@RequestParam String username,@RequestParam String password,Model model) {
		AdminEntity adminEntity = adminDao.CheckAdminLogin(username,password);
		
		if (adminEntity != null) {
			model.addAttribute("Admin_model",adminEntity);
		   return "admin/AdminHome";
	        }
		else {
			model.addAttribute("error", "Invalid Username And Password");
			return"AdminSignIn";
		}
		}
	
	@GetMapping("/GetAllAdminData")
	public String GetAllAdminData(Model model,@RequestParam int id) {
		UserEntity userEntity = userDao.findById(id);
		model.addAttribute("User_model",userEntity);
		
		List<AdminEntity> adminEntity =  adminDao.GetAllAdminData();
		model.addAttribute("Admin_model",adminEntity);
		return "user/BuisnessDirectory";
	}
	
	
	
	@PostMapping("UpdateAdminProfile")  // Use lowercase "id"
	public String UpdateProfile(@RequestParam int aid, @ModelAttribute AdminEntity adminEntity ,Model model)  {
		
		
		
	     AdminEntity Adminprofile = adminDao.UpdateProfile(aid, adminEntity);
		 model.addAttribute("sucmsg", "Your Profile Has been Updated Successfully");
		 
		 AdminEntity entity = adminDao.findById(aid);
		 model.addAttribute("Admin_model",entity);
		return "admin/AdminProfile";
		 
	}
	

	
	
	@GetMapping("/response")
    public String response(@RequestParam("aid") int aid, @RequestParam("id") int id,Model model) {

        // Retrieve the Admin and User based on the given IDs
        AdminEntity admin = adminDao.findById(aid);
        UserEntity user = userDao.findById(id);

        if (admin != null && user != null) {
        	
        	
        	ResponseEntity responseEntity = responseRepo.findByAidAndId(aid,id);
        	
        	if(responseEntity != null) {
        		
        		model.addAttribute("reponseExist","reponseExist");
        		
        		 AdminEntity entity = adminDao.findById(aid);
        		 model.addAttribute("Admin_model",entity);
        		 
        		 List<LikeEntity> likeEntities = likeRepo.FindAllUserByAid(aid);
        	   	 model.addAttribute("LikeList",likeEntities);
        	   		
        		 return "admin/Leads";
        		
        	}
        	else {
            // Create and save the mapping
            ResponseEntity rEntity = new ResponseEntity();
            rEntity.setAdmin(admin);
            rEntity.setUser(user);
  
            model.addAttribute("responseSave","responseSave");
            // Save the mapping to the database (assuming you have a repository)
            responseRepo.save(rEntity);

            AdminEntity entity = adminDao.findById(aid);
   		    model.addAttribute("Admin_model",entity);
	
            // Optionally, you can add a success message to pass to the view
   		    List<LikeEntity> likeEntities = likeRepo.FindAllUserByAid(aid);
    		model.addAttribute("LikeList",likeEntities);
    		return "admin/Leads";
        }
    }
		return null;
	 
	}
	

	@GetMapping("/FindAdminAccount")
	public String FindAdminAccount(@RequestParam String username,@RequestParam String mobile,String email,Model model) {
		AdminEntity adminEntity = adminDao.FindAdminAccount(username,mobile,email);
		
		if (adminEntity != null) {
			model.addAttribute("Admin_model",adminEntity);
		   return "SetAdminPassword";
	        }
		else {
			model.addAttribute("error", "Account Not Found..!!");
			return"adminPasswordForgot";
		}
		}
	
	@PostMapping("SetAdminNewPassword")  // Use lowercase "id"
	public String SetAdminPassword(@RequestParam int aid, @ModelAttribute AdminEntity adminEntity ,Model model)  {
		
		
		
	     AdminEntity Adminprofile = adminDao.UpdateProfile(aid, adminEntity);
		 model.addAttribute("sucmsg", "Your Password Has been Reseted Successfully");
		 
		return "SetAdminPassword";
		 
	}
	
}
