package com.jhta.finalproject.jobvo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class JobVo {
	
	private int j_num;			// 취업정보 번호
	private String j_company;	// 회사명
	private String j_subject;	// 채용제목
	private Date j_startdate;	// 채용시작일
	private Date j_enddate;		// 채용마감일
	private int j_view; 		// 조회수
	private String j_url;		// URL
	private String j_img;		// 회사로고 이미지
	private String j_infoimg;	// 공고 이미지
	private int j_status; 		// 공고 승인상태
}
