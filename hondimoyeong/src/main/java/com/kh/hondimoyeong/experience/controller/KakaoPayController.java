package com.kh.hondimoyeong.experience.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hondimoyeong.experience.model.service.KakaoPayService;
import com.kh.hondimoyeong.experience.model.vo.Experience;
import com.kh.hondimoyeong.experience.model.vo.KakaoPayVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;

@Controller
@RequiredArgsConstructor
@Log
public class KakaoPayController {
	
	@Autowired
	KakaoPayService kakaoPay;
	
	
	private KakaoPayVo kakaopayVo;
	
	private Experience experience;
	
	@GetMapping("kakaop")
	public String kakaop() {
		return "experience/kakaop";
		
		
	}
	
	@PostMapping("kakaoPay")
    public String kakaoPay(String experienceDate, String experienceTime, int price, int people, String category, Model model, HttpSession session){
        log.info("kakaoPay post.....................");
        
        experience.setExperienceDate(experienceDate);
        experience.setExperienceTime(experienceTime);
        experience.setPrice(price);
        experience.setExperiencePeople(people);
        experience.setCategory(category);
		model.addAttribute("Experience", experience);
        
        return "redirect:" + kakaoPay.kakaoPayReady(experience);
    }
	
	@GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token")String pg_token,  Model model) {
        log.info("kakaoPay Success get................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);

        
        model.addAttribute("pg_token", pg_token);
        
        kakaopayVo = kakaoPay.kakaopayVo(pg_token);
        
        model.addAttribute("info", kakaopayVo);
        
        
        return "experience/kakaoSuccess";
    }
	
	
	
	
	
	

}