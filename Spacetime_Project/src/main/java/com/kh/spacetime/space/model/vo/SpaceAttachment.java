package com.kh.spacetime.space.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 정현
 * 공간 첨부파일 VO 
 */
@Getter
@Setter
@NoArgsConstructor
@ToString
public class SpaceAttachment {
		private int attachmentNo;	//	ATTACHMENT_NO	NUMBER
		private String attachmentReName;	//	ATTACHMENT_RENAME	VARCHAR2(255 BYTE)
		private String attachmentUploadDate;	//	ATTACHEMENT_UPLOAD_DATE	DATE
		private String attachmentStatus;	//	ATTACHEMNT_STATUS	CHAR(1 BYTE)
		private int attachmentLevel;	//	ATTACHEMNT_LEVEL	NUMBER
		private int spaceNo;	//	SPACE_NO	NUMBER
}
