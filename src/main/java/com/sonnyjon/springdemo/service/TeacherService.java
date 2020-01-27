package com.sonnyjon.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonnyjon.springdemo.entity.Teacher;
import com.sonnyjon.springdemo.err.TeacherNotFoundException;
import com.sonnyjon.springdemo.repo.TeacherRepository;

@Service
public class TeacherService 
{
	@Autowired
	private TeacherRepository teacherRepository;
	
	public List<Teacher> getTeachers()
	{
		return teacherRepository.findByOrderByLastNameAsc();
	}
	
	public Teacher getTeacher(int id)
	{
		return teacherRepository
				.findById(id)
				.orElseThrow(
					() -> new TeacherNotFoundException("ID: " + id)
				);
	}
	
	public void saveTeacher(Teacher teacher)
	{
		teacherRepository.save(teacher);
	}
	
	public void deleteTeacher(int id)
	{
		teacherRepository.deleteById(id);
	}
}
