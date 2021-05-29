package com.to.t1.member;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.to.t1.member.MemberVO;
import com.to.t1.member.MemberService;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("login")
	public String getLogin()throws Exception{
		return "member/memberLogin";
	}
	
	@PostMapping("login")
	public String getLogin(MemberVO memberVO, HttpSession session)throws Exception{
		
		memberVO = memberService.getLogin(memberVO);
		
		System.out.println(memberVO.getEmail());
		System.out.println(memberVO.getJoinFileVO());
		
//		System.out.println(memberVO.getJoinFileVO().getFileName());
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
		}

		return "redirect:/";
	}
	
	
	@GetMapping("logout")
	public String logout(HttpSession session)throws Exception{
		
		session.invalidate();
		
		return "redirect:../";
	}
	
	@RequestMapping("myPage") //MemberPage
	public void myPage()throws Exception{
		
	}
	
	@RequestMapping("memberJoinCheck")
	public void memberJoinCheck()throws Exception{}
	
	@GetMapping("join")
	public String setJoin()throws Exception{
		System.out.println("join");
		return "member/memberJoin";
	}
	
	@PostMapping("join")
	public String setJoin(MemberVO memberVO, MultipartFile avatar, HttpSession session)throws Exception{
		int result = memberService.setJoin(memberVO, avatar, session);
		
		return "redirect:../";
	}

}
