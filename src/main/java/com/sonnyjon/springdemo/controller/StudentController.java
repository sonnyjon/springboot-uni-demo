package com.sonnyjon.springdemo.controller;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sonnyjon.springdemo.entity.Course;
import com.sonnyjon.springdemo.entity.Student;
import com.sonnyjon.springdemo.service.CourseService;
import com.sonnyjon.springdemo.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController 
{
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CourseService courseService;

	@GetMapping({"", "/"})
	public String findStudent(HttpServletRequest request)
	{
		Principal principal = request.getUserPrincipal();
		Student student = studentService.getStudent(principal.getName());
		
		return "redirect:/student/" + student.getId();
	}
	
	@GetMapping("/{studentId}")
	public String getMenu(@PathVariable int studentId, Model model)
	{
		Student student = studentService.getStudent(studentId);
		model.addAttribute("courses", student.getCourses());
		
		return "student-menu";
	}
	
	@GetMapping("/{studentId}/courses")
	public String showCourses(@PathVariable int studentId, Model model)
	{
		Student student = studentService.getStudent(studentId);
		List<Course> studentCourses = student.getCourses();
		
		List<Course> unregistered = courseService.getCourses()
												.stream()
												.filter(c -> !studentCourses.contains(c))
												.collect(Collectors.toList());
				
		model.addAttribute("student", student);
		model.addAttribute("myCourses", studentCourses);
		model.addAttribute("notMyCourses", unregistered);
		
		return "student-courses";
	}
	
	@GetMapping("/{studentId}/courses/r/{courseId}")
	public String registerCourse(@PathVariable int studentId,
								@PathVariable int courseId)
	{
		Student student = studentService.getStudent(studentId);
		student.addCourse(courseService.getCourse(courseId));
		studentService.saveStudent(student);

		return "redirect:/student/" + studentId + "/courses";
	}
	
	@GetMapping("/{studentId}/courses/u/{courseId}")
	public String unregisterCourse(@PathVariable int studentId,
								@PathVariable int courseId)
	{
		Student student = studentService.getStudent(studentId);
		student.removeCourse(courseService.getCourse(courseId));
		studentService.saveStudent(student);

		return "redirect:/student/" + studentId + "/courses";
	}

}
