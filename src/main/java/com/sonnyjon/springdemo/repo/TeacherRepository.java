package com.sonnyjon.springdemo.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sonnyjon.springdemo.entity.Teacher;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher, Integer> 
{
	public Optional<Teacher> findByLoginEmail(String email);
	
	public List<Teacher> findByOrderByLastNameAsc();
}
