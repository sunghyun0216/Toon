package com.to.t1.member.admin.sales;

import java.sql.Date;

import lombok.Data;
@Data
public class WeekSaleVO{
	
	private Date Wstart;
	private Date Wend;
	
	private long Sum;
}
