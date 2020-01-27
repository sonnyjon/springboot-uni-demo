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
import com.sonnyjon.springdemo.service.CollegeService;

@Controller
@RequestMapping("/admin/colleges")
public class CollegeController 
{
	@Autowired
	private CollegeService collegeService;
	
	@GetMapping({"", "/"})
	public String getColleges(Model model)
	{
		model.addAttribute("college", new College());
		model.addAttribute("colleges", collegeService.getColleges());
		
		return "colleges";
	}
	
	@GetMapping("/update")
	public String updateCollege(@RequestParam("collegeId") int id, Model model)
	{
		model.addAttribute("college", collegeService.getCollege(id));
		model.addAttribute("colleges", collegeService.getColleges());
		
		return "colleges";
	}

	@PostMapping("/save")
	public String saveCollege(@ModelAttribute("college") College college)
	{
		collegeService.saveCollege(college);
		return "redirect:/admin/colleges";
	}
	
	@GetMapping("/delete")
	public String deleteCollege(@RequestParam("collegeId") int id)
	{
		collegeService.deleteCollege(id);
		return "redirect:/admin/colleges";
	}
}
