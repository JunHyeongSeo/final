package com.kh.hondimoyeong.course.model.service;

import java.util.List;

import com.kh.hondimoyeong.course.model.vo.Course;
import com.kh.hondimoyeong.course.model.vo.CourseFile;

public interface CourseService {
	
	int allCourse();

	List<Course> allCourseList();
	
	int loadFromApi(List<Course> list);
	
	Course courseDetail(int courseIndex);
	
	int updateCourse(Course course);
	
	int updateStamp(CourseFile stamp);
	
	int updateDetailMap(CourseFile detailMap);
	
	int updatePhoto(List<CourseFile> photoList);
	
	List<CourseFile> stampList();
	
	List<Course> userCourse(int userNo);
}
