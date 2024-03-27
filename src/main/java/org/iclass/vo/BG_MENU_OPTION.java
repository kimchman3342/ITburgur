package org.iclass.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class BG_MENU_OPTION {

	private int option_seq;
	private String option_name;
	private int option_price;
	private String option_desc;
	private Timestamp create_dttm;
	private String menu_code;
}
