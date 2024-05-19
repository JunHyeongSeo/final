package com.kh.hondimoyeong.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.hondimoyeong.common.model.vo.PageInfo;
import com.kh.hondimoyeong.review.model.vo.Review;

public interface ReviewService {

	int selectListCount();

	List<Review> selectList(PageInfo pi);

	int searchCount(Map<String, String> searchMap);

	List<Review> search(Map<String, String> searchMap, PageInfo pi);

	int increaseCount(int reviewNo);

	Review selectReview(int reviewNo);

}
