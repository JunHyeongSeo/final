//package com.kh.hondimoyeong.companion.model.dao;
//
//import java.util.List;
//import java.util.Map;
//
//import org.apache.ibatis.session.RowBounds;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.stereotype.Repository;
//
//import com.kh.hondimoyeong.companion.model.vo.Companion;
//import com.kh.hondimoyeong.companion.model.vo.CompanionReply;
//import com.kh.hondimoyeong.course.model.vo.Course;
//
//@Repository
//public class CompanionRepository {
//
//	public int selectListCount(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectOne("companionMapper.selectListCount");
//	}
//
//	public List<Companion> selectAll(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
//		return sqlSession.selectList("companionMapper.selectAll", null, rowBounds);
//	}
//
//	public List<Companion> sortCompanions(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectList("companionMapper.sortCompanions");
//	}
//
//	public int sortCompanionCount(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectOne("companionMapper.sortCompanionCount");
//	}
//
//	public List<Companion> sort(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
//		return sqlSession.selectList("companionMapper.sortCompanions", null, rowBounds);
//	}
//
//	public int increaseCount(SqlSessionTemplate sqlSession, int companionNo) {
//		return sqlSession.update("companionMapper.increaseCount", companionNo);
//	}
//
//	public Companion selectCompanion(SqlSessionTemplate sqlSession, int companionNo) {
//		return sqlSession.selectOne("companionMapper.selectCompanion", companionNo);
//	}
//
//	public int insert(SqlSessionTemplate sqlSession, Companion companion) {
//		return sqlSession.insert("companionMapper.insert", companion);
//	}
//
//	public int searchCount(SqlSessionTemplate sqlSession, Map<String, String> searchMap) {
//		return sqlSession.selectOne("companionMapper.searchCount", searchMap);
//	}
//
//	public List<Companion> search(SqlSessionTemplate sqlSession, Map<String, String> searchMap, RowBounds rowBounds) {
//		return sqlSession.selectList("companionMapper.search", searchMap, rowBounds);
//	}
//
//	public int update(SqlSessionTemplate sqlSession, Companion companion) {
//		return sqlSession.update("companionMapper.update", companion);
//	}
//
//	public int delete(SqlSessionTemplate sqlSession, int companionNo) {
//		return sqlSession.update("companionMapper.delete", companionNo);
//	}
//
//	public List<Course> selectCourse(SqlSessionTemplate sqlSession, Course course) {
//		return sqlSession.selectList("companionMapper.selectCourse", course);
//	}
//
//	public List<CompanionReply> selectReply(SqlSessionTemplate sqlSession, int companionNo) {
//		return sqlSession.selectList("companionMapper.selectReply", companionNo);
//	}
//
//	public int insertReply(SqlSessionTemplate sqlSession, CompanionReply companionReply) {
//		return sqlSession.insert("companionMapper.insertReply", companionReply);
//	}
//	
//	public int insertBridge(SqlSessionTemplate sqlSession, Companion companion) {
//		return sqlSession.insert("companionMapper.insertBridge", companion);
//	}
//
//}
