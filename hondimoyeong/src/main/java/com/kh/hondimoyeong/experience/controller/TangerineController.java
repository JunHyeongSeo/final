package com.kh.hondimoyeong.experience.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.hondimoyeong.experience.model.service.ReserveService;
import com.kh.hondimoyeong.experience.model.vo.Experience;
import com.kh.hondimoyeong.experience.model.vo.Exreview;
import com.kh.hondimoyeong.member.model.vo.Member;

@Controller
public class TangerineController {
	
	@Autowired
	private  ReserveService reserveService;
	
	@Autowired
	private Environment env;
	
	@GetMapping("tangerine")
	public String tangerine(HttpSession session) {
		
		if(!(session.getAttribute("loginUser")== null)) {
			
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			//System.out.println(userNo);
			
			
			if(userNo > 0) {
				List<Experience> experience = reserveService.excheck(userNo);
				System.out.println(experience);
				
				if(!(experience == null)) {
					session.setAttribute("experience", experience);
				}
			}
		}
		
		// 한라산 리뷰 전부 조회
		Exreview exreview = new Exreview();
		
		exreview.setExperienceCategory("감귤체험");
		List<Exreview> review = reserveService.review(exreview);
		System.out.println("흠 " + review);
		session.setAttribute("reviewg", review);
		
		session.setAttribute("appkey", env.getProperty("appkey"));
		
		return "experience/tangerine";
	}
	
	@GetMapping("tanreserve")
	public String tanreserve() {
		return "experience/tanreserve";
	}
	
	
	@PostMapping("exreviewg")
	public String exriview(Exreview exreview, HttpSession session) {
		
		System.out.println("쓴리뷰" + exreview);
		
		int experienceNo = ((List<Experience>)session.getAttribute("experience")).get(0).getExperienceNo();
		
		exreview.setExperienceNo(experienceNo);
		
		
		int exre = reserveService.insertreview(exreview);
		
		if(exre > 0) {
			session.setAttribute("alertMsg", "작성되었습니다!");
		}
		
		return "redirect:tangerine";
	}

}
