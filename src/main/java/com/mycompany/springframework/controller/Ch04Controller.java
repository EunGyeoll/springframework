package com.mycompany.springframework.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.springframework.dto.Ch04LoginForm;
import com.mycompany.springframework.dto.Ch04LoginFormValidator;
import com.mycompany.springframework.dto.Ch04SignupForm;
import com.mycompany.springframework.dto.Ch04SignupFormValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch04")
public class Ch04Controller {
	@GetMapping("/loginForm")
	public String loginForm(Model model) {
		model.addAttribute("chNum", "ch04");
		return "ch04/loginForm";
	}
	@GetMapping("/signupForm")
	public String signupForm(Model model) {
		model.addAttribute("chNum", "ch04");
		return "ch04/signupForm";
	}
	@InitBinder("ch04LoginForm") //이 객체에 대한 유효성 검사
	public void ch04LoginFormValidator(WebDataBinder binder) {
		binder.setValidator(new Ch04LoginFormValidator());
	}

	@RequestMapping("/login") 
	public String login(@Valid Ch04LoginForm loginForm, Errors errors, Model model) { //@Valid는 유효성 검사해 라는 뜻. 들어온 값을 
		log.info("실행");
		//유효성 검사 실패 시 다시 로그인 폼 보여주기
		if(errors.hasErrors()) { //에러가 있으면 다시 입력하도록, 아니면 그냥 처리
			model.addAttribute("chNum", "ch04");
			return "ch04/loginForm"; //이 jsp안에서 출력
		}
		//로그인 처리
		return "redirect:/"; //이 슬래시에 대한 requestMapping 메소드는 HomeController에서
	} 
	
	
	
	
	@InitBinder("ch04SignupForm") //이 객체에 대한 유효성 검사
	public void ch04SignupFormValidator(WebDataBinder binder) {
		binder.setValidator(new Ch04SignupFormValidator());
	}
	
		@RequestMapping("/signup") 
		public String signup(@Valid Ch04SignupForm signupForm, Errors errors, Model model) { //@Valid는 유효성 검사해 라는 뜻. 들어온 값을 
			log.info("실행");
			//유효성 검사 실패 시 다시 로그인 폼 보여주기
			if(errors.hasErrors()) { //에러가 있으면 다시 입력하도록, 아니면 그냥 처리
				model.addAttribute("chNum", "ch04");
				return "ch04/signupForm"; //이 jsp안에서 출력
			}
			//로그인 처리
			return "redirect:/"; //이 슬래시에 대한 requestMapping 메소드는 HomeController에서
		} 
			
	}

