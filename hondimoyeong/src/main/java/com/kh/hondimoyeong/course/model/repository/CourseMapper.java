package com.kh.hondimoyeong.course.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.hondimoyeong.course.model.vo.Course;
import com.kh.hondimoyeong.course.model.vo.CourseFile;

@Mapper
public interface CourseMapper {

	List<Course> allCourseList();
	
	int loadFromApi(List<Course> list);
	
	Course courseDetail(int courseIndex);
	
	int updateCourse(Course course);
	
	int updateStamp(CourseFile stamp);
	
	int updateDetailMap(CourseFile detailMap);
	
	int updatePhoto(List<CourseFile> photoList);
	 
	List<CourseFile> stampList();
	
	List<Course> userCourse(int userNo);
	
	int allCourse();
}
