package com.gd.sakila.vo;

import lombok.Data;

// 페이징 사전작업
@Data
public class Page {
	private int rowPerPage;
	private int beginRow;
	private String searchWord;
}
