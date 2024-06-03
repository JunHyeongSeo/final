package com.kh.hondimoyeong.course.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hondimoyeong.course.model.service.CourseServiceImpl;
import com.kh.hondimoyeong.course.model.vo.Course;

import lombok.RequiredArgsConstructor;

@PropertySources(@PropertySource("classpath:config.properties"))
@Controller
@RequiredArgsConstructor
public class CourseApiController {
	
	private final CourseServiceImpl courseService;
	
	@Autowired
	private Environment env;

	@GetMapping("admin/api/load")
	public String loadFromApi(Model model,
							  HttpServletResponse response) throws IOException, Exception {
		
		String address = "https://api.odcloud.kr/api/15043496/v1/uddi:4fc81f72-5343-4349-93f0-bda60947a923?page=0&perPage=0&returnType=json&serviceKey=" + env.getProperty("courseApiServiceKey");
		
		URL url = new URL(address);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String result = br.readLine();

		br.close();
		urlConnection.disconnect();
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject)jsonParser.parse(result);
		JSONArray jsonArray = (JSONArray)jsonObj.get("data");
		
		List<Course> list = new ArrayList<Course>();
				
		
		for(int i = 0; i < jsonArray.size(); i++) {
			JSONObject object = (JSONObject)jsonArray.get(i);		
			Course course = new Course();
			course.setCourseNo((String)object.get("코스별"));
			course.setCourseName((String)object.get("코스명"));
			course.setDistance((String)object.get("거리"));
			course.setTakeTime((String)object.get("소요시간정보"));
			course.setStartEnd((String)object.get("시종점정보"));
			list.add(course);
		}
		
		courseService.loadFromApi(list);
		timeCookie(response);
		
		
		return "redirect:/admin/course";
	}
	
	public void timeCookie(HttpServletResponse response) {

		Cookie timeCookie = new Cookie("currentTime", new SimpleDateFormat("yyyy-MM-dd-HH:mm").format(new Date()));
		timeCookie.setMaxAge(1 * 60 * 60 * 24 * 28);
		timeCookie.setPath("/");
		
		response.addCookie(timeCookie);
	}
}
