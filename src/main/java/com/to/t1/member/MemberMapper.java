package com.to.t1.member;

import org.apache.ibatis.annotations.Mapper;

import com.to.t1.member.MemberVO;

@Mapper
public interface MemberMapper {

	public int setJoin(MemberVO memberVO)throws Exception;
	
	public int setJoinFile(JoinFileVO joinFileVO)throws Exception;
	
	public MemberVO getLogin(MemberVO memberVO)throws Exception;
	
	
	
}