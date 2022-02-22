package com.jhta.finalproject.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jhta.finalproject.timetablevo.SubjectVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
class SubjectService {
	@Autowired SubjectService service;
	Logger logger=LoggerFactory.getLogger(getClass());

	@Test
	void testSubjectList() {
		fail("Not yet implemented");
	}

	@Test
	void testSubjectListAll() {
		fail("Not yet implemented");
	}

	@Test
	void testCount() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectOne() {
		SubjectVo vo=service.selectOne(1);
		assertNotNull(vo);
		logger.info("vo: "+vo);
	}

}
