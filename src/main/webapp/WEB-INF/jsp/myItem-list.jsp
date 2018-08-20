<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="itemList" title="商品列表"
	data-options="singleSelect:false,collapsible:true,pagination:true,url:'/item/list',method:'get',pageSize:30,toolbar:toolbar">
	<thead>
		<tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'id',width:60">商品ID</th>
			<th data-options="field:'title',width:200">商品标题</th>
			<th data-options="field:'cid',width:100">叶子类目</th>
			<th data-options="field:'sellPoint',width:100">卖点</th>
			<th data-options="field:'price',width:70,align:'right'">价格</th>
			<th data-options="field:'num',width:70,align:'right'">库存数量</th>
			<th data-options="field:'barcode',width:100">条形码</th>
			<th data-options="field:'status',width:60,align:'center'">状态</th>
			<th data-options="field:'created',width:130,align:'center'">创建日期</th>
			<th data-options="field:'updated',width:130,align:'center'">更新日期</th>
		</tr>
	</thead>
</table>
<div id="itemEditWindow" class="easyui-window" title="编辑商品"
	data-options="modal:true,closed:true,iconCls:'icon-save',href:'/rest/page/myItem-edit'",
	style="width: 80%; height: 80%; padding: 10px;"></div>
<script>
	function getSelectIds() {
		var sels = $("#itemList").datagrid("getSelections");
		var ids = [];
		for ( var i in sels) {
			ids.push(sels[i].id);
		}
		ids = ids.join(',');
		return ids;
	}
	var toolbar = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			$(".tree-title:contains('新增商品')").parent().click();
		}
	}, '-', {
		text : '编辑',
		iconCls : 'icon-edit',
		handler : function() {
			var ids = getSelectIds();
			if(ids.length==0){
				$.messager.alert('提示','请选择一个商品','info');
				return;
			}
			if(ids.indexOf(',')>-1){
				$.messager.alert('提示','只能选择一个商品','info');
				return;
			}
			
			$('#itemEditWindow').window({
				onLoad:function(){
					//回显数据
        			var data = $("#itemList").datagrid("getSelections")[0];
        			//data.priceView = TAOTAO.formatPrice(data.price);
        			$("#itemeEditForm").form("load",data);
        			
        			// 加载商品描述
        			$.getJSON('/rest/item/query/item/desc/'+data.id,function(_data){
        				 if(_data.status == 'success'){
        					//UM.getEditor('itemeEditDescEditor').setContent(_data.data.itemDesc, false);
        					itemEditEditor.html(_data.data.itemDesc);
        				}
        				
        			});	
				}
			}).window('open');
		}
	} ];
</script>