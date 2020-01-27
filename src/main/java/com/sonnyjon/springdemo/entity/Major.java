package com.sonnyjon.springdemo.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="major")
public class Major 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@ManyToOne(
		cascade={
			CascadeType.PERSIST, 
			CascadeType.MERGE, 
			CascadeType.DETACH, 
			CascadeType.REFRESH
	})
	@JoinColumn(name="college_id")
	private College college;
	
	public Major() {}

	public Major(String title) 
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

	public College getCollege() 
	{
		return college;
	}

	public void setCollege(College college) 
	{
		this.college = college;
	}
}
