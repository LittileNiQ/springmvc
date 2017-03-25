<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="testConversionServiceConverer" method="POST">
		<!-- lastname-email-gender-department.id 例如: GG-gg@atguigu.com-0-105 -->
		Employee: <input type="text" name="employee"/>
		<input type="submit" value="Submit"/>
</form>
	
<!--  
    1.为什么使用form标签呢？
              可以更快速地开发出表单页面，而且可以更方便地进行表单回显、
    2. 注意:
		可以通过 modelAttribute 属性指定绑定的模型属性,
		若没有指定该属性，则默认从 request 域对象中读取 command 的表单 bean
		如果该属性值也不存在，则会发生错误。             
-->
<form:form action="${pageContext.request.contextPath }/emp"  method="POST" modelAttribute="employee">
<form:errors path="*"></form:errors>
  <!-- PATH 属性对应html 表单的name属性值   -->
  <c:if test="${employee.id == null }">
			<!-- path 属性对应 html 表单标签的 name 属性值 -->
			LastName: <form:input path="lastName"/>
			<form:errors path="lastName"></form:errors>  <!--显示错误信息 -->
		</c:if>
		<c:if test="${employee.id != null }">
			<form:hidden path="id"/>
			<input type="hidden" name="_method" value="PUT"/>
			<%-- 对于 _method 不能使用 form:hidden 标签, 因为 modelAttribute 对应的 bean 中没有 _method 这个属性 --%>
			<%-- 
			<form:hidden path="_method" value="PUT"/>
			--%>
		</c:if>
		
		<br>
  Email: <form:input path="email"/>
  <br>
		<% 
			Map<String, String> genders = new HashMap();
			genders.put("1", "Male");
			genders.put("0", "Female");
			
			request.setAttribute("genders", genders);
		%>
  Gender:
  <form:radiobuttons path="gender" items="${genders }" delimiter="<br>"/>
  <br>
  Department: <form:select path="department.id" 
  items="${departments }" itemLabel="departmentName" itemValue="id"></form:select>
  <br>
  <input type="submit" value="Submit"/>
  <br>
</form:form>
</body>
</html>