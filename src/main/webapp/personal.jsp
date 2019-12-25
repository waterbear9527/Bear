<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/theme.css" />
		<style>
			dt{
				background-color: #545560;
				padding-left: 10px;
				padding-top: 5px;
				height: 25px;
				font-weight: bold;
				color: white;
				border-bottom: 2px solid white;
			}
			dd a{
				padding-top: 10px;
				padding-bottom: 10px;
				display: block;
				color: white;
				border-bottom: 2px solid white;
			}
			dd a:hover{
				background-color: white;
				color: black;
			}
			dd a img{
				padding-left: 20px;
				position: relative;
				top: 2px;
			}
			dd a span{
				padding-left: 5px;
			}
			.main{
				margin-top: 20px;
				height: 500px;
			}
			.main-left{
				float: left;
			}
			.left-account{
				width: 200px;
				height: 200px;
				background-color: #545560;
				text-align: center;
			}
			.account-picture{
				height: 80px;
				width: 80px;
				position: relative;
				top: 20px;
				left: px;
			}
			.account-name{
				position: relative;
				color: white;
				top: 30px;
			}
			.account-level{
				position: relative;
				color: white;
				top: 40px;
			}
			.account-function{
				width: 120px;
				position: relative;
				top: 50px;
				left: 40px;
			}
			.left-function{
				width: 200px;
				height: 400px;
				background-color: #545560;
				margin-top: 10px;
			}
			.main-right{
				height: 610px;
				background-color: white;
				margin-left: 220px;
			}
		</style>
		<script type="text/javascript" src="/Bear/js/jquery-3.4.1.js"></script>
		<script type="text/javascript">
			//退出功能
			$(function(){
				$("#back").click(function(){
					window.location.href="/Bear/login.jsp";
				});
			});
		</script>
	</head>
	<body>
		<div class="logo"></div>
		<div class="menu">
			<a href="homepage.jsp">首页</a>
			<a href="#">玩家留言</a>
			<a href="personal.jsp">个人信息</a>
			<a href="#">个人主页</a>
		</div>
		<div class="main">
			<div class="main-left">
				<div class="left-account">
					<img src="/Bear/images/pictrue/${user_info.photo}" class="account-picture"  /><br />
					<span class="account-name">${user.username}</span><br />
					<span class="account-level">等级：${user_info.level}</span>
					<div class="account-function">
						<a href="#" id="back">退出</a>
					</div>
				</div>
				<div class="left-function">
					<dl>
						<dt>账户管理</dt>
						<dd>
							<a href="personal/personal_info.jsp" target="right" >
								<img src="images/main/password.png" width="15px"/>
								<span>账号信息</span>
							</a>
							<a href="personal/personal_password.jsp" id="updpassword" target="right">
								<img src="images/main/password.png" width="15px"/>
								<span>修改密码</span>
							</a>
							<a href="#">
								<img src="images/main/password.png" width="15px"/>
								<span>登录历史</span>
							</a>
							<a href="personal/personal_photo.jsp" target="right">
								<img src="images/main/password.png" width="15px"/>
								<span>修改头像</span>
							</a>
						</dd>
					</dl>
				</div>
			</div>
			<div class="main-right">
				<iframe src="personal/personal_info.jsp" height="100%" width="100%"  name="right"></iframe>
			</div>
		</div>
	</body>
</html>
