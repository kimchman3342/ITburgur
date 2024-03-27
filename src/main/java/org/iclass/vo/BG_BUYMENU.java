package org.iclass.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class BG_BUYMENU {

	private int buy_seq;
	private String menu_code;
	private String order_id;
	private String detail_option_seq;
	private String detail_option_desc;
	private int amount;
	private String user_id;
	private String pay_type;
	private String payment_key;
	@JsonFormat(shape = Shape.STRING,pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Timestamp create_dttm;
	private String menu_name;
	private String img_name;
}
