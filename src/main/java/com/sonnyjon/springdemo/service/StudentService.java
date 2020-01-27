package com.sonnyjon.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonnyjon.springdemo.entity.Student;
import com.sonnyjon.springdemo.err.StudentNotFoundException;
import com.sonnyjon.springdemo.repo.StudentRepository;

@Service
public class StudentService 
{
	@Autowired
	private StudentRepository studentRepository;
	
	public List<Student> getStudents()
	{
		return studentRepository.findByOrderByLastNameAsc();
	}
	
	public Student getStudent(int id)
	{
		return studentRepository
				.findById(id)
				.orElseThrow(
					() -> new StudentNotFoundException("ID: " + id)
				);
	}
	
	public Student getStudent(String email)
	{
		return studentRepository
				.findByLoginEmail(email)
				.orElseThrow(
					() -> new StudentNotFoundException("USERNAME: " + email)
				);
	}
	
	public void saveStudent(Student student)
	{
		studentRepository.save(student);
	}
	
	public void deleteStudent(int id)
	{
		studentRepository.deleteById(id);
	}
}
