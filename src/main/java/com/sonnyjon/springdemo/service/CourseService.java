package com.sonnyjon.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonnyjon.springdemo.entity.Course;
import com.sonnyjon.springdemo.err.CourseNotFoundException;
import com.sonnyjon.springdemo.repo.CourseRepository;

@Service
public class CourseService 
{
	@Autowired
	private CourseRepository courseRepository;
	
	public List<Course> getCourses()
	{
		return courseRepository.findByOrderByTitleAsc();
	}
	
	public Course getCourse(int id)
	{
		return courseRepository
				.findById(id)
				.orElseThrow(
					() -> new CourseNotFoundException("ID: " + id)
				);
	}
	
	public void saveCourse(Course course)
	{
		courseRepository.save(course);
	}
	
	public void deleteCourse(int id)
	{
		courseRepository.deleteById(id);
	}
}
