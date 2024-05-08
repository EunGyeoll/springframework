package com.mycompany.springframework.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Ch02Filter implements Filter{

	@Override
	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//전처리 
		log.info("전처리 내용 실행"); //출력 결과는 콘솔창에
		
		//다음 필터로 넘기거나 DispatcherServlet 으로 넘김
		chain.doFilter(request, response);

		//후처리(잘 안씀)
		log.info("후처리 내용 실행");
	}

}
