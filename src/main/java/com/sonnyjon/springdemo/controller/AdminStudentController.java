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
import com.sonnyjon.springdemo.entity.Student;
import com.sonnyjon.springdemo.service.MajorService;
import com.sonnyjon.springdemo.service.StudentService;
import com.sonnyjon.springdemo.service.UserService;

@Controller
@RequestMapping("/admin/students")
public class AdminStudentController 
{
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private MajorService majorService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping({"", "/"})
	public String getStudents(Model model)
	{
		model.addAttribute("students", studentService.getStudents());		
		return "students";
	}
	
	@GetMapping("/register")
	public String getForm(Model model)
	{
		model.addAttribute("student", new Student());
		model.addAttribute("majors", majorService.getMajors());		
		return "register-student";
	}
	
	@PostMapping("/register")
	public String registerStudent(@ModelAttribute("student") Student student)
	{
		userService.registerUser(student.getLogin(), "ROLE_STUDENT");
		studentService.saveStudent(student);		
		return "redirect:/admin/students";
	}
	
	@GetMapping("/update")
	public String updateStudent(@RequestParam("studentId") int id, Model model)
	{
		model.addAttribute("student", studentService.getStudent(id));
		model.addAttribute("majors", majorService.getMajors());
		return "update-student";
	}
	
	@PostMapping("/update")
	public String saveStudent(@ModelAttribute("student") Student student)
	{
		Login login = getLogin(student.getId());
		student.setLogin(login);
		studentService.saveStudent(student);
		return "redirect:/admin/students";
	}
	
	private Login getLogin(int studentId)
	{
		Student student = studentService.getStudent(studentId);
		return student.getLogin();
	}
}
