package com.naqi.springmvc.views;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.View;

@Component
public class HelloView implements View{

	@Override
	public String getContentType() {
		//返回内容类型
		return "text/html";
	}

	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//渲染视图
		response.getWriter().print("hello view , time: "+new Date());
	}
	
   
}
