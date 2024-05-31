package com.kh.hondimoyeong.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.hondimoyeong.common.model.vo.PageInfo;
import com.kh.hondimoyeong.course.model.vo.Course;
import com.kh.hondimoyeong.review.model.vo.Review;
import com.kh.hondimoyeong.review.model.vo.ReviewComment;
import com.kh.hondimoyeong.review.model.vo.ReviewImg;

public interface ReviewService {

	int selectListCount();
	List<Review> selectList(PageInfo pi);

	Review selectReview(int reviewNo);
	
	int searchCount(Map<String, String> searchMap);
	List<Review> search(Map<String, String> searchMap, PageInfo pi);

	int increaseCount(int reviewNo);


	List<ReviewComment> selectCommentCount();
	List<ReviewComment> selectComment(int reviewNo);
	int insertComment(ReviewComment reviewComment);

	List<ReviewImg> selectReviewImgs(int reviewNo);

	int insert(Review review);
	int insertImg(ReviewImg reviewImg);

	List<Course> selectCourse(Course course);

	int update(Review review);
	int updateImg(ReviewImg reviewImg);
	ReviewImg getReviewImgByReviewNo(int reviewNo);

	int delete(int reviewNo);
	int deleteImg(int reviewNo);



}
