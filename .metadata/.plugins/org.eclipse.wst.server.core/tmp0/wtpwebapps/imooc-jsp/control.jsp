<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp"
    pageEncoding="UTF-8" import="com.imooc.DB.*, com.imooc.bean.*, java.util.*, java.text.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EMP attendance system</title>
</head>
<body>
	<%!
		public String getNow(){
			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss");
			Date currentTime = new Date();
			return formatter.format(currentTime);
		}
	%>
	
	
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
			Object o = application.getAttribute("count");
			if (o == null){
				application.setAttribute("count", 1);
			}else{
				int count = Integer.parseInt(o.toString());
				application.setAttribute("count", count + 1);
			}
			session.setAttribute("account", account);
	%>
		<h3 align="right">PV: <%=application.getAttribute("count") %></h3>
		<h3 align="right">Your account: <%=session.getAttribute("account") %> </h3>
		<h3 align="center">Welcome to employee attendance system</h3>
		<hr>
		<table align="center" border="1" width="500px">
			<tr>
				<td>
					AccountID
				</td>
				<td>
					Name
				</td>
				<td>
					Email
				</td>
				<td>
					modify
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
						<td>
							<a href="update.jsp?account=<%=e.getAccount() %>&name=<%=e.getName() %>&email=<%= e.getEmail() %>">change</a>
						</td>
					</tr>
					<%
				}
			%>
		</table>
	<%
		}else{
			throw new Exception("Account doesn't exist or password is wrong");
			//out.println("Account doesn't exist or password is wrong");
		}
	 %>
	<hr>
	<h3 align="right">login time: <%= getNow() %>  </h3>
	<h3 align="right">Encoding style: <%= response.getCharacterEncoding()%></h3>
	<h3 align="right">page basic information: <%=this.getServletInfo() %></h3>
</body>
</html>