package org.iclass.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notice {
	private long notice_seq;
	private String notice_title;
	private String notice_content;
	private int notice_readcount;
	private Timestamp notice_date;
	private String notice_image;
}

