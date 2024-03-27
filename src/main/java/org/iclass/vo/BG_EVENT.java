package org.iclass.vo;

import java.sql.Clob;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
public class BG_EVENT {
	
	private int event_seq;
	private String event_title;
	private String event_content;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Date event_regdate;
	private String event_image;
	private String user_id;
	private int like_count;


}
