package com.sonnyjon.springdemo.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sonnyjon.springdemo.entity.Major;

@Repository
public interface MajorRepository extends JpaRepository<Major, Integer> 
{
	public List<Major> findByOrderByTitleAsc();
	
	public Optional<Major> findByTitle(String title);
}
