package com.mycompany.springframework.dto;

import java.util.regex.Pattern;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Ch04SignupFormValidator implements Validator {
  @Override
  public boolean supports(Class<?> clazz) {
    log.info("실행");
    return Ch04SignupForm.class.isAssignableFrom(clazz);
  }

  @Override
  public void validate(Object target, Errors errors) {
	  Ch04SignupForm signupForm = (Ch04SignupForm) target;
	  
	    // 아이디 
	  	String midpattern = "/^[a-zA-Z][0-9a-zA-Z]{5,15}$/g"; //영문자와 숫자만 사용 가능 (영문자, 숫자 두 가지 모두 사용), 5~15자로 가능, 첫 글자는 영문자로 시작	  			
	    String mid = signupForm.getMid();
		    if(mid == null || mid.equals("")) {
		      errors.rejectValue("mid", null,"아이디는 필수 입력");
		    } else if(mid.length()<6 || mid.length()>12) {
		      errors.rejectValue("mid", null,"아이디는 6자 이상 12자리 이하로 입력해야 합니다.");      
		    }
	    
	    // 비밀번호 
	    String mpwpattern = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}";
	    String mpassword1 = signupForm.getMpassword1();
		    if(mpassword1 == null || mpassword1.equals("")) { //에러인 조건
		      errors.rejectValue("mpassword1", null,"비밀번호는 필수 입력");   //에러에 해당하면 출력
		    } else if(!Pattern.matches(mpwpattern, mpassword1)) { //에러인 조건. 앞에 ! 붙여야 함.
		      errors.rejectValue("mpassword1", null,"비밀번호는 알파벳 대소문자 및 숫자를 포함해야함");  //에러에 해당하면 출력
		    }
		    
		//비밀번호 확인
	    String mpassword2 = signupForm.getMpassword2();
		    if(mpassword2 == null || mpassword2.equals("")) { //에러인 조건
		      errors.rejectValue("mpassword2", null,"비밀번호 확인은 필수 입력");   //에러에 해당하면 출력
		    }  else if(!mpassword1.equals(mpassword2)) {
			  errors.rejectValue("mpassword2", null,"위에서 입력한 비밀번호와 일치하지 않음");  //에러에 해당하면 출력
		    } else if(!Pattern.matches(mpwpattern, mpassword2)) { //에러가 아닌 조건
		      errors.rejectValue("mpassword2", null,"비밀번호는 알파벳 대소문자 및 숫자를 포함해야함");  //에러에 해당하면 출력   	
		    }
		    
		    
  	//휴대폰번호 
	  String mphoneNum = signupForm.getMphoneNum(); 
	  String phoneNumpattern = "^\\d{3}-\\d{3,4}-\\d{4}$";
	  if(mphoneNum == "") {
		  errors.rejectValue("mphoneNum", null,"폰번호는 필수 입력");
		} else if(!Pattern.matches(phoneNumpattern, mphoneNum)) {          
			errors.rejectValue("mphoneNum", null,"폰번호를 형식에 맞게 작성해야 합니다");      
	    }
	  
	  //이름
	  String mnamepattern ="^[\\w]*$"; //문자만 허용
	  String mname = signupForm.getMname(); 
	  if(mname == null || mname == "") {
		  errors.rejectValue("mname", null,"이름(문자)을 입력해 주세요");
		} else if(!Pattern.matches(mname, mnamepattern)) {          
			errors.rejectValue("mname", null,"이름을 형식에 맞게 작성해야 합니다");      
		}
	  
	  
	  //이메일
	  String memailpattern = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
	  String memail = "abc_123@gmail.com";
	  if(memail == null || memail == "")  {
		  errors.rejectValue("memail", null,"이메일을 입력해 주세요");
	  } else if(!Pattern.matches(memailpattern, memail)){            
			errors.rejectValue("memail", null,"이메일을 형식에 맞게 작성해야 합니다");      
	  }

  }
}