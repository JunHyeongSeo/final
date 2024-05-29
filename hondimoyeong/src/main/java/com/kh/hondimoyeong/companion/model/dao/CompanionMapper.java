package com.kh.hondimoyeong.companion.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.hondimoyeong.companion.model.vo.Companion;
import com.kh.hondimoyeong.companion.model.vo.CompanionReply;
import com.kh.hondimoyeong.course.model.vo.Course;

@Mapper
public interface CompanionMapper {

	int selectListCount();

	List<Companion> selectAll(RowBounds rowBounds);

	int sortCompanionCount();

	List<Companion> sortCompanions(RowBounds rowBounds);

	int increaseCount(int companionNo);

	Companion selectCompanion(int companionNo);

	int insert(Companion companion);

	int insertBridge(Companion companion);

	int searchCount(Map<String, String> searchMap);

	List<Companion> search(Map<String, String> searchMap, RowBounds rowBounds);

	int update(Companion companion);

	int delete(int companionNo);

	List<Course> selectCourse(Course course);

	List<CompanionReply> selectReply(int companionNo);

	int insertReply(CompanionReply companionReply);

	List<Companion> sortCompanions();

}
