package com.to.t1.board;

import lombok.Data;

@Data
public class BoardFileVO {
	
	private Long fileNum;
	private Long boNum;
	private String fileName;
	private String oriName;
	
	public Long getFileNum() {
		return fileNum;
	}
	public void setFileNum(Long fileNum) {
		this.fileNum = fileNum;
	}
	public Long getBoNum() {
		return boNum;
	}
	public void setBoNum(Long boNum) {
		this.boNum = boNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	


}
