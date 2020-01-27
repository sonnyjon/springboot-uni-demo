package com.sonnyjon.springdemo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonnyjon.springdemo.entity.Login;
import com.sonnyjon.springdemo.entity.Teacher;
import com.sonnyjon.springdemo.service.CollegeService;
import com.sonnyjon.springdemo.service.TeacherService;
import com.sonnyjon.springdemo.service.UserService;

@Controller
@RequestMapping("/admin/teachers")
public class TeacherController 
{
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private CollegeService collegeService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping({"", "/"})
	public String getTeachers(Model model)
	{
		model.addAttribute("teachers", teacherService.getTeachers());
		return "teachers";
	}
	
	@GetMapping("/register")
	public String getForm(Model model)
	{
		model.addAttribute("teacher", new Teacher());
		model.addAttribute("colleges", collegeService.getColleges());		
		return "register-teacher";
	}
	
	@PostMapping("/register")
	public String registerTeacher(@ModelAttribute("teacher") Teacher teacher)
	{
		userService.registerUser(teacher.getLogin(), "ROLE_TEACHER");
		teacherService.saveTeacher(teacher);				
		return "redirect:/admin/teachers";
	}
	
	@GetMapping("/update")
	public String updateTeacher(@RequestParam("teacherId") int id, Model model)
	{
		model.addAttribute("teacher", teacherService.getTeacher(id));
		model.addAttribute("colleges", collegeService.getColleges());		
		return "update-teacher";
	}
	
	@PostMapping("/update")
	public String saveTeacher(@ModelAttribute("teacher") Teacher teacher)
	{
		Login login = getLogin(teacher.getId());
		teacher.setLogin(login);
		teacherService.saveTeacher(teacher);		
		return "redirect:/admin/teachers";
	}
	
	@GetMapping("/delete")
	public String deleteTeacher(@RequestParam("teacherId") int id)
	{
		teacherService.deleteTeacher(id);		
		return "redirect:/admin/teachers";
	}
	
	private Login getLogin(int teacherId)
	{
		Teacher teacher = teacherService.getTeacher(teacherId);
		return teacher.getLogin();
	}
}
