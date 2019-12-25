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
				margin-left: 110px;
				margin-top: 20px;
			}
		</style>
		<script type="text/javascript" src="/Bear/js/jquery-3.4.1.js"></script>
		<script type="text/javascript">
			//生成 年月日下拉框 并做用户已有生日默认值获取设置。
			function obtain_brith(){
				//获取用户之前的日期
				var brith = "${user_info.brith}";
				var briths = brith.split("-");
				//用jquery生成 option;
				var year = "";
				var month = "";
				var day = "";
				//生成年份option 1949-2019
				for(var y=1949;y<=2019;y++){
					if(y!=briths[0]){
						year+="<option value='"+y+"'>"+y+"</option>";
					}else{
						year+="<option value='"+y+"' selected='selected'>"+y+"</option>";						
					}
				}
				$("select[name='year']").append(year);
				//生成月份option 1-12
				for(var m=1;m<=12;m++){
					if(m!=briths[1]){
						month+="<option value='"+m+"'>"+m+"</option>";
					}else{
						month+="<option value='"+m+"' selected='selected'>"+m+"</option>";						
					}
				}
				$("select[name='month']").append(month);
				//生成日期option 要做月份判断 以及平年闰年的判断
				function obtain_day(){
					//初始化
					day = "";
					var new_day = $("select[name='day']").val(); //获取用户之前选好的日期 防止月份改变时会被更改
					var new_day_html = $("select[name='day']").html();
					//判断是否为 1 3 5 7 8 10 12月份 31天
					if($("select[name='month']").val()==1 || $("select[name='month']").val()==3 || $("select[name='month']").val()==5 || $("select[name='month']").val()==7 || $("select[name='month']").val()==8 || $("select[name='month']").val()==10 || $("select[name='month']").val()==12){
						for(var d=1;d<=31;d++){
							if(new_day_html == null || new_day_html == undefined || new_day_html == ""){
								if(d!=briths[2]){
									day+="<option value='"+d+"'>"+d+"</option>";
								}else{
									day+="<option value='"+d+"' selected='selected'>"+d+"</option>";					
								}
							}else{
								if(d!=new_day){
									day+="<option value='"+d+"'>"+d+"</option>";
								}else{
									day+="<option value='"+d+"' selected='selected'>"+d+"</option>";
								}
							}
						}
					}else if($("select[name='month']").val()==2){	//判断是否为2月份
						var p = 28;
						//判断是平年还是闰年 平年二月是28天 闰年二月是29天
						if($("select[name='year']").val()%4==0){
							p = 29;
						}else{
							p = 28;
						}
						for(var d=1;d<=p;d++){
							//判断日期是否已存在值 防止 月份改变时 日期跟着改变
							if(new_day_html == null || new_day_html == undefined || new_day_html == ""){	
								if(d!=briths[2]){
									day+="<option value='"+d+"'>"+d+"</option>";
								}else{
									day+="<option value='"+d+"' selected='selected'>"+d+"</option>";					
								}
							}else{
								if(d!=new_day){
									day+="<option value='"+d+"'>"+d+"</option>";
								}else{
									day+="<option value='"+d+"' selected='selected'>"+d+"</option>";
								}
							}
						}
					}else{	//剩余月份都是30天
						for(var d=1;d<=30;d++){
							if(new_day_html == null || new_day_html == undefined || new_day_html == ""){
								if(d!=briths[2]){
									day+="<option value='"+d+"'>"+d+"</option>";
								}else{
									day+="<option value='"+d+"' selected='selected'>"+d+"</option>";					
								}
							}else{
								if(d!=new_day){
									day+="<option value='"+d+"'>"+d+"</option>";
								}else{
									day+="<option value='"+d+"' selected='selected'>"+d+"</option>";
								}
							}	
						}
					}
					$("select[name='day']").html(day);
				}
				//执行一次日期获取，用户数据获取做默认值。
				obtain_day();
				//添加值改变事件 当月份值改变时 执行一次日期的获取
				$("select[name='month']").change(obtain_day);
			}
			//生成 所在地下拉框 并做用户已有省市默认值获取设置。
			function obtain_province(){
				/*  */
				var location = "${user_info.location}";
				var locations = location.split("-");
				var city_array = []; //省市数组 二位数组 
				var province = "";	//省份
				city_array[0] = ['北京','东城|西城|崇文|宣武|朝阳|丰台|石景山|海淀|门头沟|房山|通州|顺义|昌平|大兴|平谷|怀柔|密云|延庆'];
				city_array[1] = ['上海','黄浦|卢湾|徐汇|长宁|静安|普陀|闸北|虹口|杨浦|闵行|宝山|嘉定|浦东|金山|松江|青浦|南汇|奉贤|崇明'];
				city_array[2] = ['广东','广州|深圳|珠海|汕头|东莞|中山|佛山|韶关|江门|湛江|茂名|肇庆|惠州|梅州|汕尾|河源|阳江|清远|潮州|揭阳|云浮'];
				city_array[3] = ['天津','和平|东丽|河东|西青|河西|津南|南开|北辰|河北|武清|红挢|塘沽|汉沽|大港|宁河|静海|宝坻|蓟县'];
				city_array[4] = ['重庆','万州|涪陵|渝中|大渡口|江北|沙坪坝|九龙坡|南岸|北碚|万盛|双挢|渝北|巴南|黔江|长寿|綦江|潼南|铜梁|大足|荣昌|壁山|梁平|城口|丰都|垫江|武隆|忠县|开县|云阳|奉节|巫山|巫溪|石柱|秀山|酉阳|彭水|江津|合川|永川|南川'];
				city_array[5] = ['河北','石家庄|邯郸|邢台|保定|张家口|承德|廊坊|唐山|秦皇岛|沧州|衡水'];
				city_array[6] = ['山西','太原|大同|阳泉|长治|晋城|朔州|吕梁|忻州|晋中|临汾|运城'];
				city_array[7] = ['内蒙古','呼和浩特|包头|乌海|赤峰|呼伦贝尔盟|阿拉善盟|哲里木盟|兴安盟|乌兰察布盟|锡林郭勒盟|巴彦淖尔盟|伊克昭盟'];
				city_array[8] = ['辽宁','沈阳|大连|鞍山|抚顺|本溪|丹东|锦州|营口|阜新|辽阳|盘锦|铁岭|朝阳|葫芦岛'];
				city_array[9] = ['吉林','长春|吉林|四平|辽源|通化|白山|松原|白城|延边'];
				city_array[10] = ['黑龙江','哈尔滨|齐齐哈尔|牡丹江|佳木斯|大庆|绥化|鹤岗|鸡西|黑河|双鸭山|伊春|七台河|大兴安岭'];
				city_array[11] = ['江苏','南京|镇江|苏州|南通|扬州|盐城|徐州|连云港|常州|无锡|宿迁|泰州|淮安'];
				city_array[12] = ['浙江','杭州|宁波|温州|嘉兴|湖州|绍兴|金华|衢州|舟山|台州|丽水'];
				city_array[13] = ['安徽','合肥|芜湖|蚌埠|马鞍山|淮北|铜陵|安庆|黄山|滁州|宿州|池州|淮南|巢湖|阜阳|六安|宣城|亳州'];
				city_array[14] = ['福建','福州|厦门|莆田|三明|泉州|漳州|南平|龙岩|宁德'];
				city_array[15] = ['江西','南昌市|景德镇|九江|鹰潭|萍乡|新馀|赣州|吉安|宜春|抚州|上饶'];
				city_array[16] = ['山东','济南|青岛|淄博|枣庄|东营|烟台|潍坊|济宁|泰安|威海|日照|莱芜|临沂|德州|聊城|滨州|菏泽'];
				city_array[17] = ['河南','郑州|开封|洛阳|平顶山|安阳|鹤壁|新乡|焦作|濮阳|许昌|漯河|三门峡|南阳|商丘|信阳|周口|驻马店|济源'];
				city_array[18] = ['湖北','武汉|宜昌|荆州|襄樊|黄石|荆门|黄冈|十堰|恩施|潜江|天门|仙桃|随州|咸宁|孝感|鄂州'];
				city_array[19] = ['湖南','长沙|常德|株洲|湘潭|衡阳|岳阳|邵阳|益阳|娄底|怀化|郴州|永州|湘西|张家界'];
				city_array[20] = ['广西','南宁|柳州|桂林|梧州|北海|防城港|钦州|贵港|玉林|南宁地区|柳州地区|贺州|百色|河池'];
				city_array[21] = ['海南','海口|三亚'];
				city_array[22] = ['四川','成都|绵阳|德阳|自贡|攀枝花|广元|内江|乐山|南充|宜宾|广安|达川|雅安|眉山|甘孜|凉山|泸州'];
				city_array[23] = ['贵州','贵阳|六盘水|遵义|安顺|铜仁|黔西南|毕节|黔东南|黔南'];
				city_array[24] = ['云南','昆明|大理|曲靖|玉溪|昭通|楚雄|红河|文山|思茅|西双版纳|保山|德宏|丽江|怒江|迪庆|临沧'];
				city_array[25] = ['西藏','拉萨|日喀则|山南|林芝|昌都|阿里|那曲'];
				city_array[26] = ['陕西','西安|宝鸡|咸阳|铜川|渭南|延安|榆林|汉中|安康|商洛'];
				city_array[27] = ['甘肃','兰州|嘉峪关|金昌|白银|天水|酒泉|张掖|武威|定西|陇南|平凉|庆阳|临夏|甘南'];
				city_array[28] = ['宁夏','银川|石嘴山|吴忠|固原'];
				city_array[29] = ['青海','西宁|海东|海南|海北|黄南|玉树|果洛|海西'];
				city_array[30] = ['新疆','乌鲁木齐|石河子|克拉玛依|伊犁|巴音郭勒|昌吉|克孜勒苏柯尔克孜|博尔塔拉|吐鲁番|哈密|喀什|和田|阿克苏'];
				city_array[31] = ['香港',''];
				city_array[32] = ['澳门',''];
				city_array[33] = ['台湾','台北|高雄|台中|台南|屏东|南投|云林|新竹|彰化|苗栗|嘉义|花莲|桃园|宜兰|基隆|台东|金门|马祖|澎湖'];
				//生成省份option
				for(var p=0;p<city_array.length;p++){
					if(locations[0]!=city_array[p][0]){
						province+="<option value='"+city_array[p][0]+"' >"+city_array[p][0]+"</ option>";
					}else{
						province+="<option value='"+city_array[p][0]+"' selected='selected'>"+city_array[p][0]+"</ option>";
					}
				}
				$("select[name='province']").append(province);
				//生成市区option
				function obtain_city(){
					//初始化
					var city="";
					//获取用户选择的省份
					var pro_val = $("select[name='province']").val();
					//遍历获取到对应的省份对应的市区
					for(var p=0;p<city_array.length;p++){
						if(pro_val==city_array[p][0]){
							var citys = city_array[p][1].split("|");
							for(var c=0; c<citys.length; c++){
								if(locations[1]!=citys[c]){
									city+="<option value='"+citys[c]+"'>"+citys[c]+"</ option>";
								}else{
									city+="<option value='"+citys[c]+"' selected='selected'>"+citys[c]+"</ option>";
								}
							}
						}
					}
					$("select[name='city']").html(city);
				}
				//执行一次市区获取，用户数据获取做默认值。
				obtain_city();
				//添加值改变事件 当省份值改变时 执行一次市区的获取
				$("select[name='province']").change(obtain_city);
			}
			$(function(){
				//生成日期下拉框
				obtain_brith();
				//生成省市下拉框
				obtain_province();
				$(":button[value='取消']").click(function(){
					window.location.href="/Bear/personal/personal_info.jsp";
				});
			});
		</script>
	</head>
	<body>
		<div class="title">
			账号信息
		</div>
		<div class="acccount">
			<form action="../updInfo" method="get">
				<img src="/Bear/images/pictrue/${user_info.photo}" width="80px" height="80px" class="account-picture"/>
				<table>
					<tr>
						<td width="100px">用户名：</td>
						<td>
							${user.username}
						</td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>
							<c:choose> 
							  	<c:when test="${user_info.sex eq '1'}">    <!--如果 --> 
							  		<input type="radio" name="sex" checked="checked" value="1"/>男
									<input type="radio" name="sex" value="0"/>女
							 	</c:when>      
							    <c:otherwise>  <!--否则 --> 
							    	<input type="radio" name="sex" value="1"/>男
									<input type="radio" name="sex" checked="checked" value="0"/>女
							  	</c:otherwise> 
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>生日：</td>
						<td>
							<select name="year"></select>
							<select name="month"></select>
							<select name="day"></select>
						</td>
					</tr>
					<tr>
						<td>年龄：</td>
						<td>
							<input type="text" name="age" value="${user_info.age}" />
						</td>
					</tr>
					<tr>
						<td>电子邮箱：</td>
						<td>
							<input type="text" name="mail" value="${user_info.mail}" />
						</td>
					</tr>
					<tr>
						<td>手机：</td>
						<td>
							<input type="text" name="phone" value="${user_info.phone}" />
						</td>
					</tr>
					<tr>
						<td>所在地：</td>
						<td>
							<select name="province">
							</select>
							<select name="city">
							</select>
						</td>
					</tr>
					<tr>
						<td>等级：</td>
						<td>
							${user_info.level}
						</td>
					</tr>
					<tr>
						<td>常玩的游戏：</td>
						<td>
							<input type="text" name="games" value="${user_info.games}" />
						</td>
					</tr>
					<tr align="center">
						<td><input type="submit" value="修改" /></td>
						<td><input type="button" value="取消" /></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
