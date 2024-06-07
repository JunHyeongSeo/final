package com.kh.hondimoyeong.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hondimoyeong.common.model.vo.PageInfo;
import com.kh.hondimoyeong.common.template.Pagination;
import com.kh.hondimoyeong.course.model.vo.Course;
import com.kh.hondimoyeong.review.model.service.ReviewService;
import com.kh.hondimoyeong.review.model.vo.Review;
import com.kh.hondimoyeong.review.model.vo.ReviewComment;
import com.kh.hondimoyeong.review.model.vo.ReviewImg;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	
	@RequestMapping("review")
	public String selectList(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		PageInfo pi = Pagination.getPageInfo(reviewService.selectListCount(), page, 6, 5);
		
		List<ReviewComment> comment = reviewService.selectCommentCount();
		
		model.addAttribute("comment", comment);
		model.addAttribute("review", reviewService.selectList(pi));
		model.addAttribute("pageInfo", pi);
		return "review/reviewList";
	}
	
	@RequestMapping("search.rvw")
	public String search(@RequestParam(value="keyword") String keyword,
			@RequestParam(value="condition") String condition,
			@RequestParam Map<String, String> map,
			@RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("condition", condition);
		searchMap.put("keyword", keyword);
		
		int totalCount = reviewService.searchCount(searchMap);
		PageInfo pi = Pagination.getPageInfo(totalCount, page, 6, 5);
		List<Review> review = reviewService.search(searchMap, pi);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
		model.addAttribute("review", review);
		model.addAttribute("searchPage", pi);
		
		return "review/reviewList";
	}
	
	
	@RequestMapping("detail.rvw")
	public ModelAndView detail(int reviewNo, ModelAndView mv) {
		
		Review review = reviewService.selectReview(reviewNo);
		if(review != null) {
			List<ReviewImg> reviewImgs = reviewService.selectReviewImgs(reviewNo);
			review.setReviewImgs(reviewImgs);
			
			if(reviewService.increaseCount(reviewNo) > 0) {
				mv.addObject("review", review).setViewName("review/reviewDetail");
			} else {
				mv.addObject("errorMsg", "조회 실패").setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "리뷰 찾을 수 없음").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping("insertForm.rvw")
	public String insertForm(Model model, Course course) {
		List<Course> courseList = reviewService.selectCourse(course);
		model.addAttribute("courseList", courseList);
		return "review/reviewInsertForm";
	}
	
	@PostMapping("insert.rvw")
	public String insert(@ModelAttribute Review review,
	                     @RequestParam("upfiles1") MultipartFile[] upfiles1,
	                     @RequestParam("upfiles2") MultipartFile[] upfiles2,
	                     HttpSession session,
	                     Model model) {
	    
	    reviewService.insert(review);
	    int reviewNo = review.getReviewNo();
	    
	    if (reviewNo > 0) { 
	        List<MultipartFile> allFiles = new ArrayList<MultipartFile>();
	        
	        // 첫 번째 파일들의 파일 레벨은 1
	        for (MultipartFile file : upfiles1) {
	            if (!file.isEmpty()) {
	                allFiles.add(file);
	            }
	        }
	        
	        // 두 번째 파일들의 파일 레벨은 2
	        for (MultipartFile file : upfiles2) {
	            if (!file.isEmpty()) {
	                allFiles.add(file);
	            }
	        }
	        
	        for (int i = 0; i < allFiles.size(); i++) {
	            MultipartFile upfile = allFiles.get(i);
	            String originalFilename = upfile.getOriginalFilename();
	            String changeName = saveFile(upfile, session);
	            
	            // REVIEW_IMG 테이블에 파일 정보 삽입
	            ReviewImg reviewImg = new ReviewImg();
	            reviewImg.setReviewNo(reviewNo);
	            reviewImg.setOriginName(originalFilename);
	            reviewImg.setChangeName(changeName);
	            
	            // 파일 레벨 설정
	            if (i < upfiles1.length) {
	                reviewImg.setFileLevel(1); // 첫 번째 파일들의 파일 레벨은 1
	            } else {
	                reviewImg.setFileLevel(2); // 두 번째 파일들의 파일 레벨은 2
	            }
	            
	            reviewService.insertImg(reviewImg);
	        }
	        

	        session.setAttribute("alertMsg", "게시글 작성 성공!");
	        return "redirect:review";
	    } else { 
	        model.addAttribute("errorMsg", "작성 실패");
	        return "common/errorPage";
	    }
	}


	
	@RequestMapping("update.rvw")
	public String update(@ModelAttribute Review review,
	                     @RequestParam("reUpfile1") MultipartFile[] reUpfiles1,
	                     @RequestParam("reUpfile2") MultipartFile[] reUpfiles2,
	                     HttpSession session,
	                     Model model) {
	    
	    reviewService.update(review); // 리뷰 업데이트

	    int reviewNo = review.getReviewNo();
	    
	    if (reviewNo > 0) {
	        
	        // 기존 파일이 있는지 확인
	        List<ReviewImg> existingImages = reviewService.selectReviewImgs(reviewNo);
	        boolean hasExistingFiles = existingImages != null && !existingImages.isEmpty();
	        
	        // 새로운 파일이 있는지 확인
	        boolean hasNewFiles = false;
	        for (MultipartFile file : reUpfiles1) {
	            if (!file.isEmpty()) {
	                hasNewFiles = true;
	                break;
	            }
	        }
	        
	        if (!hasNewFiles) {
	            for (MultipartFile file : reUpfiles2) {
	                if (!file.isEmpty()) {
	                    hasNewFiles = true;
	                    break;
	                }
	            }
	        }

	        // 기존 이미지가 있을 때
	        if (hasExistingFiles) {
	            // 기존 이미지 업데이트 및 새로운 파일 insert
	            for (int i = 0; i < existingImages.size(); i++) {
	                ReviewImg existingImage = existingImages.get(i);
	                MultipartFile newFile = null;
	                if (i < reUpfiles1.length) {
	                    newFile = reUpfiles1[i];
	                } else if (i - reUpfiles1.length < reUpfiles2.length) {
	                    newFile = reUpfiles2[i - reUpfiles1.length];
	                }
	                
	                if (newFile != null && !newFile.isEmpty()) {
	                    String originalFilename = newFile.getOriginalFilename();
	                    String changeName = saveFile(newFile, session);
	                    
	                    existingImage.setOriginName(originalFilename);
	                    existingImage.setChangeName(changeName);
	                    // 파일 레벨 설정
	                    if (i < reUpfiles1.length) {
	                        existingImage.setFileLevel(1); // 첫 번째 파일
	                    } else {
	                        existingImage.setFileLevel(2); // 두 번째 파일
	                    }
	                    reviewService.updateImg(existingImage); // 기존 파일 업데이트
	                }
	            }
	        } else { // 기존 이미지가 없을 때
	            for (ReviewImg img : existingImages) {
	                new File(session.getServletContext().getRealPath(img.getChangeName())).delete();
	            }
	            insertNewImages(reUpfiles1, reUpfiles2, reviewNo, session);
	        }

	        session.setAttribute("alertMsg", "게시글 수정 성공!");
	        return "redirect:detail.rvw?reviewNo=" + reviewNo;
	    } else { 
	        model.addAttribute("errorMsg", "수정 실패");
	        return "common/errorPage";
	    }
	}


	private void insertNewImages(MultipartFile[] reUpfiles1, MultipartFile[] reUpfiles2, int reviewNo, HttpSession session) {
	    // 새로운 파일 insert
	    for (int i = 0; i < reUpfiles1.length; i++) {
	        MultipartFile upfile = reUpfiles1[i];
	        if (!upfile.isEmpty()) {
	            String originalFilename = upfile.getOriginalFilename();
	            String changeName = saveFile(upfile, session);
	            
	            // REVIEW_IMG 테이블에 파일 정보 삽입
	            ReviewImg reviewImg = new ReviewImg();
	            reviewImg.setReviewNo(reviewNo);
	            reviewImg.setOriginName(originalFilename);
	            reviewImg.setChangeName(changeName);
	            reviewImg.setFileLevel(1); // 첫 번째 파일 레벨
	            reviewService.insertImg(reviewImg); // 새로운 파일 insert
	        }
	    }
	    
	    for (int i = 0; i < reUpfiles2.length; i++) {
	        MultipartFile upfile = reUpfiles2[i];
	        if (!upfile.isEmpty()) {
	            String originalFilename = upfile.getOriginalFilename();
	            String changeName = saveFile(upfile, session);
	            
	            // REVIEW_IMG 테이블에 파일 정보 삽입
	            ReviewImg reviewImg = new ReviewImg();
	            reviewImg.setReviewNo(reviewNo);
	            reviewImg.setOriginName(originalFilename);
	            reviewImg.setChangeName(changeName);
	            reviewImg.setFileLevel(2); // 두 번째 파일 레벨
	            reviewService.insertImg(reviewImg); // 새로운 파일 insert
	        }
	    }
	}


	@PostMapping("updateForm.rvw")
	public ModelAndView updateForm(int reviewNo, ModelAndView mv, Course course) {
		
		List<Course> courseList = reviewService.selectCourse(course);
		List<ReviewImg> reviewImg = reviewService.selectReviewImgs(reviewNo);
		mv.addObject("reviewImg", reviewImg);
		mv.addObject("courseList", courseList);
		mv.addObject("review", reviewService.selectReview(reviewNo)).setViewName("review/reviewUpdateForm");
		return mv;
	}

	public String saveFile(MultipartFile upfile, HttpSession session) {
	    String originName = upfile.getOriginalFilename();
	    String ext = originName.substring(originName.lastIndexOf("."));
	    String uuid = UUID.randomUUID().toString(); // UUID 생성
	    String changeName = uuid + ext; // UUID와 파일 확장자를 결합하여 고유한 파일 이름 생성
	    String savePath = session.getServletContext().getRealPath("/resources/reviewFile/");
	    
	    try {
	        upfile.transferTo(new File(savePath + changeName));
	    } catch (IllegalStateException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return "resources/reviewFile/" + changeName;
	}
	

	@RequestMapping("delete.rvw")
	public String delete(int reviewNo, HttpSession session, String filePath) {
		if(reviewService.delete(reviewNo) > 0) {
	        List<ReviewImg> existingImages = reviewService.selectReviewImgs(reviewNo);
	        for (ReviewImg img : existingImages) {
	            new File(session.getServletContext().getRealPath(img.getChangeName())).delete();
	            reviewService.deleteImg(img.getReviewNo());
	        }
			session.setAttribute("alertMsg", "삭제 성공");
			return "redirect:review";
		} else {
			session.setAttribute("alertMsg", "삭제 실패");
			return "redirect:review";
		}
	}
	
	/**
	 * 댓글 ajax
	 */
	@ResponseBody
	@GetMapping(value="comment", produces="application/json; charset=UTF-8")
	public String selectComment(int reviewNo) {
		return new Gson().toJson(reviewService.selectComment(reviewNo));
	}
	
	@ResponseBody
	@PostMapping("comment")
	public String ajaxInsertComment(ReviewComment reviewComment) {
		return reviewService.insertComment(reviewComment) > 0 ? "success" : "fail";
	}

}
