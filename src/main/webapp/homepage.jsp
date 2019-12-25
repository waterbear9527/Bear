<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/theme.css" />
		<style>
			label{
				padding: 10px;
				display: block;
				color: white;
				text-align: center;
			}
			span{
				color: white;
			}
			p{
				color: white;
			}
			.area{
				height: 150px;
				width: 819.2px;
				margin: 0px 20px 0px 20px;
				background-color: #999999;
				color: white;
				border: 0px;
			}
			.main{
				margin-top: 20px;
				height: 500px;
			}
			.main-left{
				height: 500px;
				width: 200px;
				float: left;
			}
			.left-account{
				width: 200px;
				height: 230px;
				background-color: #545560;
				text-align: center;
			}
			.account-picture{
				height: 70px;
				width: 70px;
				position: relative;
				top: 20px;
				left: 0px;
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
			.account-game{
				position: relative;
				color: white;
				top: 50px;
			}
			.account-game a{
				color: white;
			}
			.left-follow{
				height: 470px;
				margin-top: 20px;
				background-color: #545560;
			}
			.left-follow a{
				color: white;
				display: block;
				padding: 10px;
				text-align: center;
			}
			.left-follow a:hover{
				background-color: white;
				color: black;
			}
			.main-right{
				margin-left: 220px;
			}
			.right-message{
				height: 180px;
				padding: 20px 20px 0px 20px;
				background-color: #353640;
				margin-top: 20px;
			}
			.message-picture{
				text-align: center;
				width: 70px;
				height: 160px;
				float: left;
			}
			.message-text{
				height: 160px;
				padding-left: 80px;
				position: relative;
				left: 5px;
			}
			.text-fabulous{
				height: 45px;
				float: left;
			}
			img:hover{
				cursor: pointer;
			}
			.message-text span{
				font-size: 15px;
			}
			.text-step_on{
				height: 45px;
				margin-left: 25px;
				float: left;
			}
			.text-comment{
				height: 30px;
				float: right;
				margin-top: 19px;
				width: 90px;
				border: 0px;
				text-align: center;
			}
			.text-comment:hover{
				cursor: pointer;
			}
			.text-date{
				float: right;
				width: 200px;
				height: 30px;
				margin-top: 19px;
				text-align: center;
			}
			.main-bottom{
				height: 230px;
				background-color: #353640;
				margin-top: 20px;
				margin-left: 220px;
			}
			.bottom-text{
				height: 230px;
			}
			.text-function{
				height: 20px;
				padding: 8px 0px 10px 20px;
			}
			.text-anonymous{
				margin-top: 12px;
				margin-right: 5px;
				float: right;
				height: 30px;
			}
			.publish{
				float: right;
				width: 70px;
				height: 30px;
				margin-right: 20px;
				margin-top: 8px;
				font-size: 17px;
			}
			.main-limit{
				text-align: center;
				margin-top: 20px;
			}
			.limit-a{
				margin:auto;
				padding: 0px 7px 0px 7px;
				background-color: #999999;
				color: white;
			}
			.text-reply{
				background-color:#545560;
				margin-top:48px; 
				display:none;
				width:100%;
				height:150px;
				border: 0px;
			}
			.reply-edit{
				height:50px;
				background-color: #999999;
				color:white;
				padding:0px 3px 0px 3px;
				margin:10px 20px 0px 20px;
				overflow-y: auto;/*超过高度出现滚轮*/
				overflow-x: hidden;
				_overflow-y: visible;
				word-wrap: break-word;/*字体超过div自动换行*/
				outline:0px;/*用于取消单击时出现虚框*/
			}
			.reply-but{
				height:26px;
				width:60px;
				float:right;
				margin-right:20px;
			}
		</style>
		<script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
		<script type="text/javascript">
			function evaluate1(node,floor,flag){
				$.post("click",{"floor":floor, "flag":flag},function(message){
					if(flag==1){
						$(node).prev().prev().html(message.fabulous_count+"赞");
					}else{
						$(node).prev().prev().html(message.stepon_count+"踩");
					}
				});
			}
			function reply(code){
				var mid = $($(code).next()).children("span").html().split("楼")[0];
				if($($(code).next()).next(".text-reply").css("display")=="none"){
					$(code).html("<span style='position: relative;top:2px;left:3px;'>收起回复</span>");
					$.get("selReplyMessage",{"mid":mid},function(data){
						var result = "";
						for(var x=0; x<data.length; x++){
							result+= "<li style='height: 50px;'><img src='images/pictrue/"+data[x].users_info.photo+"' width='34px' height='34px' style='float:left; margin-left: 8px; margin-top: 8px;'><div style='height: 38px;color: white;position: relative;top:6px;margin-left:50px;margin-right:8px; '><a href='#' style='color: blue;'>"+data[x].users.username+"</a><span>:"+data[x].context+"</span><div style='height:20px;text-align: right;'><span>"+data[x].createtime+"</span></div></div></li>";
						}
						$($(code).next()).next(".text-reply").children("ul").html(result);
						$($(code).next()).next(".text-reply").css("display","block");
						$($(code).next()).next(".text-reply").animate({height: ((parseInt(data.length)*50)+150)+"px"},400);
						$($(code).parent()).parent().animate({height: ((parseInt(data.length)*50)+330)+"px"},400);
					});
				}else{
					$($(code).next()).next(".text-reply").slideToggle(400);
					$.get("selReplyMessage",{"mid":mid},function(data){
						if(data.length!=0){
							$(code).html("<img src='images/main/comment.png' width='25px' style='margin-top: 4px; margin-left: 2px;'/><span style='position: relative;bottom: 3.8px;'>回复("+data.length+")</span>");
						}else{
							$(code).html("<img src='images/main/comment.png' width='25px' style='margin-top: 4px; margin-left: 2px;'/><span style='position: relative;bottom: 3.8px;'>回复</span>");
						}
					});
					$($(code).parent()).parent().animate({height: "180px"},400);
				}
				
			}
			function relpys(node){
				var context = $(node).prev().html();
				context = context.replace(/\s/g,""); 
				var mid = $($(node).parent()).prev().children("span").html().split("楼")[0];
				var uid = "${user.id}";
				$.post("insReplyMessage",{"context":context,"uid":uid,"mid":mid},function(data){
					$(node).prev().prev().append("<li style='height: 50px;'><img src='images/pictrue/${user_info.photo}' width='34px' height='34px' style='float:left; margin-left: 8px; margin-top: 8px;'><div style='height: 38px;color: white;position: relative;top:6px;margin-left:50px;margin-right:8px; '><a href='#' style='color: blue;'>${user.username}</a><span>:"+context+"</span><div style='height:20px;text-align: right;'><span>"+data.createtime+":00</span></div></div></li>");
					var h = $(node).parent().css("height").split("px")[0];
					$(node).parent().css("height",(parseInt(h)+50)+"px");
					$($($(node).parent()).parent()).parent().css("height",(parseInt(h)+250)+"px");
				});
			}
			$(function(){
				
			});
		</script> 
	</head>
	<body>
		<div class="logo"></div>	<!-- LOGO -->
		<div class="menu">			<!-- 菜单项 -->
			<a href="homepage.jsp">首页</a>
			<a href="#">玩家留言</a>
			<a href="personal.jsp">个人信息</a>
			<a href="#">个人主页</a>
		</div>
		<div class="main">
			<div class="main-left">
				<div class="left-account">	<!-- 用户信息 -->
					<img src="/Bear/images/pictrue/${user_info.photo}" class="account-picture" /><br />
					<span class="account-name">${user.username}</span><br />
					<span class="account-level">等级：${user_info.level}</span><br />
					<span class="account-game">常玩的游戏：<a href="#">${user_info.games}</a></span>
				</div>
				<div class="left-follow">	<!-- 动态 -->
					<label style=" background-color: #999999;">我的动态</label>
					<a href="#">我点赞的</a>
					<a href="#">我回复的</a>
					<a href="#">我转发的</a>
					<label style=" background-color: #999999;">我参与的话题</label>
					<a href="#">#Java与Python前景</a>
					<a href="#">#70周年</a>
					<a href="#">#国庆去哪玩</a>
				</div>
			</div>
			<div class="main-right">	<!-- 所有用户发布的消息 -->
				<c:forEach items="${messages}" var="message">
					<div class='right-message'>
						<div class='message-picture'>
							<img src='/Bear/images/pictrue/${message.users_info.photo}' width='60px' height='60px'/><br />
							<span>${message.users.username }</span><br />
							<span>等级：${message.users_info.level }</span>
						</div>
						<div class='message-text'>
							<p style="height: 110px;">${message.context }</p>
							<div class='text-fabulous'>
								<span>${message.fabulous_count }赞</span><br />
								<img src='images/main/zan.png' onclick='evaluate1(this,${message.id},1)' width='22px' />
							</div>
							<div class='text-step_on'>
								<span >${message.stepon_count}踩</span><br />
								<img src='images/main/cai.png' onclick='evaluate1(this,${message.id},-1)' width='22px' style='margin-top: 4px;'/>
							</div>
							<div class='text-comment' onclick="reply(this)">
								<img src='images/main/comment.png' width='25px' style="margin-top: 4px; margin-left: 2px;"/>
								<c:if test="${fn:length(message.message_replys)!=0}">
									<span style='position: relative;bottom: 3.8px;'>回复(${fn:length(message.message_replys)})</span>
								</c:if>
								<c:if test="${fn:length(message.message_replys)==0}">
									<span style='position: relative;bottom: 3.8px;'>回复</span>
								</c:if>
							</div>
							<div class='text-date'>
								<span>${message.id}楼</span>&nbsp;
								<span>${message.createtime }</span>
							</div>
							<div class="text-reply" >
								<ul style="list-style-type: none;border-bottom: 2px solid blue;">
								</ul>
								<div contenteditable="true" class="reply-edit">
								</div>	
								<button class="reply-but" onclick="relpys(this)">发表</button>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="main-limit">
					<c:forEach var="x" begin="0" end="${(count-1)/5}" step="1">
						<a class="limit-a" href="message?pageNo=${x+1}">${x+1}</a>
					</c:forEach>
				</div>
				
			</div>
			<div class="main-bottom">
				<form action="publish" method="post">
					<div class="bottom-text">
						<div class="text-function">
							<a href="#">图片</a>&nbsp;|&nbsp;
							<a href="#">视频</a>&nbsp;|&nbsp;
							<a href="#">超大附件</a>&nbsp;|&nbsp;
							<a href="#">话题</a>&nbsp;&nbsp;
						</div>
						<textarea name="context" class="area"></textarea>
						<input type="submit" class="publish" value="发表"/>
						<div class="text-anonymous">
							<input type="checkbox" value="1" />匿名发送
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
