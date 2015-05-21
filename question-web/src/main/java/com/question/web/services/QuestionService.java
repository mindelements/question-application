package com.question.web.services;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.stereotype.Service;

import com.question.services.factory.model.QuestionBucket;
import com.question.services.factory.spi.Webservices;
import com.question.services.factory.spi.WebservicesFactory;
import com.question.services.factory.spi.WebservicesType;

@Service
public class QuestionService {

	private Webservices service = null;

	final String baseUrl = "https://portal-mindelements.rhcloud.com/question-rest";
	
	@PostConstruct
	public void initIt() throws Exception {
		System.out
				.println("QuestionService-web Init method after properties are set");

		service = WebservicesFactory.getInstance(WebservicesType.JERSEY_REST_CLIENT);

	}

	@PreDestroy
	public void cleanUp() throws Exception {
		System.out
				.println("QuestionService-web Spring Container is destroy! Customer clean up");
	}

	public <T> T get(String url, Class<T> clazz) {
		return service.get(baseUrl+url, clazz);
	}
	
	public <T> T put(String url, File fileToUpload, Class<T> clazz) {
		return service.put(baseUrl+url, fileToUpload, clazz);
	}
	

}