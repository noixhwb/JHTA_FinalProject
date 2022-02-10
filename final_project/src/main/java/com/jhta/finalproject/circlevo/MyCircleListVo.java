package com.jhta.finalproject.circlevo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/* Member테이블 ~ MyCircle테이블 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class MyCircleListVo {
	private int m_num; //회원번호
	private String m_id; //회원아이디
	private String m_name; //이름
	private String m_phone; //연락처
	private String m_email; //이메일
	private String m_nickname; //닉네임
	private String m_dept; //학과
	private String m_univnum; //학번
	private String m_profile; //프로필사진
	private int ci_num; //동아리번호
}
