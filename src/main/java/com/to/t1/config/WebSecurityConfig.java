package com.to.t1.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.to.t1.security.LoginFail;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public PasswordEncoder passwordEncoder()throws Exception{
		return new BCryptPasswordEncoder();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring()
		.antMatchers("/resources/**")	
		.antMatchers("/images/**")
		.antMatchers("/css/**")
		.antMatchers("/settingJs/**")
		.antMatchers("/js/**")

		//무시해야하는거 추가해줘야함
		.antMatchers("/vendor/**")
		.antMatchers("/favicon/**")
		;
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// URL에 따른 로그인, 권한 설정
		http
			//권한 에러 발생(403)
			//사용하지 않으면 기본 제공 에러 처리 방법 사용
			.exceptionHandling()
//				.accessDeniedPage("/member/error") //error page URL
//				.accessDeniedHandler(new SecurityException())//error 처리 class
				.and()
			.cors().and()
			.csrf().disable()
			.authorizeRequests()
				.antMatchers("/").permitAll()
//				.antMatchers("/qna/list").permitAll()
//				.antMatchers("/qna/**").hasAnyRole("ADMIN", "MEMBER")
				.antMatchers("/member/join").permitAll()
				
				.antMatchers("/notice/noticeList").permitAll()
				.antMatchers("/notice/select").permitAll()
				.antMatchers("/qna/qnaList").permitAll()
				
				.antMatchers("/member/memberJoinCheck").permitAll()
				.antMatchers("/member/searchId").permitAll()
				.antMatchers("/member/searchPw").permitAll()
				.antMatchers("/member/CheckMail","/member/memberLoginResult").permitAll()
				.antMatchers("/member/**").hasAnyRole("ADMIN", "MEMBER")
				
				.antMatchers("/member/memberJoinCheck").permitAll()
				
				.antMatchers("/notice/select").hasAnyRole("ADMIN", "MEMBER")
				.antMatchers("/qna/qnaSelect").hasAnyRole("ADMIN", "MEMBER")
				.antMatchers("/qna/qnaUpdate").hasAnyRole("ADMIN", "MEMBER")
				.antMatchers("/qna/reply").hasAnyRole("ADMIN")
				.antMatchers("/qna/qnaInsert").hasAnyRole("MEMBER")
				.antMatchers("/notice/insert").hasAnyRole("ADMIN")
				.antMatchers("/admin/test").hasAnyRole("ADMIN")
				
				.anyRequest().authenticated()
				.and()
			.formLogin()
				
				//로그인페이지를 따로 만들지 않아도 기본 내장된 폼으로 이동
				//개발자가 만든 로그인폼을 사용하려면 다음과 같이 작성
				.loginPage("/member/login")
				.defaultSuccessUrl("/member/memberLoginResult")
				//Login 실패 처리
//				.failureUrl("/member/memberLoginResult")
//				.failureHandler(new LoginFail())
				.permitAll()
				.and()
			.logout()
				.logoutUrl("/member/logout")
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.permitAll()
				;

	}

}
