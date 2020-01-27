package com.sonnyjon.springdemo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="student")
public class Student 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;

	@Column(name="grade_level")
	private int gradeLevel;
	
	@OneToOne
	@JoinColumn(name="email")
	private Login login;
	
	@OneToOne
	@JoinColumn(name="major_id")
	private Major major;
	
	@ManyToMany(
		fetch=FetchType.LAZY,
		cascade={
			CascadeType.PERSIST, 
			CascadeType.MERGE, 
			CascadeType.DETACH, 
			CascadeType.REFRESH
	})
	@JoinTable(
		name="course_student",
		joinColumns=@JoinColumn(name="student_id"),
		inverseJoinColumns=@JoinColumn(name="course_id")
	)
	private List<Course> courses = new ArrayList<>();
	
	public Student() {}

	public void addCourse(Course course)
	{
		courses.add(course);
	}
	
	public void removeCourse(Course course)
	{
		courses.remove(course);
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

	public int getGradeLevel() 
	{
		return gradeLevel;
	}

	public void setGradeLevel(int gradeLevel) 
	{
		this.gradeLevel = gradeLevel;
	}

	public Login getLogin() 
	{
		return login;
	}

	public void setLogin(Login login) 
	{
		this.login = login;
	}

	public Major getMajor() 
	{
		return major;
	}

	public void setMajor(Major major) 
	{
		this.major = major;
	}	

	public List<Course> getCourses() 
	{
		return courses;
	}

	public void setCourses(List<Course> courses) 
	{
		this.courses = courses;
	}

	@Override
	public String toString() 
	{
		return "Student [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", gradeLevel="
				+ gradeLevel + ", login=" + login + ", major=" + major + "]";
	}
}
