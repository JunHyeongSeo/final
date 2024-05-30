package com.kh.hondimoyeong.review.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.hondimoyeong.common.model.vo.PageInfo;
import com.kh.hondimoyeong.course.model.vo.Course;
import com.kh.hondimoyeong.review.model.dao.ReviewMapper;
import com.kh.hondimoyeong.review.model.vo.Review;
import com.kh.hondimoyeong.review.model.vo.ReviewComment;
import com.kh.hondimoyeong.review.model.vo.ReviewImg;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	private final ReviewMapper reviewMapper;
	
	@Override
	public int selectListCount() {
		return reviewMapper.selectListCount();
	}

	@Override
	public List<Review> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return reviewMapper.selectList(rowBounds);
	}

	@Override
	public int searchCount(Map<String, String> searchMap) {
		return reviewMapper.searchCount(searchMap);
	}

	@Override
	public List<Review> search(Map<String, String> searchMap, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return reviewMapper.search(searchMap, rowBounds);
	}

	@Override
	public int increaseCount(int reviewNo) {
		return reviewMapper.increaseCount(reviewNo);
	}

	@Override
	public Review selectReview(int reviewNo) {
		return reviewMapper.selectReview(reviewNo);
	}

	@Override
	public List<ReviewComment> selectComment(int reviewNo) {
		return reviewMapper.selectComment(reviewNo);
	}

	@Override
	public int insertComment(ReviewComment reviewComment) {
		return reviewMapper.insertComment(reviewComment);
	}

	@Override
	public List<ReviewImg> selectReviewImgs(int reviewNo) {
		return reviewMapper.selectReviewImgs(reviewNo);
	}

	@Override
	public List<ReviewComment> selectCommentCount() {
		return reviewMapper.selectCommentCount();
	}

	@Override
	public int insert(Review review) {
		return reviewMapper.insert(review);
	}

	@Override
	public int insertImg(ReviewImg reviewImg) {
		return reviewMapper.insertImg(reviewImg);
	}

	@Override
	public List<Course> selectCourse(Course course) {
		return reviewMapper.selectCourse(course);
	}

	@Override
	public int update(Review review) {
		return reviewMapper.update(review);
	}

	@Override
	public int updateImg(ReviewImg reviewImg) {
		return reviewMapper.updateImg(reviewImg);
	}

	@Override
	public ReviewImg getReviewImgByReviewNo(int reviewNo) {
		return reviewMapper.getReviewImgByReviewNo(reviewNo);
	}

	@Override
	public int delete(int reviewNo) {
		return reviewMapper.delete(reviewNo);
	}

	@Override
	public int deleteImg(int reviewNo) {
		return reviewMapper.deleteImg(reviewNo);
	}






}
