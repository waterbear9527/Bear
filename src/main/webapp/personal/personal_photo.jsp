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
				background-color: white;
			}
			.title{
				font-size: 20px;
				color: #00a1d6;
				font-weight: bold;
				padding-left: 20px;
				padding-top: 10px;
				padding-bottom: 10px;
				border-bottom: 2px solid #999999;
			}
			.head{
				position: relative;
				top: 35px;
				text-align: center;
			}
			img{
				margin: auto;
			}
			a{
				text-decoration: none;
			}
			.eidt{
				color: white;
				padding: 3px 12px 3px 12px;
				background-color: #00a1d7;
				font-size: 14px;
			}
			.confirm{
				color: white;
				padding: 3px 12px 3px 12px;
				background-color: #00a1d7;
				font-size: 14px;
				border: 0px;
				position: relative;
				top: 10px;
			}
			.confirm:hover{
				cursor: pointer;
			}
			a:hover{
				cursor: pointer;
			}
			.function{
				height: 30px;
				position: relative;
				border-bottom: 1px solid #999999;
				top: 100px;
			}
			.function div{
				float: left;
				margin-left: 10px;
				width: 80px;
			}
			.series{
				height: 30px;
				position: relative;
				top: 110px;
			}
			.series div{
				float: left;
				margin-left: 8px;
				font-size: 14px;
				width: 50px;
				text-align: center;
			}
			.series div a{
				color: black;
			}
			.series div a:hover{
				cursor: pointer;
			}
			.off_color{
				color: white;
				border-radius: 100px;
				background-color: #00A1D6;
			}
			table{
				width: 826px;
				text-align: center;
			}
			table tr td{
				border: 2px solid #AAAAAA;
				height: 120px;
				padding-bottom: 20px;
			}
			table tr td:hover{
				border: 2px solid #00A1D6;
				cursor: pointer;
			}
			table tr td img{
				position: relative;
				height: 80px; 
				width: 80px;
				top: 15px;
			}
			table tr td span{
				position: relative;
				top: 15px;
			}
			.photos{
				position: relative;
				top: 120px;
			}
		</style>
		<script type="text/javascript" src="/Bear/js/jquery-3.4.1.js" ></script>
		<script type="text/javascript">
			function textcolor(nodes){ 
				$(nodes).css("color","#00A1D6");
			}
			function textcolor1(nodes){
				for(var x=0; x<$(".series>div").length; x++){
					$($(".series>div")[x]).removeClass("off_color");
				}
				$(nodes).parent().addClass("off_color");
			}
			function set_photo(nodes){
				var flag = window.confirm("确定将头像设置为："+$(nodes).children()[2].innerHTML+"?");
				if(flag){
					$(".head>img").attr("src",$(nodes).children()[0].src);
				}
			}
			
			$(function(){
				for(var x=0;x<$("td").length;x++){
					$($("td")[x]).click(function(){set_photo(this);});
				}
				$(".eidt").click(function(){
					$(":file[name='file']").click();
				});
				$(":file[name='file']").change(function(){
					var file1 = this.files[0];
					var preview = $(".head>img").get(0);
					var imgUrl = window.URL.createObjectURL(file1);
					preview.setAttribute("src", imgUrl)
		            preview.onload = function() {
		                URL.revokeObjectURL(imgUrl)
		            }
				});
			});
		</script>
	</head>
	<body>
		<form action="../updPhoto" method="post" enctype="multipart/form-data">
			<div class="title">修改头像</div>
			<div class="head">
				<img src="/Bear/images/pictrue/${user_info.photo}" height="80px" width="80px" /><br />
				<a class="eidt" >本地头像</a><br />
				<input type="file" name="file" style="display: none;"  />
				<input type="submit" class="confirm" value="确认修改"/>
			</div>
			<div class="function">
				<div>
					<a href="#" style="color: #000000;" onclick="textcolor(this)">系统头像</a>
				</div>
			</div>
			<div class="series">
				<div>
					<a onclick="textcolor1(this)">可爱风</a>
				</div>
				<div>
					<a onclick="textcolor1(this)">动漫风</a>
				</div>
			</div>
			<div class="photos">
				<table>
					<tr>
						<td ><img src="/Bear/images/main/cai.png" /><br /><span>踩</span></td>
						<td ><img src="/Bear/images/main/comment.png" /><br /><span>评论</span></td>
						<td ><img src="/Bear/images/login/password.png" /><br /><span>锁</span></td>
						<td ><img src="/Bear/images/main/zan.png" /><br /><span>赞</span></td>
					</tr>
					<tr>
						<td ><img src="/Bear/images/main/background.jpg" /><br /><span>图片</span></td>
						<td ><img src="/Bear/images/main/background.jpg" /><br /><span>图片</span></td>
						<td ><img src="/Bear/images/main/background.jpg" /><br /><span>图片</span></td>
						<td ><img src="/Bear/images/main/background.jpg" /><br /><span>图片</span></td>
					</tr>
					<tr>
						<td ><img src="/Bear/images/main/background.jpg" /><br /><span>图片</span></td>
						<td ><img src="/Bear/images/main/background.jpg" /><br /><span>图片</span></td>
						<td ><img src="/Bear/images/main/background.jpg" /><br /><span>图片</span></td>
						<td ><img src="/Bear/images/main/background.jpg" /><br /><span>图片</span></td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>
