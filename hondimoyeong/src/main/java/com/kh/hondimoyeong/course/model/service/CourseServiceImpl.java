package com.kh.hondimoyeong.course.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.hondimoyeong.course.model.repository.CourseMapper;
import com.kh.hondimoyeong.course.model.vo.Course;
import com.kh.hondimoyeong.course.model.vo.CourseFile;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CourseServiceImpl implements CourseService{
	
	private final CourseMapper courseMapper;

	@Override
	public List<Course> allCourseList() {
		return courseMapper.allCourseList();
	}

	@Override
	public int loadFromApi(List<Course> list) {
		return courseMapper.loadFromApi(list);
	}

	@Override
	public Course courseDetail(int courseIndex) {
		return courseMapper.courseDetail(courseIndex);
	}

	@Override
	public int updateCourse(Course course) {
		return courseMapper.updateCourse(course);
	}

	@Override
	public int updateStamp(CourseFile stamp) {
		return courseMapper.updateStamp(stamp);
	}

	@Override
	public int updateDetailMap(CourseFile detailMap) {
		return courseMapper.updateDetailMap(detailMap);
	}

	@Override
	public int updatePhoto(List<CourseFile> photoList) {
		return courseMapper.updatePhoto(photoList);
	}

	@Override
	public List<CourseFile> stampList() {
		return courseMapper.stampList();
	}

	@Override
	public List<Course> userCourse(int userNo) {
		return courseMapper.userCourse(userNo);
	}

	@Override
	public int allCourse() {
		return courseMapper.allCourse();
	}
	
	
	
	
	
	

}
