<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			body{
				background-color: #353640;
			}
			table{
				margin: auto;
				height: 150px;
				width: 300px;
				color: white;
				margin-top: 230px;
				text-align: center;
				border: 2px solid white;
			}
			.title{
				font-size: 20px;
				color: white;
				font-weight: bold;
				padding-left: 20px;
				padding-top: 10px;
				padding-bottom: 10px;
				border-bottom: 2px solid white;
			}
			input[type=password]{
				color: black;
			}
			input[type=submit],input[type=reset]{
				height: 25px;
			}
		</style>
		<script type="text/javascript" src="/Bear/js/jquery-3.4.1.js"></script>
		<script type="text/javascript">
			$(function(){
				//更改密码校验
				$("input[type='submit']").click(function(){
					if($(":password[name='password']").val()!="${user.password}"){
						alert("原始密码不正确");
						return false;
					}else{
						if($(":password[name='new_password']").val()!=$(":password[name='confirm_password']").val()){
							alert("两次密码不一致");
							return false;
						}else{
							if($(":password[name='new_password']").val()==$(":password[name='password']").val()){
								alert("新密码不可以与旧密码相同");
								return false;
							}else{
								return true;
							}
						}
					}
				});
				//密码更改成功后重定向到登录界面
				if("${empty success}"!="true"){
					alert("${success}");
					alert("账号异常！请重新登录");
					<% session.removeAttribute("success");%>
					parent.location.href =  "/Bear/login.jsp";
				}
			});
		</script>
	</head>
	<body>
		<form action="/Bear/udpPassword" method="post">
			<div class="title">修改密码</div>
			<table>
				<tr>
					<td>原始密码：</td>
					<td><input type="password" name="password" /><br /></td>
				</tr>
				<tr>
					 <td>新密码：</td>
					 <td><input type="password" name="new_password" /><br /></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td><input type="password" name="confirm_password" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="修改"/>
						<input type="reset" value="重置" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
