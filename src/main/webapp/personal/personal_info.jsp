<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			body{
				background-color: #353640;
			}
			ul{
				tdst-style-type: none;
				padding: 0px;
			}
			table{
				width: 300px;
				height: 350px;
			}
			tr td{
				padding-left: 10px;
				color: white;
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
			.acccount{
				background-color: #353640;
				border: 2px solid white;
				margin: auto;
				margin-top: 50px;
				width: 300px;
				height: 450px;
			}
			.account-picture{
				position: relative;
				left: 110px;
				top: 20px;
				display: inline-block; 
				width: 82px; 
				height: 82px
			}
			.account-info{
				position: absolute;
				top: 210px;
			}
			.edit{
				position: relative;
				left:0px;
				top:-23px;
				display: none;
				padding: 3px 15px 3px 15px;
				background-color: #545560;
				font-size: 13px;
				color: white;
			}
			.edit:hover{
				cursor: pointer;
				text-decoration: underline;
			}
		</style>
		<script type="text/javascript" src="/Bear/js/jquery-3.4.1.js"></script>
		<script type="text/javascript">
			$(function(){
				//取消功能
				$("button").click(function(){
					window.location.href = "/Bear/personal/personal_upd_info.jsp";
				});
				//鼠标移动到头像时 出现编辑头像
				$("div>span").mouseover(function(){
					$(".edit").css("display","inline");
				});
				$("div>span").mouseout(function(){
					$(".edit").css("display","none");
				});
				$(".edit").click(function(){
				});
			});
		</script>
	</head>
	<body>
		<div class="title">
			账号信息
		</div>
		<div class="acccount">
			<span class="account-picture" >
				<a>
					<img src="/Bear/images/pictrue/${user_info.photo}" width="80px" height="80px" />
				</a>
				<a  class="edit">编辑头像</a>
			</span>
			<table class="account-info">
				<tr>
					<td width="100px">用户名：</td>
					<td>${user.username}</td>
				</tr>
				<tr>
					<td>性别：</td>
					<td>
						<c:choose> 
						  	<c:when test="${user_info.sex eq '1'}">    <!--如果 --> 
						  		男
						 	</c:when>      
						    <c:otherwise>  <!--否则 --> 
						    	女
						  	</c:otherwise> 
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>生日：</td>
					<td>${user_info.brith }</td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td>${user_info.age }</td>
				</tr>
				<tr>
					<td>电子邮箱：</td>
					<td>${user_info.mail }</td>
				</tr>
				<tr>
					<td>手机：</td>
					<td>${user_info.phone }</td>
				</tr>
				<tr>
					<td>所在地：</td>
					<td>${user_info.location }</td>
				</tr>
				<tr>
					<td>等级：</td>
					<td>${user_info.level}</td>
				</tr>
				<tr>
					<td>常玩的游戏：</td>
					<td>${user_info.games}</td>
				</tr>
				<tr align="center">
					<td colspan="2"><button id="btn">修改</button></td>
				</tr>
			</table>
		</div>
	</body>
</html>
