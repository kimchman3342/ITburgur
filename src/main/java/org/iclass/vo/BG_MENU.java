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
public class BG_MENU {

	private String menu_code;
	private String menu_name;
	private String menu_desc;
	private int price;
	private Timestamp create_dttm;
	private String img_name;
	private String category_code;
}
