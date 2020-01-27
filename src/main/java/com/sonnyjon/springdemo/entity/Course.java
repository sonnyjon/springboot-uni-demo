package com.sonnyjon.springdemo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="course")
public class Course 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int id;
	
	private String title;
	
	@ManyToOne
	@JoinColumn(name="major_id")
	private Major major;
	
	@ManyToOne
	@JoinColumn(name="teacher_id")
	private Teacher teacher;
		
	@ManyToMany(
		fetch=FetchType.LAZY,
		cascade= {
			CascadeType.PERSIST, 
			CascadeType.MERGE, 
			CascadeType.DETACH, 
			CascadeType.REFRESH
	})
	@JoinTable(
		name="course_student",
		joinColumns=@JoinColumn(name="course_id"),
		inverseJoinColumns=@JoinColumn(name="student_id")
	)
	private List<Student> students;
	
	public Course()
	{
		students = new ArrayList<Student>();
	}
	
	public void addStudent(Student student)
	{
		students.add(student);
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

	public Major getMajor() 
	{
		return major;
	}

	public void setMajor(Major major) 
	{
		this.major = major;
	}

	public Teacher getTeacher() 
	{
		return teacher;
	}

	public void setTeacher(Teacher teacher) 
	{
		this.teacher = teacher;
	}

	public List<Student> getStudents() 
	{
		return students;
	}

	public void setStudents(List<Student> students) 
	{
		this.students = students;
	}

	@Override
	public String toString() 
	{
		return "Course [id=" + id 
				+ ", title=" + title  
				+ ", major=" + major  
				+ ", teacher=" + teacher  
				+ ", students=" + students + "]";
	}
}
