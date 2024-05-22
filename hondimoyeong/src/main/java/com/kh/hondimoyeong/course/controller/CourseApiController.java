package com.kh.hondimoyeong.course.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hondimoyeong.course.model.service.CourseServiceImpl;
import com.kh.hondimoyeong.course.model.vo.Course;


@Controller
public class CourseApiController {

	@Autowired
	private CourseServiceImpl courseService;

	@GetMapping("admin/api/load")
	public String loadFromApi(Model model,
							  HttpServletResponse response) throws IOException, Exception {

		String address = "https://api.odcloud.kr/api/15043496/v1/uddi:4fc81f72-5343-4349-93f0-bda60947a923?page=0&perPage=0&returnType=json&serviceKey=V0N5aQoZi3yLUcXkXnicH4TSv4Q%2FJzLOdTPypUpxnL%2Be5yHYcfOJ%2Bma4N21DA6YHMpluBbtS9XXsJR%2BOeYe1lw%3D%3D";
		

		
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
		String recentTime = "";
				
		for(int i = 0; i < jsonArray.size(); i++) {
			JSONObject object = (JSONObject)jsonArray.get(i);
			recentTime = (String)object.get("데이터기준일자");
			
			Course course = new Course();
			course.setCourseNo((String)object.get("코스별"));
			course.setCourseName((String)object.get("코스명"));
			course.setDistance((String)object.get("거리"));
			course.setTakeTime((String)object.get("소요시간정보"));
			course.setStartEnd((String)object.get("시종점정보"));
			list.add(course);
		}
		
		courseService.loadFromApi(list);
		
		return "redirect:/admin/course";
	}
}
