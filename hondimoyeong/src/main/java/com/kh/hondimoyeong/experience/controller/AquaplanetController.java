package com.kh.hondimoyeong.experience.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hondimoyeong.experience.model.service.ReserveService;
import com.kh.hondimoyeong.experience.model.vo.Experience;
import com.kh.hondimoyeong.experience.model.vo.Exreview;
import com.kh.hondimoyeong.member.model.vo.Member;

@PropertySources(@PropertySource("classpath:config.properties"))
@Controller
public class AquaplanetController {
	
	@Autowired
	private  ReserveService reserveService;
	
	@Autowired
	private Environment env;
	
	
	
	@RequestMapping("aqua")
	public String aqua(HttpSession session) {
		
		if(!(session.getAttribute("loginUser")== null)) {
			
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			
			if(userNo > 0) {
				List<Experience> experience = reserveService.excheck(userNo);
				
				if(!(experience == null)) {
					session.setAttribute("experience", experience);
				}
			}
		}
		
		// 아쿠아리움 리뷰 전부 조회
		Exreview exreview = new Exreview();
		
		exreview.setExperienceCategory("아쿠아리움");
		List<Exreview> review = reserveService.review(exreview);
		session.setAttribute("reviewa", review);
		
		return "experience/aquaplanet";
	}
	
	@GetMapping("aquadetail")
	public String aquadetail(HttpSession session) {
		
		
		session.setAttribute("appkey", env.getProperty("appkey"));
		return "experience/aquadetail";
	}
	
	@GetMapping("aquareserve")
	public String aquareserve(String category, int price, Model model) {
		model.addAttribute("category", category);
		model.addAttribute("price", price);
		return "experience/aquareserve";
	}
	
	@PostMapping("exreviewa")
	public String exriview(Exreview exreview, HttpSession session) {
		
		
		int experienceNo = ((List<Experience>)session.getAttribute("experience")).get(0).getExperienceNo();
		
		exreview.setExperienceNo(experienceNo);
		
		
		int exre = reserveService.insertreview(exreview);
		
		if(exre > 0) {
			session.setAttribute("alertMsg", "작성되었습니다!");
		}
		
		return "redirect:aqua";
	}

}
