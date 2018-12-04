<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>   
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
String Fordate="";
String Todate="";
try 
{
  Fordate = request.getParameter("Fordate").trim();
 Todate = request.getParameter("Todate").trim();
}
catch (Exception e)
{

}

if(Fordate == null || Fordate.equals("") || Todate == null || Todate.equals("")){
 pageContext.setAttribute("Fordate",formatter.format(date));
pageContext.setAttribute("Todate",formatter.format(date));
}else{
pageContext.setAttribute("Fordate",Fordate);
pageContext.setAttribute("Todate",Todate);
}

 try 
 {
   pageContext.setAttribute("lotteryid",request.getParameter("lotteryid").trim());
 }
catch (Exception e)
{
 
}


String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	
	 	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<%@ include file="../tag.jsp" %>
		<title>${appName}_菜谱分类管理</title>
		<style type="text/css">
			table thead tr th,table tbody tr td{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="javascript:void(0);">菜谱分类管理</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/foodinfotype/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table  table-hover table-bordered">
				<thead>
					<tr>
						<th >id</th>
						<th width="12%">名称</th>
                        <th >英文名</th>
                        <th >logo</th>
						<th >添加时间</th>
                        <th >修改时间</th>
                        <th >parent_id</th>
                        <th width="15%">操作</th>
					</tr>
				</thead>
				<tbody>
                    <c:forEach items="${nameList}" var="item" varStatus="stauts" >
						<tr id="tr${item.id}">
							<%-- <td>${stauts.index+1}</td> --%>
							<td id="${item.id}">${item.id}</td>
							<td id="view" onclick="show(${item.id},1);">${item.name}
							<i class="fa fa-sort-desc fa${item.id}" aria-hidden="true" style="float: right;"></i>
							</td>
							<td>${item.en_name}</td>
							<td>${item.logo}</td>
							<td><fmt:formatDate value="${item.adddate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
							<td><fmt:formatDate value="${item.editdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
							<td>${item.parent_id}</td>
							<td>
						       <a href="<%=basePath%>manage/foodinfotype/add/${item.id}">新增</a> 
				               <a href="<%=basePath%>manage/foodinfotype/${item.id}.html">编辑</a>  
				               <a href="javascript:void(0)" onclick="LW.foodinfotype.delete(${item.id},${item.parent_id})" >删除</a>
				            </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>manage/foodinfotype.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>manage/foodinfotype.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>manage/foodinfotype.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>manage/foodinfotype.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_foodinfotype_list").parent().attr("class","active");
			LW.foodinfotype=new Object();
			LW.foodinfotype.delete=function(id,parent_id)
			{
				if(parent_id==0){
					LW.message.confirm("parent_id","顶级节点不可删除！！！",function(r){LW.location.reload()});
				}else{
					LW.message.confirm("id","此操作会删除该节点级以下的所有子节点，要确定吗？",function(r){if(r){LW.location.forward("manage/foodinfotype/del/"+id+".html");}});
				}
			}
		</script>
    	<%@ include file="../foot.jsp"%>
    	
    	
    	<script type="text/javascript">	
    	//var arr=["└","&nbsp;└","&nbsp;&nbsp;└","&nbsp;&nbsp;&nbsp;└","&nbsp;&nbsp;&nbsp;&nbsp;└","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└"];
		var arr=[];
		var size=10;
		var cc="└";
		var dd="&nbsp;";
			arr[0]="";
			arr[1]=cc;
		for(var i=2;i<=size;i++){
			arr[i]=dd+cc;
			dd+="&nbsp;";
		}
    	
    	function show(id,s){
    		//LW.message.show(id);
			s++;
			//第一次点击时将箭头由下变为上
			/* if($(".fa"+id).hasClass("fa-sort-desc")){
				
			$(".fa"+id).removeClass("fa-sort-desc").addClass("fa-sort-asc");
			} */
			//LW.message.show($(".tr"+id).length);  起始class=".tr"+id的长度为0
			if($(".tr"+id).length>0)
			{
				if($(".tr"+id).is(":visible"))
				{
						//隐藏
						hideDv(id);
						/*  if($("#fa"+id).hasClass("fa-sort-asc")){
						$("#fa"+id).removeClass("fa-sort-asc").addClass("fa-sort-desc");
						}  */
				}else{					
					$(".tr"+id).show();
					 /* if($("#fa"+id).hasClass("fa-sort-desc")){
						$("#fa"+id).removeClass("fa-sort-desc").addClass("fa-sort-asc");
						}  */
					//$("#fa"+id).removeClass("fa-sort-desc").addClass("fa-sort-asc");
				}
			}else{
				$.get("manage/foodinfotype/getByPid/"+id,function(data){
					if(data.status){
	                    var result = "";
	                   
	                    $.each(data.obj,function(n,value){
	                    	
	                       if(value.editdate==null || value.editdate=='' ){
	                    	   value.editdate="无";
	                       }else{
	                    	   value.editdate=new Date(value.editdate).format('yyyy-MM-dd hh:mm:ss');
	                       }
	                       result+="<tr id='tr"+value.id+"' class='tr"+id+"'>";
	                       result+="<td>"+value.id+"</td>"+
	                       "<td onclick='show("+value.id+","+s+");'>"+arr[s]+value.name+
	                       "<i id='fa"+value.id+"'  class='fa fa-sort-desc fa"+id+"' aria-hidden='true' style='float: right;'></i>"+
	                       "</td>"+
	                       "<td>"+value.en_name+"</td>"+
	                       "<td>"+value.logo+"</td>"+
	                       "<td>"+new Date(value.adddate).format('yyyy-MM-dd hh:mm:ss')+"</td>"+
	                       "<td>"+value.editdate+"</td>"+
	                       "<td>"+value.parent_id+"</td>"+
	                       "<td>";
	                       result+= "<a href='<%=basePath%>manage/foodinfotype/add/"+value.id+"'>&nbsp;新增</a>";
	                       result+="<a href='<%=basePath%>manage/foodinfotype/"+value.id+".html'>&nbsp;编辑</a>";
	                       result+="<a href='javascript:void(0)' onclick='LW.foodinfotype.delete("+value.id+","+value.parent_id+")' >&nbsp;删除</a>";
	                       result+="</td>";
	                       result+="</tr>";
	                    });
	                   // $("#test").html('');
	                    $("#tr"+id).after(result);
	                	$.each(data.obj,function(n,value){
							$.get("manage/foodinfotype/getByPid/"+value.id,function(data1){
	                    	    	//LW.message.show(value.id);
	                    		var sj=JSON.parse(data1);
	                    	    if(sj.obj.length==0&&sj.obj==""){
	                    			 //$(".fa"+value.parent_id).removeClass("fa-sort-desc").removeClass("fa-sort-asc"); 
	                    	    	$("#tr"+value.id).find(".fa-sort-desc").removeClass("fa-sort-desc");  
	                    	    } 
	                    	 });
						 });
						
	                	//$("#fa"+id).removeClass("fa-sort-desc").addClass("fa-sort-asc");
	                }
	            },"json"); 
			}
			
			if($("#fa"+id).hasClass("fa-sort-desc")){
				$("#fa"+id).removeClass("fa-sort-desc").addClass("fa-sort-asc");
			}else if($("#fa"+id).hasClass("fa-sort-asc")){
				$("#fa"+id).removeClass("fa-sort-asc").addClass("fa-sort-desc");
			}
		}
		 function hideDv(id) {
		     $(".tr" + id).hide();
			 $(".tr" + id).find(".fa-sort-asc").removeClass("fa-sort-asc").addClass("fa-sort-desc");
		     childDv(id);
		 }
		 function childDv(id) {
		     $(".tr" + id).each(function(){
					var cid = $(this).attr("id").replace("tr", ""); //获取样式id并将tr替换，获取自己的id
					if ($(".tr" + cid).length > 0) {
						$(".tr" + cid).each(function (e) {
							$(".tr" + cid).find(".fa-sort-asc").removeClass("fa-sort-asc").addClass("fa-sort-desc");
							$(this).hide();
							childDv(cid);
						});
					}
				});
		 }
		
		 <!--时间格式化  -->
			Date.prototype.format =function(format)
			  {
			  var o = {
			  "M+" : this.getMonth()+1, //month
			  "d+" : this.getDate(), //day
			  "h+" : this.getHours(), //hour
			  "m+" : this.getMinutes(), //minute
			  "s+" : this.getSeconds(), //second
			  "q+" : Math.floor((this.getMonth()+3)/3), 
			  "S" : this.getMilliseconds() //millisecond
			  }
			  if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
			  (this.getFullYear()+"").substr(4- RegExp.$1.length));
			  for(var k in o)if(new RegExp("("+ k +")").test(format))
			  format = format.replace(RegExp.$1,
			  RegExp.$1.length==1? o[k] :
			  ("00"+ o[k]).substr((""+ o[k]).length));
			  return format;
			  }
		 
		 </script>
		
	</body>
</html>