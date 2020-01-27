package com.sonnyjon.springdemo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonnyjon.springdemo.entity.Major;
import com.sonnyjon.springdemo.service.CollegeService;
import com.sonnyjon.springdemo.service.MajorService;

@Controller
@RequestMapping("/admin/majors")
public class MajorController 
{
	@Autowired
	private MajorService majorService;
	
	@Autowired
	private CollegeService collegeService;
	
	@GetMapping({"", "/"})
	public String getMajors(Model model)
	{
		model.addAttribute("major", new Major());
		model.addAttribute("majors", majorService.getMajors());
		model.addAttribute("colleges", collegeService.getColleges());
		
		return "majors";
	}
	
	@GetMapping("/update")
	public String updateMajor(@RequestParam("majorId") int id, Model model)
	{
		model.addAttribute("major", majorService.getMajor(id));
		model.addAttribute("majors", majorService.getMajors());
		model.addAttribute("colleges", collegeService.getColleges());
		
		return "majors";
	}
	
	@PostMapping("/save")
	public String saveMajor(@ModelAttribute("major") Major major)
	{
		majorService.saveMajor(major);
		return "redirect:/admin/majors";
	}
	
	@GetMapping("/delete")
	public String deleteMajor(@RequestParam("majorId") int id)
	{
		majorService.deleteMajor(id);
		return "redirect:/admin/majors";
	}
}
