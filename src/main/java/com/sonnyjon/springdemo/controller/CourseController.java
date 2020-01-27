package com.sonnyjon.springdemo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonnyjon.springdemo.entity.College;
import com.sonnyjon.springdemo.entity.Course;
import com.sonnyjon.springdemo.service.CollegeService;
import com.sonnyjon.springdemo.service.CourseService;

@Controller
@RequestMapping("/admin/courses")
public class CourseController 
{
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private CollegeService collegeService;
		
	@GetMapping({"", "/"})
	public String getCourses(Model model)
	{
		model.addAttribute("colleges", collegeService.getColleges());
		model.addAttribute("courses", courseService.getCourses());
		return "courses";
	}
	
	@GetMapping("/add")
	public String getAddForm(@RequestParam("collegeId") int id, Model model)
	{
		College college = collegeService.getCollege(id);
		
		model.addAttribute("course", new Course());
		model.addAttribute("college", college.getTitle());
		model.addAttribute("majors", college.getMajors());
		model.addAttribute("teachers", college.getTeachers());
		
		return "save-course";
	}
	
	@PostMapping("/save")
	public String addCourse(@ModelAttribute("course") Course course)
	{
		courseService.saveCourse(course);
		return "redirect:/admin/courses";
	}
	
	@GetMapping("/update")
	public String getUpdateForm(@RequestParam("courseId") int id, Model model)
	{
		Course course = courseService.getCourse(id);
		College college = course.getMajor().getCollege();
		
		model.addAttribute("course", course);
		model.addAttribute("college", college.getTitle());
		model.addAttribute("majors", college.getMajors());
		model.addAttribute("teachers", college.getTeachers());
		
		return "save-course";
	}
	
	@GetMapping("/delete")
	public String getDeleteCourse(@RequestParam("courseId") int id)
	{
		courseService.deleteCourse(id);
		return "redirect:/admin/courses";
	}
}
