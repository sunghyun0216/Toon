package com.to.t1.toon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.to.t1.review.ReviewVO;
import com.to.t1.util.Pager;

@Mapper
public interface ToonMapper {

	public List<ToonVO> getList()throws Exception;
	public Long getTotalCount(Pager pager)throws Exception;
	public ToonVO getSelect(ToonVO toonVO)throws Exception;
	
	public long updateScore(ReviewVO reviewVO)throws Exception;
	public long deleteScore(ReviewVO reviewVO)throws Exception;
	public long setHitUpdate(ToonVO toonVO)throws Exception;
	
	//미정 기능 사용시 controller, service 추가 요망
	public long setInsert(ToonVO toonVO)throws Exception;
	public long setUpdate(ToonVO toonVO)throws Exception;
	public long setDelete(ToonVO toonVO)throws Exception;
	
	public List<ToonVO> toonDay(ToonVO toonVO)throws Exception;
	public List<ToonVO> genre(ToonVO toonVO)throws Exception;
	public List<ToonVO> ranking(ToonVO toonVO)throws Exception;
	public List<ToonVO> endRe(ToonVO toonVO)throws Exception;
	
}