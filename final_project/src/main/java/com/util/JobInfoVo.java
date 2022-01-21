package com.util;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class JobInfoVo {
	
	private int j_jum;			// 취업정보 번호
	private String j_company;	// 회사명
	private String j_subject;	// 채용제목
	private Date j_startdate;	// 채용시작일
	private Date j_enddate;		// 채용마감일
	private String j_duty;		// 직무
	private String j_region;	// 지역
	private String j_career;	// 경력
	private int j_view; 		// 조회수
	private String j_url;		// URL
	private String j_img;		// 회사로고 이미지
	
	
}
