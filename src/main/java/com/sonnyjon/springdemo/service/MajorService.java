package com.sonnyjon.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonnyjon.springdemo.entity.Major;
import com.sonnyjon.springdemo.err.MajorNotFoundException;
import com.sonnyjon.springdemo.repo.MajorRepository;

@Service
public class MajorService 
{
	@Autowired
	private MajorRepository majorRepository;
	
	public List<Major> getMajors()
	{
		return majorRepository.findByOrderByTitleAsc();
	}
	
	public Major getMajor(int id)
	{
		return majorRepository
				.findById(id)
				.orElseThrow(
					() -> new MajorNotFoundException("ID: " + id)
				);
	}
	
	public Major getMajor(String title)
	{
		return majorRepository
				.findByTitle(title)
				.orElseThrow(
					() -> new MajorNotFoundException("TITLE: " + title)
				);
	}
	
	public void saveMajor(Major major)
	{
		majorRepository.save(major);
	}
	
	public void deleteMajor(int id)
	{
		majorRepository.deleteById(id);
	}
}
