package com.sonnyjon.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonnyjon.springdemo.entity.College;
import com.sonnyjon.springdemo.err.CollegeNotFoundException;
import com.sonnyjon.springdemo.repo.CollegeRepository;

@Service
public class CollegeService 
{
	@Autowired
	private CollegeRepository collegeRepository;
	
	public List<College> getColleges()
	{
		return collegeRepository.findByOrderByTitleAsc();
	}
	
	public College getCollege(int id)
	{
		return collegeRepository
					.findById(id)
					.orElseThrow(
						() -> new CollegeNotFoundException("ID: " + id)
					);
	}
	
	public void saveCollege(College college)
	{
		collegeRepository.save(college);
	}
	
	public void deleteCollege(int id)
	{
		collegeRepository.deleteById(id);
	}
}
