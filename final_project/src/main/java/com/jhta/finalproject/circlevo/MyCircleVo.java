package com.jhta.finalproject.circlevo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class MyCircleVo {
	private int mci_num; //내동아리번호 (SEQ)
	private int ci_num; //동아리번호 (CIRCLE참조)
	private int m_num; //회원번호 (CIRCLE참조)
}
