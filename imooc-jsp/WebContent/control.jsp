<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.imooc.DB.*, com.imooc.bean.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	这是一个登录页面的处理程序
	<hr>
	<!-- 获取账号及密码，并且需要去调用DBUtil当中的方法来判断是否存在制定的信息
		1.如果正确，DBUtil方法返回的值是true, 显示成功页面
		2.如果错误，false，显示错误消息。
		request:获取请求信息
		getParameter(String name) :可以通过一个控件的name属性来获取控件的值
		
		out:输出流对象，输出制定信息
		pritln();
	 -->
	 <%
	 	String account = request.getParameter("account");
		String password = request.getParameter("password");
		/* out.println("账号："+ account + "密码：" + password); */
		Emp emp = new Emp(account, null, password, null);
		boolean flag = DBUtil.selectEmpByAccountAndPassword(emp);
		Map<String, Emp> map = DBUtil.map;
		if(flag == true){
	%>
		<h3 align="center">欢迎来到人事管理界面</h3>
		<hr>
		<table align="center" border="1" width="500px">
			<tr>
				<td>
					账号
				</td>
				<td>
					员工姓名
				</td>
				<td>
					邮箱
				</td>
			</tr>
			<%
				for(String key:map.keySet()){
					Emp e = map.get(key);
					%>
					<tr>
						<td>
							<%=e.getAccount() %>
						</td>
						<td>
							<%=e.getName() %>
						</td>
						<td>
							<%= e.getEmail() %>
						</td>
					</tr>
					<%
				}
			%>
		</table>
	<%
		}else{
			out.println("账号不存在或者密码错误");
		}
	 %>
	 
</body>
</html>