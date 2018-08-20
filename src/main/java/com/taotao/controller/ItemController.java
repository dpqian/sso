package com.taotao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor;

import com.taotao.pojo.TbItem;
import com.taotao.pojo.TbItemCat;
import com.taotao.service.ItemCatService;
import com.taotao.service.ItemService;

import Utils.TaotaoResult;
import pojo.EasyUIDataGrid;
import pojo.EasyuiTreeNode;

@Controller
public class ItemController {
	
	@Autowired
	ItemService itemService;
	@Autowired
	ItemCatService ItemCatService;
	
	//新增商品
	@RequestMapping("/item/save")
	@ResponseBody
	public TaotaoResult addItem(TbItem item,String desc){
		TaotaoResult result = itemService.saveItem(item, desc);
		return result;
	}
	
	//商品列表，分页
	@RequestMapping("/item/list")
	@ResponseBody
	public EasyUIDataGrid getItemList(int page,int rows){
		EasyUIDataGrid result = itemService.getItemList(page, rows);
		return result;
	}
	
	//类目选择
	@RequestMapping("/item/cat/list")
	@ResponseBody
	public List<EasyuiTreeNode> getItemByCid(@RequestParam(value="id",defaultValue="0") long id){
		
		List<EasyuiTreeNode> result = ItemCatService.getItemByCid(id);
		return result;
	}
	
	//编辑商品页面
	@RequestMapping("/rest/page/item-edit")
	public String itemEdit(){
		return "item-edit";
	}
	
	//编辑商品页面2
	@RequestMapping("/rest/page/myItem-edit")
	public String myItemEdit(){
		return "myItem-edit";
	}
	
	//加载商品描述
	@RequestMapping("/rest/item/query/item/desc/{id}")
	@ResponseBody
	public TaotaoResult getItemDesc(@PathVariable long id){
		TaotaoResult result = itemService.getItemDesc(id);
		return result;
	}
	
	
	
}
