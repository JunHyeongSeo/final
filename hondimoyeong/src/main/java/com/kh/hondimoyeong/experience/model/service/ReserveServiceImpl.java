package com.kh.hondimoyeong.experience.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hondimoyeong.common.model.vo.PageInfo;
import com.kh.hondimoyeong.experience.model.dao.ReserveMapper;
import com.kh.hondimoyeong.experience.model.vo.Experience;
import com.kh.hondimoyeong.experience.model.vo.Exreview;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReserveServiceImpl  implements ReserveService{
	
//	@Autowired
//	private SqlSessionTemplate sqlSession;
	
//	@Autowired
//	private reserveMapper reserveMapper;
//	
	private final ReserveMapper reserveMapper;

	@Override
	public int insertReserve(Experience experience) {
		return reserveMapper.insertReserve( experience);
	}
	
	@Override
	public Experience findEx() {
		// TODO Auto-generated method stub
		return reserveMapper.findEx();
	}

	@Override
	public int insertHan(Experience experience) {
		return reserveMapper.insertHan(experience);
	}

	@Override
	public List<Experience> findAll() {
		return reserveMapper.findAll();
	}

	@Override
	public int selectListCount() {
		return reserveMapper.selectListCount();
	}

	@Override
	public List<Experience> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return reserveMapper.selectList(rowBounds);
	}

	@Override
	public Experience selectexperience(int experienceNo) {
		return reserveMapper.selectexperience(experienceNo);
	}

	@Override
	public List<Experience> excheck(int userNo) {
		return reserveMapper.excheck(userNo);
	}

	@Override
	public int insertreview(Exreview Exreview) {
		return reserveMapper.insertreview(Exreview);
	}

	@Override
	public List<Exreview> review(Exreview exreview) {
		return reserveMapper.review(exreview);
	}

	
	
	

}
