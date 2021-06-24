package com.to.t1.toon.eachep;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.t1.member.MemberVO;
import com.to.t1.review.ReviewService;
import com.to.t1.review.ReviewVO;
import com.to.t1.ticket.TicketBoxVO;
import com.to.t1.toon.ToonService;
import com.to.t1.toon.ToonVO;
import com.to.t1.util.Pager;

@Controller
@RequestMapping("/toon/**")
public class EachEpController {
	@Autowired
	private EachEpService eachEpService;
	@Autowired
	private ToonService toonService;
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("eachEpList")
	public void getList(Pager pager, Model model,HttpSession httpSession,
		ToonVO toonVO, TicketBoxVO ticketBoxVO,
		MemberVO memberVO, Authentication ahth2)throws Exception{
		
		
		ToonVO list=eachEpService.getList(pager);
		model.addAttribute("toonVO", list);
		model.addAttribute("pager", pager);
		
		System.out.println(toonVO);
		System.out.println(ticketBoxVO);
		System.out.println(httpSession);
		System.out.println(memberVO);
	}
	
	@GetMapping("eachEpSelect")
	public void getSelect(EachEpVO eachEpVO,Pager pager, Model model)throws Exception{
		ToonVO list= eachEpService.getSelect(eachEpVO);
		model.addAttribute("toonVO", list);
		model.addAttribute("listsize", list.getEachEpVO().size());
		
		pager.setEpNum(eachEpVO.getEachEpNum());
		pager.setEachEpNum(eachEpVO.getEachEpNum());
		
		List<ReviewVO> reviewVO = reviewService.getList(pager);
		list.getEachEpVO().get(0).setReviewVO(reviewVO);
		
		System.out.println(list.getEachEpVO().size());
	}
	
	
	
	
	
	
}
