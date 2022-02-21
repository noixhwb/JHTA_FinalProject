package com.jhta.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommentsVo {
	
	
	private int co_num;
	private int m_num;
	private String co_content;
	private Date co_regdate;
	private int b_num;
	
	
}
