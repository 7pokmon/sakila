package com.gd.sakila;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;


@SpringBootApplication // com.gd.sakila 범위내
@ServletComponentScan // Servlet Scan을위한 애노테이션
@EnableScheduling // 스케줄링 기능 사용


public class SakilaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SakilaApplication.class, args);
	}

}
