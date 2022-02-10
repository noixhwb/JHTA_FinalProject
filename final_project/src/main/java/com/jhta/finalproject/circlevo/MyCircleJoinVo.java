package com.jhta.finalproject.circlevo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/* Circle테이블 ~ MyCircle테이블 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class MyCircleJoinVo {
	private int ci_num; //동아리번호
	private String ci_name; //동아리이름
	private String ci_logofile; //동아리로고파일
	private int m_num; //회원번호
	private String ci_title; //글제목
	private String ci_imgfile; //포스터파일이름
}
