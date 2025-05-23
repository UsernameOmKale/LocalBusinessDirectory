package com.example.Local_Buisness_Directory.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Local_Buisness_Directory.Dao.AdminDao;
import com.example.Local_Buisness_Directory.Dao.UserDao;
import com.example.Local_Buisness_Directory.Entity.AdminEntity;
import com.example.Local_Buisness_Directory.Entity.UserEntity;


@Controller
public class UserController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	AdminDao adminDao;
	
	@RequestMapping("/LogOut")
	public String LogOut() {
		return "UserSignIn";
	}

	@PostMapping("/UserSaveData")
	public String UserSaveData( @ModelAttribute UserEntity userEntity) {
		userDao.UserSaveData(userEntity);
		return "UserSignUp";
	}
	
	@RequestMapping("/UserHome")
	public String UserHome(@RequestParam int id,Model model) {
		UserEntity userEntity = userDao.findById(id);
		model.addAttribute("User_model",userEntity);
		return "user/UserHome";
	}
	
	@RequestMapping("/UserProfile")
	public String UserProfile(@RequestParam int id,Model model) {
		UserEntity userEntity = userDao.findById(id);
		model.addAttribute("User_model",userEntity);
		return "user/UserProfile";
	}
	
	@PostMapping("UpdateUserProfile")  // Use lowercase "id"
	public String UpdateProfile(@RequestParam int id, @ModelAttribute UserEntity userEntity ,Model model)  {
		
		
		
		 UserEntity UpdateProfile = userDao.UpdateProfile(id, userEntity);
		 model.addAttribute("sucmsg", "Your Profile Has been Updated Successfully");
		 
		 UserEntity entity = userDao.findById(id);
		 model.addAttribute("User_model",entity);
		return "user/UserProfile";
		 
	}
	
	@RequestMapping("/viewBusinessDetails")
	public String viewBuisnessDetails(@RequestParam int id, @RequestParam int aid ,Model model) {
		UserEntity userEntity = userDao.findById(id);
		model.addAttribute("User_model",userEntity);
		
		AdminEntity adminEntity = adminDao.findById(aid);
		model.addAttribute("Admin_model",adminEntity);
		
		
		return "user/viewBusinessDetails";
	}
	
	
	@RequestMapping("/viewDetails2")
	public String viewDetails2(@RequestParam int id, @RequestParam int aid ,Model model) {
		UserEntity userEntity = userDao.findById(id);
		model.addAttribute("User_model",userEntity);
		
		AdminEntity adminEntity = adminDao.findById(aid);
		model.addAttribute("Admin_model",adminEntity);
	
		return "user/viewDetails2";
	}
	
	
	
	
	
	
	
	@GetMapping("/CheckUserLogin")
	public String CheckUserLogin(@RequestParam String username,@RequestParam String password,Model model) {
		UserEntity userEntity = userDao.CheckUserLogin(username,password);
		
		if (userEntity != null) {
			model.addAttribute("User_model",userEntity);
		   return "user/UserHome";
	        }
		else {
			model.addAttribute("error", "Invalid Username And Password");
			return"UserSignIn";
		}
		}
	
	
	
	@GetMapping("/FindUserAccount")
	public String FindUserAccount(@RequestParam String username,@RequestParam String email,String mobile,Model model) {
		UserEntity userEntity = userDao.FindUserAccount(username,email,mobile);
		
		if (userEntity != null) {
			model.addAttribute("User_model",userEntity);
		   return "SetUserPassword";
	        }
		else {
			model.addAttribute("error", "Faild to Find Account Try Again Later..!!");
			return"userPasswordForgot";
		}
		}
	
	
	@PostMapping("setPassword")  // Use lowercase "id"
	public String setPassword(@RequestParam int id, @ModelAttribute UserEntity userEntity ,Model model)  {

		 UserEntity UpdateProfile = userDao.UpdateProfile(id, userEntity);
		 model.addAttribute("sucmsg", "Your password Has been Forgoted Successfully");
		return "SetUserPassword";
		 
	}
	
}
