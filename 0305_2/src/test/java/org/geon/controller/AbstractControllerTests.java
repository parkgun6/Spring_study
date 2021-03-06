package org.geon.controller;

import org.geon.config.RootConfig;
import org.geon.config.ServletConfig;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

//@WebAppConfiguration 있어야지만 웹 테스트 가능
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		classes = {RootConfig.class,ServletConfig.class})
@Log4j
public class AbstractControllerTests {

	@Autowired
	protected WebApplicationContext ctx; //protected는 없어도 상관없다.
	
	MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		log.info("setup...........");
	}
	

}
