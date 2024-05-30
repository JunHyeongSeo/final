package com.kh.hondimoyeong.experience.model.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySources;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.kh.hondimoyeong.experience.model.vo.Experience;
import com.kh.hondimoyeong.experience.model.vo.KakaoPayVo;
import com.kh.hondimoyeong.experience.model.vo.Reserve;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;

@PropertySources("classpath:config.properties")
@Service
@RequiredArgsConstructor
@Transactional
@CrossOrigin("*")
@Log
public class KakaoPayService {
    private static final String Host = "https://open-api.kakaopay.com/online/v1/payment/ready";
    private static final String Host2 = "https://open-api.kakaopay.com/online/v1/payment/approve";
    private static final String devkey = "DEVCE517BBAF3A98F3BD12990853FA33292E0A7D";


    private Reserve reserve;
    
    @Value("${Kakao_admin_key_pay}")
    private String Kakao_admin_key_pay;
    
   
    

    public String kakaoPayReady(Experience ex, HttpSession session) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory()); // 정확한 에러 파악을 위해 생성

        System.out.println(Kakao_admin_key_pay);
        
        
        // Server Request Header : 서버 요청 헤더
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "SECRET_KEY " + Kakao_admin_key_pay); // 어드민 키
        //headers.add("Accept", "application/json");
        //headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        headers.add("Content-type", "application/json");


        // Server Request Body : 서버 요청 본문
        Map<String, String> params = new HashMap<String, String>();

        params.put("cid", "TC0ONETIME"); // 가맹점 코드 - 테스트용
        params.put("partner_order_id", String.valueOf(ex.getExperienceNo())); // 주문 번호
        params.put("partner_user_id", ex.getUserId()); // 회원 아이디
        params.put("item_name", ex.getCategory()); // 상품 명 : 카테고리
        params.put("quantity", String.valueOf(ex.getExperiencePeople())); // 상품 수량
        params.put("total_amount", ex.getPrice()); // 상품 가격
        params.put("tax_free_amount", "100"); // 상품 비과세 금액
        params.put("approval_url", "http://localhost:8024/hondimoyeong/kakaoPaySuccess"); // 성공시 url
        params.put("fail_url", "http://localhost:8024/fail"); // 실패시 url
        params.put("cancel_url", "http://localhost:8024/cancel");

        // 헤더와 바디 붙이기
        HttpEntity<Map<String, String>> body = new HttpEntity<Map<String, String>>(params, headers);

        try {
           reserve = restTemplate.postForObject(new URI(Host), body, Reserve.class);

           //HttpEntity<Reserve> reserve = restTemplate.exchange(new URI(Host + "/online/v1/payment/ready"), HttpMethod.POST, body, Reserve.class);
           
           log.info(""+ reserve);
          // System.out.println(reserve);
           
           session.setAttribute("experience", ex);
           
            
           return reserve.getNext_redirect_pc_url();
        		   
            

        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        return "/pay";
    }
    
    
    
    private KakaoPayVo kakaopayVo;
    
    public KakaoPayVo kakaopayVo(String pg_token, Experience experience) {
    	 RestTemplate restTemplate = new RestTemplate();
         restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory()); // 정확한 에러 파악을 위해 생성

         // Server Request Header : 서버 요청 헤더
         HttpHeaders headerss = new HttpHeaders();
         headerss.add("Authorization", "SECRET_KEY " + devkey); // 어드민 키
         //headers.add("Accept", "application/json");
         //headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
         headerss.add("Content-type", "application/json");


         // Server Request Body : 서버 요청 본문
         Map<String, String> paramss = new HashMap<String, String>();

         paramss.put("cid", "TC0ONETIME"); // 가맹점 코드 - 테스트용
         System.out.println(reserve);
         paramss.put("tid", reserve.getTid());
         
        System.out.println(experience);
         
         //paramss.put("partner_order_id", String.valueOf(((Experience)session.getAttribute("experince")).getExperienceNo())); // 주문 번호
         //paramss.put("partner_user_id",  ((Experience)session.getAttribute("experince")).getUserId()); // 회원 아이디
         paramss.put("partner_order_id", String.valueOf(experience.getExperienceNo()));
         paramss.put("partner_user_id", experience.getUserId());
         paramss.put("pg_token", pg_token);
//         params.put("total_amount", "20000"); // 상품 가격
//         params.put("tax_free_amount", "100"); // 상품 비과세 금액
//         params.put("approval_url", "http://localhost:8024/success"); // 성공시 url
//         params.put("fail_url", "http://localhost:8024/fail"); // 실패시 url
//         params.put("cancel_url", "http://localhost:8024/cancel");

         // 헤더와 바디 붙이기
         HttpEntity<Map<String, String>> boddy = new HttpEntity<Map<String, String>>(paramss, headerss);

         try {
        	 kakaopayVo = restTemplate.postForObject
        			 (new URI(Host2), boddy, KakaoPayVo.class);

            //HttpEntity<Reserve> reserve = restTemplate.exchange(new URI(Host + "/online/v1/payment/ready"), HttpMethod.POST, body, Reserve.class);
            
            log.info(""+ kakaopayVo);
            System.out.println("kakaopayVo" + kakaopayVo);
             
            return kakaopayVo;
            
             

         } catch (RestClientException e) {
             e.printStackTrace();
         } catch (URISyntaxException e) {
             e.printStackTrace();
         }
         return null;    
    
    
    }
    
    
}