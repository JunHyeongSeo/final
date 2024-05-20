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
import com.kh.hondimoyeong.experience.model.service.ReserveService;
import com.kh.hondimoyeong.experience.model.vo.Experience;
import com.kh.hondimoyeong.experience.model.vo.KakaoPayVo;
import com.kh.hondimoyeong.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;

@Controller
@RequiredArgsConstructor
@Log
public class KakaoPayController {
	
	@Autowired
	KakaoPayService kakaoPay;
	
	@Autowired
	private  ReserveService reserveService;
	
	
	private KakaoPayVo kakaopayVo;
	
	
	@GetMapping("kakaop")
	public String kakaop() {
		return "experience/kakaop";
		
		
	}
	
	@PostMapping("kakaoPay")
    public String kakaoPay(Experience experience, Model model, HttpSession session){
        log.info("kakaoPay post.....................");
        
        int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
        
		experience.setUserNo(userNo);
        
        System.out.println(experience);
        
        reserveService.insertReserve(experience);
        
        
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
