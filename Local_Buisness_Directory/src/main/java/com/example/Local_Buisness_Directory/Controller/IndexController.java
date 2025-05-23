package com.example.Local_Buisness_Directory.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/UserSignUp")
	public String UserSignUp() {
		return "UserSignUp";
	}
	
	@RequestMapping("/AdminSignIn")
	public String AdminSignIn() {
		return "AdminSignIn";
	}
	
	@RequestMapping("/AdminSignUp")
	public String AdminSignUp() {
		return "AdminSignUp";
	}
	
	@RequestMapping("/UserSignIn")
	public String UserSignIn() {
		return "UserSignIn";
	}
	@RequestMapping("/UserPasswordForgot")
	public String UserPasswordForgot() {
		return "userPasswordForgot";
	}
	@RequestMapping("/AdminPasswordForgot")
	public String AdminPasswordForgot() {
		return "adminPasswordForgot";
	}
	@RequestMapping("/SetUserPassword")
	public String SetUserPassword() {
		return "SetUserPassword";
	}
	@RequestMapping("/SetAdminPassword")
	public String SetAdminPassword() {
		return "SetAdminPassword";
	}
}
