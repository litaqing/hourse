package com.likunlong.house;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;

import com.likunlong1.house.autoconfig.EnableHttpClient;

@SpringBootApplication
@EnableHttpClient
@EnableAsync
@ServletComponentScan
public class HouseApplication {

	public static void main(String[] args) {
		SpringApplication.run(HouseApplication.class, args);
	}
}
