package com.to.t1.member.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.to.t1.board.BoardFileVO;
import com.to.t1.board.BoardVO;
import com.to.t1.board.notice.NoticeMapper;
import com.to.t1.board.qna.QnaMapper;
import com.to.t1.util.BoFileManager;
import com.to.t1.util.FileManager;
import com.to.t1.util.Pager;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
}




	
	
	
	

	