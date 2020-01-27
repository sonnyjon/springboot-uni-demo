package com.sonnyjon.springdemo.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="college")
public class College 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String title;
	
	@OneToMany(
		fetch=FetchType.LAZY,
		mappedBy="college",
		cascade={
			CascadeType.PERSIST, 
			CascadeType.MERGE, 
			CascadeType.DETACH, 
			CascadeType.REFRESH					
	})
	private List<Major> majors;
	
	@OneToMany(
		fetch=FetchType.LAZY,
		mappedBy="college",
		cascade={
			CascadeType.PERSIST, 
			CascadeType.MERGE, 
			CascadeType.DETACH, 
			CascadeType.REFRESH					
	})
	private List<Teacher> teachers;
	
	public College() {}

	public College(String title) 
	{
		this.title = title;
	}

	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public String getTitle() 
	{
		return title;
	}

	public void setTitle(String title) 
	{
		this.title = title;
	}

	public List<Major> getMajors() 
	{
		return majors;
	}

	public void setMajors(List<Major> majors) 
	{
		this.majors = majors;
	}

	public List<Teacher> getTeachers() 
	{
		return teachers;
	}

	public void setTeachers(List<Teacher> teachers) 
	{
		this.teachers = teachers;
	}
}
