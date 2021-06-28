package com.to.t1.toon.eachep;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.t1.favoriteToon.FavoritetoonVO;
import com.to.t1.mypage.RecentVO;
import com.to.t1.review.ReviewService;
import com.to.t1.review.ReviewVO;
import com.to.t1.toon.ToonVO;
import com.to.t1.util.Pager;

@Controller
@RequestMapping("/toon/**")
public class EachEpController {
   @Autowired
   private EachEpService eachEpService;
   
   @Autowired
   private ReviewService reviewService;
   
   @GetMapping("eachEpList")
   public void getList(Pager pager, Model model, Authentication auth)throws Exception{
      FavoritetoonVO favoritetoonVO = new FavoritetoonVO();
      if(auth!=null) {
         favoritetoonVO.setUsername(auth.getName());
      }
      ToonVO list=eachEpService.getList(pager);
      model.addAttribute("toonVO", list);
      model.addAttribute("pager", pager);
      
   }
   
   @GetMapping("eachEpSelect")
   public void getSelect(EachEpVO eachEpVO,Pager pager, Model model, Authentication auth)throws Exception{
      RecentVO recentVO = new RecentVO(); 
      if(auth!=null) {
         recentVO.setUsername(auth.getName());
      }
      ToonVO list= eachEpService.getSelect(eachEpVO, pager, recentVO);
      
      model.addAttribute("toonVO", list);
      model.addAttribute("listsize", list.getEachEpVO().size());
      //eachEpNum 가장 큰 값 불러오기 위해서(getTotalCount 사용)
      model.addAttribute("pager", pager);
      
      pager.setEpNum(eachEpVO.getEachEpNum());
      pager.setEachEpNum(eachEpVO.getEachEpNum());
      
      List<ReviewVO> reviewVO = reviewService.getList(pager);
      list.getEachEpVO().get(0).setReviewVO(reviewVO);
      if(list.getEachEpVO().get(0).getReviewVO().get(0).getRevNum()==0) {
         list.getEachEpVO().get(0).setReviewVO(new ArrayList<ReviewVO>());
      }
      
   }
}