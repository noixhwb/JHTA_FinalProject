package com.jhta.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommunityVo {
	private int cu_num;
	private String cu_name;
	private String cu_intro;
	private String cu_category;
	private String cu_notice;
	private int cu_recommend;
	private String cu_coverimg;
	private int m_num;
	private String cu_status;
}
