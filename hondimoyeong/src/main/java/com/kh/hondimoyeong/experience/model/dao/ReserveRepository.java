package com.kh.hondimoyeong.experience.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hondimoyeong.experience.model.vo.Experience;
import com.kh.hondimoyeong.experience.model.vo.Exreview;

@Repository
public class ReserveRepository {
	
	
	/*
	public int insertReserve(SqlSessionTemplate sqlSession, Experience experience) {
		return sqlSession.insert("experienceMapper.insertReserve", experience);
	}
	
	public Experience findEx(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("experienceMapper.findEx");
	}
	
	
	public int insertHan(SqlSessionTemplate sqlSession, Experience experience) {
		return sqlSession.insert("experienceMapper.insertHan", experience);
	}
	
	
	public List<Experience> findAll(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("experienceMapper.findAll");
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("experienceMapper.selectListCount");
	}
	
	public List<Experience> selectList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return sqlSession.selectList("experienceMapper.selectList", null, rowBounds);
	}
	
	
	public Experience selectexperience(SqlSessionTemplate sqlSession, int experienceNo) {
		return sqlSession.selectOne("experienceMapper.selectexperience", experienceNo);
	}
	
	
	public List<Experience> excheck(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectList("experienceMapper.excheck", userNo);
	}
	
	public int insertreview(SqlSessionTemplate sqlSession, Exreview exreview){
		return sqlSession.insert("experienceMapper.insertreview", exreview);
	}
	
	public List<Exreview> review(SqlSessionTemplate sqlSession,Exreview exreview){
		return sqlSession.selectList("experienceMapper.review", exreview);
	}
	*/
}
