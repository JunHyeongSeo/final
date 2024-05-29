//package com.kh.hondimoyeong.review.model.dao;
//
//import java.util.List;
//import java.util.Map;
//
//import org.apache.ibatis.session.RowBounds;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.stereotype.Repository;
//
//import com.kh.hondimoyeong.course.model.vo.Course;
//import com.kh.hondimoyeong.review.model.vo.Review;
//import com.kh.hondimoyeong.review.model.vo.ReviewComment;
//import com.kh.hondimoyeong.review.model.vo.ReviewImg;
//
//@Repository
//public class ReviewRepository {
//
//	public int selectListCount(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectOne("reviewMapper.selectListCount");
//	}
//
//	public List<Review> selectList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
//		return sqlSession.selectList("reviewMapper.selectList", null, rowBounds);
//	}
//
//	public int searchCount(SqlSessionTemplate sqlSession, Map<String, String> searchMap) {
//		return sqlSession.selectOne("reviewMapper.searchCount", searchMap);
//	}
//
//	public List<Review> search(SqlSessionTemplate sqlSession, Map<String, String> searchMap, RowBounds rowBounds) {
//		return sqlSession.selectList("reviewMapper.search", searchMap, rowBounds);
//	}
//
//	public int increaseCount(SqlSessionTemplate sqlSession, int reviewNo) {
//		return sqlSession.update("reviewMapper.increaseCount", reviewNo);
//	}
//
//	public Review selectReview(SqlSessionTemplate sqlSession, int reviewNo) {
//		return sqlSession.selectOne("reviewMapper.selectReview", reviewNo);
//	}
//
//	public List<ReviewComment> selectComment(SqlSessionTemplate sqlSession, int reviewNo) {
//		return sqlSession.selectList("reviewMapper.selectComment", reviewNo);
//	}
//
//	public int insertComment(SqlSessionTemplate sqlSession, ReviewComment reviewComment) {
//		return sqlSession.insert("reviewMapper.insertComment", reviewComment);
//	}
//
//	public List<ReviewImg> selectReviewImgs(SqlSessionTemplate sqlSession, int reviewNo) {
//		return sqlSession.selectList("reviewMapper.selectReviewImgs", reviewNo);
//	}
//
//	public List<ReviewComment> selectCommentCount(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectList("reviewMapper.selectCommentCount");
//	}
//
//	public int insert(SqlSessionTemplate sqlSession, Review review) {
//		return sqlSession.insert("reviewMapper.insert", review);
//	}
//
//	public int insertImg(SqlSessionTemplate sqlSession, ReviewImg reviewImg) {
//		return sqlSession.insert("reviewMapper.insertImg", reviewImg);
//	}
//
//	public List<Course> selectCourse(SqlSessionTemplate sqlSession, Course course) {
//		return sqlSession.selectList("reviewMapper.selectCourse", course);
//	}
//
//	public int update(SqlSessionTemplate sqlSession, Review review) {
//		return sqlSession.update("reviewMapper.update", review);
//	}
//
//	public int updateImg(SqlSessionTemplate sqlSession, ReviewImg reviewImg) {
//		return sqlSession.update("reviewMapper.updateImg", reviewImg);
//	}
//
//	public ReviewImg getReviewImgByReviewNo(SqlSessionTemplate sqlSession, int reviewNo) {
//		return sqlSession.selectOne("reviewMapper.getReviewImgByReviewNo", reviewNo);
//	}
//
//	public int delete(SqlSessionTemplate sqlSession, int reviewNo) {
//		return sqlSession.update("reviewMapper.delete", reviewNo);
//	}
//
//
//
//}
