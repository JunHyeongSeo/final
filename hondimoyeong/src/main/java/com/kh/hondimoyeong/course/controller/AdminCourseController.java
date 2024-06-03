package com.kh.hondimoyeong.course.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hondimoyeong.course.model.service.CourseServiceImpl;
import com.kh.hondimoyeong.course.model.vo.Course;
import com.kh.hondimoyeong.course.model.vo.CourseFile;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("admin/course")
@RequiredArgsConstructor
public class AdminCourseController {

	private final CourseServiceImpl courseService;
	
	@GetMapping()
	public ModelAndView allCourseList(ModelAndView mv) {
		mv.addObject("list", courseService.allCourseList()).setViewName("admin/course/courseList");
		return mv;
	}
	
	@GetMapping("/{courseIndex}")
	public ModelAndView courseDetail(@PathVariable int courseIndex,
									 ModelAndView mv) {
		
		mv.addObject("course", courseService.courseDetail(courseIndex)).setViewName("admin/course/courseDetail");
		return mv;
	}
	
	@GetMapping("/update/{courseIndex}")
	public ModelAndView courseUpdateForm(@PathVariable int courseIndex,
										 ModelAndView mv) {
		
		mv.addObject("course", courseService.courseDetail(courseIndex)).setViewName("admin/course/courseUpdateForm");
		
		return mv;
	}
	
	@PostMapping("/update/updateCourse")
	public String courseUpdate(Course course,
							   MultipartFile stamp,
							   MultipartFile detailMap,
							   List<MultipartFile> photo,
							   HttpSession session) {
		
		int courseIndex = course.getCourseIndex();
		
		if(courseService.updateCourse(course) > 0) {
			
			if(!stamp.getOriginalFilename().equals("")) {
				CourseFile stampImg = new CourseFile();
				stampImg.setCourseIndex(courseIndex);
				stampImg.setOriginName(stamp.getOriginalFilename());
				stampImg.setChangeName(saveStamp(stamp, session));
				stampImg.setFileLevel(1);
				
				courseService.updateStamp(stampImg);
			}
			

			if(!detailMap.getOriginalFilename().equals("")) {
				CourseFile detailMapImg = new CourseFile();
				detailMapImg.setCourseIndex(courseIndex);
				detailMapImg.setOriginName(detailMap.getOriginalFilename());
				detailMapImg.setChangeName(saveDetailMap(detailMap, session));
				detailMapImg.setFileLevel(2);
				
				courseService.updateDetailMap(detailMapImg);
			}
			
			List<CourseFile> photoList = new ArrayList<CourseFile>();
			
			for(int i = 0; i < photo.size(); i++) {
				
				if(!photo.get(i).getOriginalFilename().equals("")) {
					CourseFile photoImg = new CourseFile();
					photoImg.setCourseIndex(courseIndex);
					photoImg.setOriginName(photo.get(i).getOriginalFilename());
					photoImg.setChangeName(savePhoto(photo.get(i), session));
					photoImg.setFileLevel(3);
					
					photoList.add(photoImg);
				}
			}
					
			if(!photoList.isEmpty()) {
				courseService.updatePhoto(photoList);				
			}
		}

		return "redirect:/admin/course/"+course.getCourseIndex();
	}
	
	public String saveStamp(MultipartFile stamp, HttpSession session) {
		
		String originName = stamp.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String currentTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
		int randomNum = (int)(Math.random() * 90000) + 10000;
		
		String changeName = currentTime + randomNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/course/stamp/");
		
		
		try {
			stamp.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "resources/course/stamp/" + changeName;
	}
	
	public String saveDetailMap(MultipartFile detailMap, HttpSession session) {
		String originName = detailMap.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String currentTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
		int randomNum = (int) (Math.random() * 90000) + 10000;
		String changeName = currentTime + randomNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/course/detailMap/");
		
		try {
			detailMap.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "resources/course/detailMap/" + changeName;
	}
	
	public String savePhoto(MultipartFile photo, HttpSession session) {
		String originName = photo.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String currentTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
		int randomNum = (int)(Math.random() * 90000) + 10000;
		String changeName = currentTime + randomNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/course/photo/");
		
		try {
			photo.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "resources/course/photo/" + changeName;
	}
	
	
	
	

}
