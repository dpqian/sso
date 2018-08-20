<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商铺后台管理系统</title>
<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.1/themes/icon.css" />
<!-- <link rel="stylesheet" type="text/css" href="css/taotao.css" /> -->
<script type="text/javascript"
	src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/mycommon.js"></script> 
</head>
<body class="easyui-layout">
	<div data-options="region:'west',title:'菜单',split:true" style="width:180px;">
		<ul id="menu" class="easyui-tree">
			<li>
				<span>商品管理</span>
					<ul>
						<li data-options="attributes:{'url':'myItem-add'}">新增商品</li>
						<li data-options="attributes:{'url':'myItem-list'}">查询商品</li>
						<li data-options="attributes:{'url':'myItem-param-list'}">规格参数</li>
					</ul>
			</li>
			<li>
				<span>网站内容管理</span>
					<ul>
						<li>内容分类管理</li>
						<li>内容管理</li>
					</ul>
			</li>
		</ul>
	</div>
	<div data-options="region:'center',title:''">
		<div id="tabs" class="easyui-tabs">   
			<div title="首页">
				<a href="javasript:void(0)"
				class="easyui-linkbutton test">选择类目</a> 
				<input name="cid" type="hidden"></input>
			</div>  
		</div>
	</div>
	    

<script type="text/javascript">
	$(function(){
		$('#menu').tree({
			onClick:function(node){
				if($('#menu').tree("isLeaf",node.target)){
					var tabs = $('#tabs');
					var tab = tabs.tabs('getTab',node.text);
						if(tab){
							tabs.tabs('select',node.text);
						}else{
							tabs.tabs('add',{
								title:node.text,
								href:node.attributes.url,
								closable:true,
							    bodyCls:"content"
							});	
						}		
				}
			}
		})
	});
</script>	  
</body>
</html>