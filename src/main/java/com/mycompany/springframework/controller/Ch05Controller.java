package com.mycompany.springframework.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch05")
public class Ch05Controller {
//  @GetMapping("/header")
//  public String header(Model model,
//      @RequestHeader("User-Agent") String userAgent) {
//    log.info("실행");
//    log.info("User-Agent: " + userAgent);
//    
//    //브라우저의 종류 알아내기
//    if(userAgent.contains("Edg")) {
//      model.addAttribute("browser","Edge");
//    } else {
//      model.addAttribute("browser","Chrome");      
//    }
//    model.addAttribute("chNum","ch05");
//    return "ch05/header";
//  }
  
  @GetMapping("/header")
  public String header(Model model,
     HttpServletRequest request) {
    log.info("실행");
    
    //브라우저의 종류 알아내기
    String userAgent = request.getHeader("User-Agent");
    if(userAgent.contains("Edg")) {
      model.addAttribute("browser","Edge");
    } else {
      model.addAttribute("browser","Chrome");      
    }
    
    //브라우저가 실행하는 컴퓨터의 IP 주소
    String clientIp = request.getRemoteAddr(); //  클라이언트 아이피
    
    model.addAttribute("clientIp",clientIp);
    model.addAttribute("chNum","ch05");
    return "ch05/header";
  }
  
  
  @GetMapping("/createCookie")
  public String createCookie(Model model, HttpServletResponse response) {
	  //쿠키 생성
	  Cookie cookie = new Cookie("useremail", "summer@naver.com");
	  
	  //쿠키를 응답 http에 포함시키기
	  response.addCookie(cookie);
	  
	  model.addAttribute("chNum","ch05");
	    return "redirect:/"; //홈으로 돌아감
  }
  
  @GetMapping("/readCookie")
  public String readCookie(@CookieValue("useremail") String userEmail, Model model) { //readCookie를 요청했을때 userEmail에 저장하고 싶다, userEmail 대소문자 주의
	  log.info("useremail:" + userEmail);
	  model.addAttribute("useremail",userEmail);

	  return "ch05/cookie"; //
  }
}
