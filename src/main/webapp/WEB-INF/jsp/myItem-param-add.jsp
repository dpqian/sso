<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="addItemParamTable">
	<tr>
		<td>商品类目:</td>
		<td><a  href="javasript:void(0)" class="easyui-linkbutton selectItemCat">选择类目</a></td>  
		<td><input name='cid' type="hidden"></td>
	</tr>
	<tr class="addGroupTr">
		<td>规格参数</td>
		<td>
			<ul>
				<li>
					<a href="javasript:void(0)" class="easyui-linkbutton addGroup">添加分组</a>
				</li>
				<!-- <li class="param">
					<ul>
						<li>
							<input class="easyui-textbox" name="group"/>
							<a href="javasript:void(0)" class="easyui-linkbutton addParam"  title="增加" data-options="iconCls:'icon-add'"></a>
						</li>
						<li>
							<span>--------</span><input class="easyui-textbox" name="param"/>
							<a href="javasript:void(0)" class="easyui-linkbutton deleteParam" title="删除" data-options="iconCls:'icon-cancel'"></a>
						</li>
					
					</ul>
				</li> -->
			</ul>
		</td>
	</tr>
</table>
	<div class="addParamFormTemp" style="display:none;">
		<li class="param">
			<ul>
				<li>
					<input class="easyui-textbox" name="group" style="width:180px"/>
					<a href="javasript:void(0)" class="easyui-linkbutton addParam"  title="增加" data-options="iconCls:'icon-add'"></a>
				</li>
				<li>
					<span>--------</span><input class="easyui-textbox" name="param" style="width:180px"/>
					<a href="javasript:void(0)" class="easyui-linkbutton deleteParam" title="删除" data-options="iconCls:'icon-cancel'"></a>
				</li>
			</ul>
		</li>	
	</div>

<script>
	$(function(){
		TAOTAO.init({
			fun : function(node){
				//判断商品分类规格参数时候已经存在
				$.getJSON('/item/param/query/itemcatid'+node.id,function(data){
					if(data.status=='success' && data.data){
						$.messager.alert("商品类别已经添加,请选择其他商品");
						$('.addItemParamTable .selectItemCat').click();
					}
				});
			}
		});
				
		//创建规格参数输入表单
		$('.addGroup').unbind('click').click(function(){
			//增加一行group，一行param
			var temp = $(".addParamFormTemp li").eq(0).clone();
			$(this).parent().parent().append(temp);
			
			//给addParam绑定click,以及新增的deleteParam绑定click
			temp.find(".addParam").click(function(){
				
				//var paramTemp1 = $(this).parent().next().clone(); 问题？
				var paramTemp = $(".addParamFormTemp li").eq(2).clone();
				paramTemp.find(".deleteParam").click(function(){
					$(this).parent().remove();
				});
				$(this).parent().parent().append(paramTemp);		
			});
			//deleteParam绑定click
			temp.find(".deleteParam").click(function(){
				$(this).parent().remove();
			});
		});  
		
		
	});
</script>