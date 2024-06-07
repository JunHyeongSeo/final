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
	
	
	private final KakaoPayService kakaoPay;
	
	
	private final ReserveService reserveService;
	
	private KakaoPayVo kakaopayVo;
	
	
	@PostMapping("kakaoPay")
    public String kakaoPay(Experience experience, Model model, HttpSession session){
        log.info("kakaoPay post.....................");
        
        int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
        String userId = ((Member)session.getAttribute("loginUser")).getUserId();
        String userName = ((Member)session.getAttribute("loginUser")).getUserName();
        
		experience.setUserNo(userNo);
		experience.setUserId(userId);
		experience.setUserName(userName);
        
		// INSERT
        reserveService.insertReserve(experience);
        
        // SELECT
        Experience ex = reserveService.findEx();
        
		model.addAttribute("Experience", ex);
        
        return "redirect:" + kakaoPay.kakaoPayReady(ex, session);
    }
	
	@GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token")String pg_token,  Model model, HttpSession session) {
        log.info("kakaoPay Success get................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        Experience experience =  (Experience) session.getAttribute("experience");
        
        model.addAttribute("pg_token", pg_token);
        
        kakaopayVo = kakaoPay.kakaopayVo(pg_token, experience);
        
        model.addAttribute("info", kakaopayVo);
        
        return "experience/kakaoSuccess";
    }
}
