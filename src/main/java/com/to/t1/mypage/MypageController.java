package com.to.t1.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.to.t1.member.MemberService;
import com.to.t1.member.MemberVO;
import com.to.t1.util.Pager;

@Controller
@RequestMapping("/mypage/**")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MemberService memberService;

	@GetMapping("recentToon") 
	public String getList(Model model, MemberVO memberVO, Pager pager)throws Exception{
		
		List<RecentVO> ar = mypageService.getList(memberVO, pager);
		
		memberVO = memberService.myPage(memberVO);	

		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		model.addAttribute("memberVO", memberVO);
		
		System.out.println(pager.getStartNum());
		System.out.println(pager.getLastNum());
		
		System.out.println("리센트툰");
		
		return "mypage/recentToon";
	}
	
	@GetMapping("delete")
	public String setDelete(RecentVO recentVO)throws Exception{
		
		int result = mypageService.setDelete(recentVO);
		
		return "mypage/recentToon";
	}
	

	@GetMapping("favoriteToon") 
	public String getList2(Model model, MemberVO memberVO, Pager pager)throws Exception{
		
		List<RecentVO> ar = mypageService.getList2(memberVO, pager);
		memberVO = memberService.myPage(memberVO);	
		System.out.println(ar);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		System.out.println("페이보릿툰");
		return "mypage/favoriteToon";
	}
	
	@GetMapping("useToon") 
	public String getList3(Model model, MemberVO memberVO, Pager pager)throws Exception{
		
		List<RecentVO> ar = mypageService.getList3(memberVO,  pager);
		
		memberVO = memberService.myPage(memberVO);	
		System.out.println(ar);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		System.out.println("구매웹툰");
		return "mypage/useToon";
	}
	
	@GetMapping("review") 
	public String getList4(Model model, MemberVO memberVO, Pager pager)throws Exception{
		
		List<RecentVO> ar = mypageService.getList4(memberVO,  pager);
		
		memberVO = memberService.myPage(memberVO);	
		System.out.println(ar);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		System.out.println("내댓글보기");
		return "mypage/review";
	}
}
