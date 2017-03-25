package com.naqi.springmvc.test;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naqi.springmvc.crud.dao.EmployeeDao;
import com.naqi.springmvc.crud.entities.Employee;

@Controller
public class SpringMVCTest {

	@Autowired
	private EmployeeDao employeeDao;
	//进行数据类型转换
	@RequestMapping("/testConversionServiceConverer")
	public String testConverter(@RequestParam("employee") Employee employee){
		System.out.println("save: " + employee);
		employeeDao.save(employee);
		return "redirect:/emps";
	}
	
	@ResponseBody
	@RequestMapping("/testJson")
	public Collection<Employee> testJson(){
		return employeeDao.getAll();
	}
}
