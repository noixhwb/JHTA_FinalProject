package com.jhta.finalproject.circlevo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class CircleVo {
	private int ci_num; //동아리번호 (SEQ)
	private String ci_name; //동아리이름
	private String ci_category; //카테고리
	private int ci_person; //인원
	private String ci_logofile; //동아리 로고 이미지 파일명
	private int m_num; //회원번호 (MEMBER참조)
	private int ci_ok; //동아리 승인여부 (미승인0, 승인1)
	private int cib_num; //게시글번호 (SEQ)
	private String ci_title; //글 제목
	private String ci_content; //글 상세내용
	private String ci_imgfile; //글 포스터 이미지 파일 이름
	private Date ci_startdate; //모집 시작일
	private Date ci_enddate; //모집 마감일
	private int ci_view; //모집글 조회수
	private int ci_recommend; //좋아요수
}
