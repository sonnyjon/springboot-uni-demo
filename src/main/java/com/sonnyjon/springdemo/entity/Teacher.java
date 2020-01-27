package com.sonnyjon.springdemo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="teacher")
public class Teacher 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String url;
		
	@OneToOne
	@JoinColumn(name="email")
	private Login login;
	
	@OneToOne
	@JoinColumn(name="college_id")
	private College college;
	
	public Teacher() {}

	public String getFullName()
	{
		return this.firstName + " " + this.lastName;
	}
	
	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public String getFirstName() 
	{
		return firstName;
	}

	public void setFirstName(String firstName) 
	{
		this.firstName = firstName;
	}

	public String getLastName() 
	{
		return lastName;
	}

	public void setLastName(String lastName) 
	{
		this.lastName = lastName;
	}

	public String getUrl() 
	{
		return url;
	}

	public void setUrl(String url) 
	{
		this.url = url;
	}

	public Login getLogin() 
	{
		return login;
	}

	public void setLogin(Login login) 
	{
		this.login = login;
	}

	public College getCollege() 
	{
		return college;
	}

	public void setCollege(College college) 
	{
		this.college = college;
	}

	@Override
	public String toString() 
	{
		return "Teacher [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", url=" + url + ", login="
				+ login + ", college=" + college + "]";
	}
}
