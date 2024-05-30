package com.kh.hondimoyeong.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.hondimoyeong.course.model.vo.Course;
import com.kh.hondimoyeong.review.model.vo.Review;
import com.kh.hondimoyeong.review.model.vo.ReviewComment;
import com.kh.hondimoyeong.review.model.vo.ReviewImg;

@Mapper
public interface ReviewMapper {

	int selectListCount();

	List<Review> selectList(RowBounds rowBounds);

	int searchCount(Map<String, String> searchMap);

	List<Review> search(Map<String, String> searchMap, RowBounds rowBounds);

	int increaseCount(int reviewNo);

	Review selectReview(int reviewNo);

	List<ReviewComment> selectComment(int reviewNo);

	int insertComment(ReviewComment reviewComment);

	List<ReviewImg> selectReviewImgs(int reviewNo);

	List<ReviewComment> selectCommentCount();

	int insert(Review review);

	int insertImg(ReviewImg reviewImg);

	List<Course> selectCourse(Course course);

	int update(Review review);

	int updateImg(ReviewImg reviewImg);

	ReviewImg getReviewImgByReviewNo(int reviewNo);

	int delete(int reviewNo);

	int deleteImg(int reviewNo);
}
