package com.sportify;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class SportifyApplication {

	public static void main(String[] args) {
		SpringApplication.run(SportifyApplication.class, args);
	}

}
