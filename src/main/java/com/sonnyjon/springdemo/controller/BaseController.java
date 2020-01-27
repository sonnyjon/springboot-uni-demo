package com.sonnyjon.springdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;;

@Controller
public class BaseController 
{
	@GetMapping("/")
	public String home()
	{
		return "home";
	}
	
	@GetMapping("/login")
	public String login()
	{
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout()
	{
		return "redirect:/login?logout";
	}
	
	// add request mapping for /access-denied
	//
	@GetMapping("/access-denied")
	public String accessDenied()
	{
		return "access-denied";
	}
}
