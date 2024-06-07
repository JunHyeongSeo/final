package com.kh.hondimoyeong.experience.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.hondimoyeong.common.model.vo.PageInfo;
import com.kh.hondimoyeong.experience.model.vo.Experience;
import com.kh.hondimoyeong.experience.model.vo.Exreview;

@Mapper
public interface ReserveMapper {
	
	
	
	// 결제하기
		int insertReserve(Experience experience);
		
		// 결제된 체험 찾기
		Experience findEx();
		
		// 한라산 결제하기(무료)
		int insertHan(Experience experience);
		
		// 매출 전체조회
		List <Experience> findAll();
		
		// 매출 페이징
		int selectListCount();
		
		// 체험 목록 조회
		List<Experience> selectList(RowBounds rowbounds);
		
		// 체험 상세 조회
		Experience selectexperience(int experienceNo);

		// 체험 예매내역 존재유무 확인
		List<Experience> excheck(int userNo);
		
		// 한줄리뷰쓰기 & 확인용
		int insertreview(Exreview exriview);
		
		// 체험 리뷰 select
		List<Exreview> review(Exreview exreview);

}
