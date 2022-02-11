package com.jhta.finalproject.circlevo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/* LikeCircle테이블 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class LikeCircleVo {
	private int lci_num; //찜한 동아리 번호 seq 
	private int ci_num; //동아리 번호
	private int m_num; //찜한 회원 번호
}
