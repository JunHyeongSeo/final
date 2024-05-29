package com.kh.hondimoyeong.companion.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hondimoyeong.common.model.vo.PageInfo;
import com.kh.hondimoyeong.companion.model.dao.CompanionMapper;
import com.kh.hondimoyeong.companion.model.vo.Companion;
import com.kh.hondimoyeong.companion.model.vo.CompanionReply;
import com.kh.hondimoyeong.course.model.vo.Course;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class CompanionServiceImpl implements CompanionService {
	
	private final CompanionMapper companionMapper;
	

	@Override
	public int selectListCount() {
		return companionMapper.selectListCount();
	}

	@Override
	public List<Companion> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return companionMapper.selectAll(rowBounds);
	}
	
	@Override
	public List<Companion> sortCompanions() {
		return companionMapper.sortCompanions();
	}

	@Override
	public int sortCompanionCount() {
		return companionMapper.sortCompanionCount();
	}

	@Override
	public List<Companion> sortCompanion(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return companionMapper.sortCompanions(rowBounds);
	}

	@Override
	public List<Companion> sort(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return companionMapper.sortCompanions(rowBounds);
	}

	@Override
	public int increaseCount(int companionNo) {
		return companionMapper.increaseCount(companionNo);
	}

	@Override
	public Companion selectCompanion(int companionNo) {
		return companionMapper.selectCompanion(companionNo);
	}

	@Override
	public int insert(Companion companion) {
		
		int result = 1;
		if(companionMapper.insert(companion) > 0) {
			result = result * companionMapper.insertBridge(companion);
		}
		
		return result;
	}

	@Override
	public int searchCount(Map<String, String> searchMap) {
		return companionMapper.searchCount(searchMap);
	}

	@Override
	public List<Companion> search(Map<String, String> searchMap, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return companionMapper.search(searchMap, rowBounds);
	}

	@Override
	public int update(Companion companion) {
		return companionMapper.update(companion);
	}

	@Override
	public int delete(int companionNo) {
		return companionMapper.delete(companionNo);
	}

	@Override
	public List<Course> selectCourse(Course course) {
		return companionMapper.selectCourse(course);
	}

	public List<CompanionReply> selectReply(int companionNo) {
		return companionMapper.selectReply(companionNo);
	}

	@Override
	public int insertReply(CompanionReply companionReply) {
		return companionMapper.insertReply(companionReply);
	}

	
}
