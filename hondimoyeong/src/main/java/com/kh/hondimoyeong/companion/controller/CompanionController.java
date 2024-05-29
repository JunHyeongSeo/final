package com.kh.hondimoyeong.companion.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hondimoyeong.common.model.vo.PageInfo;
import com.kh.hondimoyeong.common.template.Pagination;
import com.kh.hondimoyeong.companion.model.service.CompanionService;
import com.kh.hondimoyeong.companion.model.vo.Companion;
import com.kh.hondimoyeong.companion.model.vo.CompanionReply;
import com.kh.hondimoyeong.course.model.vo.Course;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CompanionController {
	
	@Autowired
	private CompanionService companionService;
	
	@GetMapping("companion")
	public String selectAll(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		PageInfo pi = Pagination.getPageInfo(companionService.selectListCount(), page, 10, 5);
		model.addAttribute("companion", companionService.selectAll(pi));
		model.addAttribute("pageInfo", pi);
		
		return "companion/companionList";
	}
	
	@GetMapping("sort.cmp")
	public String sortCompanion(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		int totalCount = companionService.sortCompanionCount();
		PageInfo pi = Pagination.getPageInfo(totalCount, page, 10, 5);
		List<Companion> sort = companionService.sort(pi);
		
		model.addAttribute("sortPage", pi);
		model.addAttribute("companion", sort);
		
		return "companion/companionList";
	}
	
	@GetMapping("detail.cmp")
	public ModelAndView detail(int companionNo, ModelAndView mv) {
		
		if(companionService.increaseCount(companionNo) > 0) {
			mv.addObject("companion", companionService.selectCompanion(companionNo)).setViewName("companion/companionDetail");
		} else {
			mv.addObject("errorMsg", "실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@GetMapping("enrollForm.cmp")
	public String enrollForm(Model model, Course course) {
		List<Course> courseList = companionService.selectCourse(course);
		model.addAttribute("courseList", courseList);
		return "companion/companionInsertForm";
	}
	
	@PostMapping("insert.cmp")
	public String insert(Companion companion, HttpSession session, Model model) {
		
		if(companionService.insert(companion) > 0) {
			session.setAttribute("alertMsg", "모집 글이 등록되었습니다!");
			return "redirect:companion";
		} else {
			session.setAttribute("alertMsg", "모집 글 등록에 실패했습니다.");
			return "companion/companionInsertForm";
		}
	}
	
	@PostMapping("updateForm.cmp")
	public ModelAndView updateForm(int companionNo, ModelAndView mv, Course course) {
		List<Course> courseList = companionService.selectCourse(course);
		
		mv.addObject("courseList", courseList);
		mv.addObject("companion", companionService.selectCompanion(companionNo)).setViewName("companion/companionUpdateForm");
		return mv;
	}
	
	@PostMapping("update.cmp")
	public String update(@ModelAttribute Companion companion, HttpSession session) {
		if(companionService.update(companion) > 0) {
			session.setAttribute("alertMsg", "모집 글이 수정 되었습니다!");
			return "redirect:detail.cmp?companionNo=" + companion.getCompanionNo();
		} else {
			session.setAttribute("alertMsg", "모집 글 수정 실패했습니다.");
			return "companion/companionUpdateForm";
		}
	}
	
	@PostMapping("delete.cmp")
	public String delete(@ModelAttribute Companion companion, int companionNo, HttpSession session) {
		if(companionService.delete(companionNo) > 0) {
			session.setAttribute("alertMsg", "모집글이 삭제되었습니다.");
			return "redirect:companion";
		} else {
			session.setAttribute("alertMsg", "모집글 삭제에 실패했습니다.");
			return "redirect:companion";
		}
	}
	
	@GetMapping("search.cmp")
	public String search(@RequestParam(value="keyword") String keyword,
						 @RequestParam(value="condition") String condition,
						 @RequestParam Map<String, String> map,
						 @RequestParam(value="page", defaultValue="1") int page, Model model) {

		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("condition", condition);
		searchMap.put("keyword", keyword);
		
		int totalCount = companionService.searchCount(searchMap);
		PageInfo pi = Pagination.getPageInfo(totalCount, page, 10, 5);
		List<Companion> searchList = companionService.search(searchMap, pi);

		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
		model.addAttribute("companion", searchList);
		model.addAttribute("searchPage", pi);
		
		return "companion/companionList";
	}

	// 댓글
	@ResponseBody
	@GetMapping(value="reply", produces="application/json; charset=UTF-8")
	public String selectReply(int companionNo) {
		return new Gson().toJson(companionService.selectReply(companionNo));
	}
	
	@ResponseBody
	@PostMapping("reply")
	public String ajaxInsertReply(CompanionReply companionReply) {
		return companionService.insertReply(companionReply) > 0 ? "success" : "fail";
	}
}
