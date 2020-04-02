package com.likunlong.house.web;

import com.likunlong.house.biz.service.CityService;
import com.likunlong.house.common.model.City;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.junit4.SpringRunner;

import com.likunlong.house.biz.service.UserService;
import com.likunlong.house.common.model.User;

import java.util.List;


@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment=WebEnvironment.DEFINED_PORT)
public class AuthTests {

	@Autowired
	private UserService userService;

	@Autowired
	private CityService cityService;
	@Test
	public void testAuth() {
	  User user =	userService.auth("spring_boot@163.com", "111111");
	  assert user != null;
	  System.out.println(user.getAboutme());
	}
	@Test
	public void testCityAll() {
		List<City> allCitys = cityService.getAllCitys();
		allCitys.forEach(city -> {
			System.out.println(city);
		});
	}

}