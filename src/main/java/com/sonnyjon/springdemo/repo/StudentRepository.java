package com.sonnyjon.springdemo.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sonnyjon.springdemo.entity.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> 
{
	public Optional<Student> findByLoginEmail(String email);
	
	public List<Student> findByOrderByLastNameAsc();
}
