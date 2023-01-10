package com.kh.spacetime.space.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 정현
 * 공간타입 VO 
 */
@Getter
@Setter
@NoArgsConstructor
@ToString
public class SpaceType {
		private int stypeNo;	//	STYPE_NO	NUMBER
		private String stypeName;	//	STYPE_NAME	VARCHAR2(30 BYTE)
}
