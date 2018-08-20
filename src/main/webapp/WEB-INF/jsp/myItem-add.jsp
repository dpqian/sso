<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<form id="itemAddForm">
	<table cellpadding="5">
		<tr>
			<td>商品类目:</td>
			<td>
				<a href="javasript:void(0)" class="easyui-linkbutton selectItemCat">选择类目</a> 
				<input type="hidden" name="cid" style="width: 280px;"></input>
			</td>
		<tr>
			<td>商品标题:</td>
			<td>
				<input class="easyui-textbox" type="text" name="title" data-options="required:true">
			</td>
		</tr>
		<tr>
			<td>商品卖点:</td>
			<td>
				<input class="easyui-textbox" name="sellPoint" data-options="multiline:true,validType:'length[0,150]'" style="height: 60px; width: 280px;"></input>
			</td>
		</tr>
		<tr>
			<td>商品价格:</td>
			<td>
				<input class="easyui-numberbox" type="text" name="price"
				data-options="min:1,max:99999999,precision:0,required:true" />
			</td>
		</tr>
		<tr>
			<td>库存数量:</td>
			<td>
				<input class="easyui-numberbox" type="text" name="num"
				data-options="min:1,max:99999999,precision:0,required:true" />
			</td>
		</tr>
		<tr>
			<td>条形码:</td>
			<td>
				<input class="easyui-textbox" type="text" name="barcode"
				data-options="validType:'length[1,30]'" />
			</td>
		</tr>
		<tr>
			<td>商品图片:</td>
			<td>
				<a href="javascript:void(0)"
				class="easyui-linkbutton picFileUpload">上传图片</a>
			</td>
		</tr>
		<tr>
			<td>商品描述:</td>
			<td>
				<textarea style="width: 800px; height: 300px;" name="desc"></textarea>
			</td>
		</tr>
		<tr class="params" style="display:none;">
	        	<td>商品规格:</td>
	        	<td>
	        		<!-- 动态生成商品规格参数 -->	
	        	</td>
	    </tr>
	</table>
	<input type="hidden" name="itemParams"/>
	<div>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onClick="submitForm()">提交</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" onClick="resetForm()">重置</a>
	</div>
</form>

<script>
	var itemAddEditor;
	//页面初始化完毕后执行此方法
	$(function() {
		//创建富文本编辑器
		itemEditEditor = TAOTAO.createEditor("#itemAddForm [name=desc]");
		//初始化类目选择和图片上传器
		TAOTAO.init({
			fun : function(node) {
				//根据商品的分类id取商品 的规格模板，生成规格信息。第四天内容。
				TAOTAO.changeItemParam(node, "itemAddForm");
			}
		});
	});
	function submitForm() {
		//验证表单
		if(!$('#itemAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成');
			return;
		}
		
		$.post("/item/save", $("#itemAddForm").serialize(), function(data) {
			if (data.status == "success")
				alert("添加成功!");
		});
	}
</script>