<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Bear Login!</title>
		<style type="text/css">
			*{
				margin:0px;
				padding: 0px;
			}
			input::-moz-placeholder{   /* Mozilla Firefox 19+ */
	            color:#B0B0Bb;
	        }
	        input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
	            color:#B0B0Bb;
	        }
	        input:-ms-input-placeholder{  /* Internet Explorer 10-11 */ 
	            color:#B0B0Bb;
	        }
			body{
				text-align:center;	/*内容居中*/
				background-image: url("images/login/xinxin.jpg");
				background-repeat: no-repeat;	/*不重复*/
				background-size: cover;		/*不更改图片原始像素*/
				background-attachment: fixed;
			}	
			th{
				padding-top: 5;
				font-size: 22px;
				color: #B0DDDD;
			}
			label{
				padding-top: 5;
				font-size: 22px;
				color: #B0DDDD;
			}
			/*登录界面table*/
			#table_login{
				margin:auto;
				margin-top:140px;
				text-align: center;	/*内容居中*/
				background-color: rgba(192,192,192,0.15);
				border-radius: 50px;
				width: 480px;
				height: 320px;
			}
			/*注册界面div*/
			#table_register{
				margin:auto;
				margin-top:20px;
				text-align: center;	/*内容居中*/
				background-color: rgba(192,192,192,0.15);
				border-radius: 50px;
				width: 480px;
				height: 590px;
			}
			/*密码和用户名和验证码input*/
			.inp{
				border:0px;
				font-size: 16px;	/*输入的字体大小*/
				color: white;
				background-color: rgba(255,255,255,0);	/*最后一项为透明度*/
				padding-left: 5px;
				position: relative;	/*相对布局*/
				bottom: 2px;
			}
			/*验证码*/
			.code_div{
				border-radius: 15px;/*边框出角度*/
				background-color: rgba(255,255,255,0.2);
				text-align:center;	/*居中*/
				font-size:25px;		/*字体角度*/
				font-weight: bold;	/*粗体*/
				width: 110px;
				height: 34px;
			}
			/*鼠标移动到验证码时出现 手型手势*/
			.code_div:hover{
				cursor:pointer;	/*手指形状的手势*/
			}
			/*鼠标移动到返回图标时出现 手型手势*/
			#back:hover{
				cursor:pointer;	/*手指形状的手势*/
			}
			/*注册和登录按钮*/
			input[type=submit],input[type=button]{
				border:0px;
				border-radius: 15px;	/*边框出角度*/
				background-color: #55DDDD; 
				width: 130px;
				height: 34px;
			}
			/*用户名和密码和验证码用div套在里面用于添加 icon*/
			.div_inp{
				text-align:left;
				border:1px solid #B0B0Bb;
				border-radius: 15px;	/*边框出角度*/
				height: 32px;
				width: 250px;
			}
			/*用户名和密码的图标*/
			.icon{
				margin-top:6px;
				margin-left: 8px; 
			}
			/*输入框高亮设置*/
			.inp_focus{
				box-shadow:0 0 15px rgba(00,255,255,0.9);
			}
			.inp_blur{
				box-shadow:none;
			}
			.error_login{
				width: 250px;
				padding-top: 5px;
				padding-bottom: 5px;
				background-color: #353640;
				color: white;
				display:none;
				position: absolute;
				top: 270px;
				left: 560px;
			}
		</style>
		<script type="text/javascript" src="/Bear/js/jquery-3.4.1.js"></script>
		<script type="text/javascript">
			var flag1 = "";
			/*验证码点击响应*/
			function click_code(div_code){
				/*验证码中的字符*/
				var codes = new Array('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g',
										'h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
				/*验证码颜色*/
				var colors = new Array('red','blue','white','black','purple','green','yellow','silver','orange','olive');
				var code = "";
	            $(div_code).html("");
				for(var i=0;i<4;i++){
					code+="<span style='height:100%; margin-left:4px; color:"+colors[Math.floor(Math.random()*10)]+"'>"+codes[Math.floor(Math.random()*36)]+"</span>"
				}
				/*拼接后的验证码添加到div里面去*/
				$(div_code).append(code);
			}
			/*得到焦点执行的事件*/
			function inp_focus(){
				/*获取到输入框焦点时，将输入框外围设置为高亮*/
				$(this).parent().css("box-shadow","0 0 15px rgba(0,255,255,0.9)");
				/*判断获取到的焦点的输入框是否是用户名输入框*/
				if($(this).attr("name")=="reg_username"){
					/*将输入框提示语外围div由隐藏状态增加动画显现出来*/
					if($("#div_name").css("display")=="none"){
						$("#div_name").slideToggle(500);
					}
					/*判断提示语的提示语句是否是隐藏状态，如果是将他显现出来*/
					if($($("#div_name>div")[0]).css("display")=="none"){
						$($("#div_name>div")[0]).slideToggle(500);
					}
					if($($("#div_name>div")[1]).css("display")=="none"){
						$($("#div_name>div")[1]).slideToggle(500);
					}
					if($($("#div_name>div")[2]).css("display")=="none"){
						$($("#div_name>div")[2]).slideToggle(500);
					}
					/*每次得到焦点时对当前的输入框的文字进行校验，并根据输入框的文件对提示语进行颜色改变*/
					inp_change(this);
				}else if($(this).attr("name")=="phone"){	/*手机号码输入框*/
					if($("#div_phone").css("display")=="none"){
						$("#div_phone").slideToggle(500);
					}
					inp_change(this);
				}else if($(this).attr("name")=="reg_password"){	/*密码输入框*/
					if($("#div_password").css("display")=="none"){
						$("#div_password").slideToggle(500);
					}
					if($($("#div_password>div")[0]).css("display")=="none"){
						$($("#div_password>div")[0]).slideToggle(500);
					}
					if($($("#div_password>div")[1]).css("display")=="none"){
						$($("#div_password>div")[1]).slideToggle(500);
					}
					if($($("#div_password>div")[2]).css("display")=="none"){
						$($("#div_password>div")[2]).slideToggle(500);
					}
					inp_change(this);
				}else if($(this).attr("name")=="confirm_password"){	/*确认密码输入框*/
					if($("#div_confirm_password").css("display")=="none"){
						$("#div_confirm_password").slideToggle(500);
					}
					inp_change(this);
				}else if($(this).attr("name")=="reg_code"){	/*验证码输入框*/
					if($("#div_code2").css("display")=="none"){
						$("#div_code2").slideToggle(500);
					}
				}
			}
			/*input值改变时执行的方法*/
			function inp_change(inp,flag2){
				/*判断传递过来的对象是否为用户名输入框*/
				if(inp.getAttribute("name")=="reg_username"){
					/*用户名正则，以字母开头 不可以用特殊字符，长度为 6-12*/
					var reg = /^[A-Za-z][A-Za-z0-9]{5,11}$/;
					/*字母开头的校验 用于二次校验*/
					var reg_first = /^[a-zA-Z]$/;
					/*判断中间字符的正则，也是用于二次校验*/
					var reg_special = /^[a-zA-Z0-9]+$/;
					/*获取用户输入的值*/
					var inp_val = $(":text[name='reg_username']").get(0).value;
					/*判断用户名是否为空 或者 不存在 如果空或不存在则将提示语设置为红色*/
					if(inp_val==null || inp_val=="" || inp_val==undefined){
						$($("#div_name>div")[0]).css("color","red");
						$($("#div_name>div")[1]).css("color","green");
						$($("#div_name>div")[2]).css("color","red");
						/*用于失去焦点时做判断是否隐藏提示语*/
						flag1 = "err01";
					}else if(!reg.test(inp_val)){	/*执行用户名正则  为ture的可能由三种  首字符不是字母  长度不符合6-12  有特殊字符的出现 所以需要做二次校验*/
						if(!reg_first.test(inp_val.charAt(0))){		/*首字母二次校验 获取到用户输入数据的首字符，判断是否是字母  如果不是字母  则将首字母提示语设置为红色 后续继续对特殊字符和 长度进行二次校验*/
							$($("#div_name>div")[0]).css("color","red");
							if(!reg_special.test(inp_val)){
								$($("#div_name>div")[1]).css("color","red");
							}else{
								$($("#div_name>div")[1]).css("color","green");
							}
							if(inp_val.length>=6 && inp_val.length<=12){
								$($("#div_name>div")[2]).css("color","green");
							}else{
								$($("#div_name>div")[2]).css("color","red");
							}
							flag1 = "err01";
						}else if(inp_val.length<6 || inp_val.length>12){	/*长度二次校验*/
							$($("#div_name>div")[0]).css("color","green");
							if(!reg_special.test(inp_val)){
								$($("#div_name>div")[1]).css("color","red");
								$($("#div_name>div")[2]).css("color","red");
								flag1 = "err02";
							}else{
								$($("#div_name>div")[1]).css("color","green");
								$($("#div_name>div")[2]).css("color","red");
								flag1 = "err03";
							}
						}else if(!reg_special.test(inp_val)){	/*特殊字符二次校验*/
							$($("#div_name>div")[0]).css("color","green");
							$($("#div_name>div")[1]).css("color","red");
							if(inp_val.length>=6 && inp_val.length<=12){
								$($("#div_name>div")[2]).css("color","green");
							}else{
								$($("#div_name>div")[2]).css("color","red");
							}
							flag1 = "err02";
						}
					}else{	/*以上校验如果都通过就将所有提示语设置为绿色*/
						$($("#div_name>div")[0]).css("color","green");
						$($("#div_name>div")[1]).css("color","green");
						$($("#div_name>div")[2]).css("color","green");
						flag1 = "success";
					}
				}else if(inp.getAttribute("name")=="phone"){	/*手机号码*/
					var reg = /^1[3456789]\d{9}$/;
					var inp_val = $(":text[name='phone']").get(0).value;
					if(!reg.test(inp_val)){
						$("#div_phone").css("color","red");
						flag1 = "err";
					}else{
						$("#div_phone").css("color","green");
						flag1 = "success_phone";
					}
				}else if(inp.getAttribute("name")=="reg_password"){	/*密码*/
					/*密码正则 ， 比较麻烦 ，直接复制网上的了 因为有一个 要求是 必须出现两种类型的字符 */
					var reg = /(?!.*\s)(?!^[\u4e00-\u9fa5]+$)(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{8,16}$/;
					/*密码的二次校验正则，去除了长度的校验*/
					var reg_special = /(?!.*\s)(?!^[\u4e00-\u9fa5]+$)(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.*$/;
					var inp_val = $(":password[name='reg_password']").get(0).value;
					if(inp_val==null || inp_val=="" || inp_val==undefined){
						$($("#div_password>div")[0]).css("color","red");
						$($("#div_password>div")[1]).css("color","red");
						$($("#div_password>div")[2]).css("color","red");
						flag1 = "err_password01";
					}else if(!reg.test(inp_val)){
						if(inp_val.indexOf(" ")!=-1){	/*判断用户输入的密码是否包含空格*/
							$($("#div_password>div")[0]).css("color","red");
							inp_val = inp_val.replace(/\s/g,"a");	/*将所有空格字符都替换成 字符a 为了防止二次校验字符种类的时候出现错误*/
							if(!reg_special.test(inp_val)){
								$($("#div_password>div")[1]).css("color","red");
							}else{
								$($("#div_password>div")[1]).css("color","green");
							}
							if(inp_val.length>=8 && inp_val.length<=16){
								$($("#div_password>div")[2]).css("color","green");
							}else{
								$($("#div_password>div")[2]).css("color","red");
							}
							flag1 = "err_password01";
						}else if(inp_val.length<8 || inp_val.length>16){	/*长度二次校验*/
							$($("#div_password>div")[0]).css("color","green");
							inp_val = inp_val.replace(/\s/g,"a");
							if(!reg_special.test(inp_val)){
								$($("#div_password>div")[1]).css("color","red");
								$($("#div_password>div")[2]).css("color","red");
								flag1 = "err_password02";
							}else{
								$($("#div_password>div")[1]).css("color","green");
								$($("#div_password>div")[2]).css("color","red");
								flag1 = "err_password03";
							}
						}else if(!reg_special.test(inp_val)){	/*字符种类二次校验*/
							$($("#div_password>div")[0]).css("color","green");
							$($("#div_password>div")[1]).css("color","red");
							if(inp_val.length>=8 && inp_val.length<=16){
								$($("#div_password>div")[2]).css("color","green");
							}else{
								$($("#div_password>div")[2]).css("color","red");
							}
							flag1 = "err_password02";
						}
					}else{
						$($("#div_password>div")[0]).css("color","green");
						$($("#div_password>div")[1]).css("color","green");
						$($("#div_password>div")[2]).css("color","green");
						flag1 = "success_password";
					}
					/*判断确认密码的提示语是否为隐藏状态 如果隐藏将其以动画效果显现出来*/
					/*防止用户写好确认密码后 再次修改密码 然后确认密码没有改变 直接给出提示语*/
					if($("#div_confirm_password").css("display")=="none"){
						$("#div_confirm_password").slideToggle(500);
					}
					/*执行一次确认密码的校验*/
					inp_change(document.getElementsByName("confirm_password")[0],true);
				}else if(inp.getAttribute("name")=="confirm_password"){	/*确认密码*/
					var password = $(":password[name='reg_password']").get(0).value;	/*获取密码*/
					var confirm_password = inp.value;	/*获取确认密码*/
					if(confirm_password!=password){	/*两次密码判断*/
						$("#div_confirm_password").html("密码不一致");
						$("#div_confirm_password").css("color","red");
						if(!flag2){
							flag1 = "err_confirm_password01";
						}
					}else{
						$("#div_confirm_password").html("密码一致");
						$("#div_confirm_password").css("color","green");
						if(!flag2){
							flag1 = "success_confirm_password";
						}
					}
				}else if(inp.getAttribute("name")=="reg_code"){	/*验证码*/
					var code = "";
					for(var x=0; x<4;x++){
						code+=($("#div_code1>span")[x]).innerHTML;
					}
					if(inp.value!=code){
						$("#div_code2").html("验证码有误");
						$("#div_code2").css("color","red");
						flag1 = "err_code";
					}else{
						$("#div_code2").html("验证码正确");
						$("#div_code2").css("color","green");
						flag1 = "success_code";
					}
				}
				return flag1;
			}
			/*失去焦点时执行的事件*/
			function inp_blur(){
				if($(this).attr("name")=="reg_username"){	/*判断离开焦点时的输入框是否是用户名输入框*/
					var flag = inp_change(this);	/*获取到之前在改值时的标志*/
					if(flag=="err01"){	/*判断错误类型 然后将错误的类型设置为红色 并且将输入框高亮颜色设置为红色*/
						$($("#div_name>div")[0]).css("color","red");
						if($($("#div_name>div")[1]).css("display")!="none" && $($("#div_name>div")[2]).css("display")!="none"){
							$($("#div_name>div")[1]).slideToggle(500);
							$($("#div_name>div")[2]).slideToggle(500);
						}
						$(this).parent().css("box-shadow","0 0 15px rgba(255,0,0,0.8)");
					}else if(flag=="err02"){
						$($("#div_name>div")[1]).css("color","red");
						if($($("#div_name>div")[0]).css("display")!="none" && $($("#div_name>div")[2]).css("display")!="none"){
							$($("#div_name>div")[0]).slideToggle(500);
							$($("#div_name>div")[2]).slideToggle(500);
						}
						$(this).parent().css("box-shadow","0 0 15px rgba(255,0,0,0.8)");
					}else if(flag=="err03"){
						$($("#div_name>div")[2]).css("color","red");
						if($($("#div_name>div")[1]).css("display")!="none" && $($("#div_name>div")[0]).css("display")!="none"){
							$($("#div_name>div")[1]).slideToggle(500);
							$($("#div_name>div")[0]).slideToggle(500);
						}
						$(this).parent().css("box-shadow","0 0 15px rgba(255,0,0,0.8)");
					}else if(flag=="success"){	/*如果校验都通过 就将输入框高亮关闭 并把提示语句隐藏*/
						$("#div_name").slideToggle(500);
						$(this).parent().css("box-shadow","none");
					}
				}else if($(this).attr("name")=="phone"){	/*手机号码*/
					var flag = inp_change(this);
					if(flag=="err"){
						$(this).parent().css("box-shadow","0 0 15px rgba(255,0,0,0.8)");
					}else if(flag=="success_phone"){
						$("#div_phone").slideToggle(500);
						$(this).parent().css("box-shadow","none");
					}
				}else if($(this).attr("name")=="reg_password"){	/*密码*/
					var flag = inp_change(this);
					if(flag=="err_password01"){
						$($("#div_password>div")[0]).css("color","red");
						if($($("#div_password>div")[1]).css("display")!="none" && $($("#div_password>div")[2]).css("display")!="none"){
							$($("#div_password>div")[1]).slideToggle(500);
							$($("#div_password>div")[2]).slideToggle(500);
						}
						$(this).parent().css("box-shadow","0 0 15px rgba(255,0,0,0.8)");
					}else if(flag=="err_password02"){
						$($("#div_password>div")[1]).css("color","red");
						if($($("#div_password>div")[0]).css("display")!="none" && $($("#div_password>div")[2]).css("display")!="none"){
							$($("#div_password>div")[0]).slideToggle(500);
							$($("#div_password>div")[2]).slideToggle(500);
						}
						$(this).parent().css("box-shadow","0 0 15px rgba(255,0,0,0.8)");
					}else if(flag=="err_password03"){
						$($("#div_password>div")[2]).css("color","red");
						if($($("#div_password>div")[1]).css("display")!="none" && $($("#div_password>div")[0]).css("display")!="none"){
							$($("#div_password>div")[1]).slideToggle(500);
							$($("#div_password>div")[0]).slideToggle(500);
						}
						$(this).parent().css("box-shadow","0 0 15px rgba(255,0,0,0.8)");
					}else if(flag=="success_password"){
						$("#div_password").slideToggle(500);
						$(this).parent().css("box-shadow","none");
					}
				}else if($(this).attr("name")=="confirm_password"){	/*确认密码*/
					var flag = inp_change(this);
					if(flag=="err_confirm_password01"){
						$("#div_confirm_password").css("color","red");
						$(this).parent().css("box-shadow","0 0 15px rgba(255,0,0,0.8)");
					}else if(flag=="success_confirm_password"){
						$("#div_confirm_password").slideToggle(500);
						$(this).parent().css("box-shadow","none");
					}
				}else if($(this).attr("name")=="reg_code"){	/*验证码*/
					var flag = inp_change(this);
					if(flag=="err_code"){
						$("#div_code2").css("color","red");
						$(this).parent().css("box-shadow","0 0 15px rgba(255,0,0,0.8)");
					}else if(flag=="success_code"){
						$("#div_code2").slideToggle(500);
						$(this).parent().css("box-shadow","none");
					}
				}
				/*执行一次总判断 判断所有校验是否都无误了 没有错误就把注册按钮设置为可点击状态 */
				/*加入线程睡眠是因为隐藏提示语时是用动画效果有执行时间时间结束了才会将他display属性设置为none 而我这个总判断是用的提示语是否隐藏来进行判断的 所以必须得等他执行完成后才可以进行总判断*/
				setTimeout("state()",500);	
			}
			function state(){
				/*总体校验，根据输入框值是否为空 和 提示语是否为隐藏状态来校验*/
				if($(":text[name='reg_username']").get(0).value!="" && $(":password[name='reg_password']").get(0).value!="" && $(":text[name='reg_code']").get(0).value!="" && $(":text[name='phone']").get(0).value!=""){
					if($("#div_name").css("display")=="none" && $("#div_password").css("display")=="none" && $("#div_phone").css("display")=="none" && $("#div_confirm_password").css("display")=="none" && $("#div_code2").css("display")=="none" ){
						$("#sub_register").attr("disabled",false);
					}
				}
			}
			$(function(){
				/*页面加载时 执行一遍 验证码生成*/
				click_code('#div_code');
				/*登录页面转换到注册界面*/
				$(":button[value='注册']").click(function(){
					$("#div_login").fadeToggle(1000,"swing",function(){	//隐藏div 
						$("#div_register").fadeToggle(1000,"swing");
						click_code('#div_code1');
					});
				});
				/*事件添加*/
				$(":text[name='reg_username']").focus(inp_focus);
				$(":text[name='reg_username']").on('input propertychange',function(){inp_change(this)});
				$(":text[name='reg_username']").blur(inp_blur);
				$(":password[name='reg_password']").focus(inp_focus);
				$(":password[name='reg_password']").on('input propertychange',function(){inp_change(this)});
				$(":password[name='reg_password']").blur(inp_blur); 
				$(":password[name='confirm_password']").focus(inp_focus);
				$(":password[name='confirm_password']").on('input propertychange',function(){inp_change(this)});
				$(":password[name='confirm_password']").blur(inp_blur);
				$(":text[name='reg_code']").focus(inp_focus);
				$(":text[name='reg_code']").on('input propertychange',function(){inp_change(this)});
				$(":text[name='reg_code']").blur(inp_blur);
				$(":text[name='phone']").focus(inp_focus);
				$(":text[name='phone']").on('input propertychange',function(){inp_change(this)});
				$(":text[name='phone']").blur(inp_blur);
				/*回退到登录界面*/
				$("#back").click(function(){
					$("#div_register").fadeToggle(1000,"swing",function(){	//隐藏div 
						$("#div_login").fadeToggle(1000,"swing");
						click_code('#div_code');
					});
				});
				/*登录验证码校验*/
				$(":submit[value='登录']").click(function(){
					var code = "";
					for(var x=0; x<4;x++){
						code+=($("#div_code>span")[x]).innerHTML;
					}
					var inp_code = $(":text[name='code']").get(0).value;
					if(code!=inp_code){
						alert("验证码输入错误");
						click_code("#div_code");
						return false;
					}
				});
				/*用户名密码错误提示框*/
				if("${empty error_login}"!="true"){
					$(".error_login").fadeToggle(1000);
					$(".error_login").fadeToggle(2000);
				}
			});
		</script>
	</head>
	<body>
		<!-- 登录界面  -->
		<div id="div_login">
			<form action="login" method="post">
				<table id="table_login">
					<!-- 标题  -->
					<tr height="70px">
						<th colspan="2">Bear平台</th>
					</tr>
					<!-- 用户名   -->
					<tr height="60px">
						<td colspan="2" align="center" >
							<div class="div_inp" >
								<img src="images/login/username.png" width="17px" class="icon">
								<input type="text" name="username" placeholder="请输入用户名" class="inp" />
							</div>
						</td>
					</tr>
					<!-- 密码  -->
					<tr height="60px">
						<td colspan="2" align="center">
							<div class="div_inp">
								<img src="images/login/password.png" width="15px" class="icon">
								<input type="password" name="password" placeholder="请输入密码" class="inp" />
							</div>
						</td>
					</tr>
					<!-- 验证码  -->
					<tr height="60px">
						<td align="right" width="246px">
							<div class="div_inp" style="width: 125px;">
								<img src="images/login/code.png" width="17px" class="icon">
								<input type="text" name="code" placeholder="验证码" class="inp" style="width: 80px" />
							</div>
						</td>
						<td style="padding-left: 10px" width="230px"><div id="div_code" class="code_div" onclick="click_code('#div_code')"></div></td>
					</tr>
					<!-- 登录和注册按钮  -->
					<tr height="70px">
						<td colspan="2"><input type="submit" value="登录" /><input type="button" value="注册"></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 登录失败提示 -->
		<div class="error_login" >	
				用户名或密码错误
		</div>
		<!-- 注册界面  -->
		<div id="div_register" style="display: none;">
			<form action="register" method="post" >
				<div id="table_register" >
					<!-- 标题  -->
					<div style="height: 90px">
						<label style="padding-left:20px;top: 30px;position: relative;">注册Bear账号<img src="images/login/back.png" style="position: relative; left: 95px" id="back" width="40px"></label>
					</div>
					<!-- 用户名  ：字母开头 6-12个字符 不能包含特殊字符  -->
					<div style="height: 70px">
						<div class="div_inp" style="position: relative;top: 18px;left: 114px;">
							<img src="images/login/username.png" width="17px" class="icon">
							<input type="text" name="reg_username" placeholder="请输入用户名" class="inp"  />
						</div>
					</div>
					<!-- 用户名格式不对提示 -->
					<div id="div_name" style="display: none;position: relative;left: 114px;" align="left">
							<div>必须以字母开头</div>
							<div>不能包含特殊字符</div>
							<div>长度为6-12字符</div>
					</div>
					<!-- 手机号码  -->
					<div style="height: 70px">
						<div class="div_inp" style="position: relative;top: 18px;left: 114px;">
							<img src="images/login/phone.png" width="13px" class="icon">
							<input type="text" name="phone" placeholder="请输入手机号码" class="inp" />
						</div>
					</div>
					<!-- 手机号格式不对提示 -->
					<div id="div_phone" style="display: none;position: relative;left: 114px;" align="left">手机号码格式错误</div>
					<!-- 密码  -->
					<div style="height: 70px">
						<div class="div_inp" style="position: relative;top: 18px;left: 114px;">
							<img src="images/login/password.png" width="15px" class="icon">
							<input type="password" name="reg_password" placeholder="请输入密码" class="inp" />
						</div>
					</div>
					<!-- 密码格式不对提示 -->
					<div id="div_password" style="display: none;position: relative;left: 114px;" align="left">
						<div>不能包含空格</div>
						<div>必须包含字母、数字、符号中至少两种</div>
						<div>长度为8-16字符</div>
					</div>
					<!-- 确认密码  -->
					<div style="height: 70px">
						<div class="div_inp" style="position: relative;top: 18px;left: 114px;">
							<img src="images/login/password.png" width="15px" class="icon">
							<input type="password" name="confirm_password" placeholder="请确认密码" class="inp" />
						</div>
					</div>
					<!-- 两次密码校验提示 -->
					<div id="div_confirm_password" style="display: none;position: relative;left: 114px;" align="left">
					</div>
					<!-- 验证码  -->
					<div style="height: 70px">
						<div style="top: 18px;position: relative;">
							<div class="div_inp" style="width: 125px;float:left; margin-left: 114.5px;" >
								<img src="images/login/code.png" width="17px" class="icon">
								<input type="text" name="reg_code" class="inp" placeholder="验证码" style="width: 80px"  />
							</div>
							<div id="div_code1" style="float:left;margin-left: 13px;" class="code_div" onclick="click_code('#div_code1')"></div>
						</div>
					</div>
					<!-- 验证码校验提示 -->
					<div id="div_code2" style="display: none;position: relative;left: 114px;" align="left">
					</div>
					<!-- 登录和注册按钮  -->
					<div style="height: 90px">
						<div style="top: 28px;position: relative;"><input type="submit" value="注册" disabled="disabled" id="sub_register" /></div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>