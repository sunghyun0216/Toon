package com.to.t1.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.to.t1.board.BoardVO;
import com.to.t1.member.MemberVO;
import com.to.t1.util.Pager;

@Mapper
public interface MypageMapper {

	public List<RecentVO> getList(Map map) throws Exception;
	
	public List<RecentVO> getList2(Map map)throws Exception;
	
	public List<RecentVO> getList3(Map map)throws Exception;
	
	public long getTotalCount(Map map) throws Exception;
		
}