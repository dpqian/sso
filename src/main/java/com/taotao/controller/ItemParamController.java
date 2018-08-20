package com.taotao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taotao.service.ItemParamService;

import Utils.TaotaoResult;
import pojo.EasyUIDataGrid;

@Controller
@RequestMapping("/item/param")
public class ItemParamController {
	
	@Autowired
	ItemParamService itemParamService;
	
	@RequestMapping("/list")
	@ResponseBody
	public EasyUIDataGrid getItemParam(int page,int rows){
		EasyUIDataGrid result = itemParamService.getItemParam(page, rows);
		return result;
	}
	
	@RequestMapping(value="/query/itemcatid/{cid}",method=RequestMethod.GET)
	@ResponseBody
	public TaotaoResult getItemParamByCid(@PathVariable long cid){
		return itemParamService.getItemParamByCid(cid);
	}
	
	//新增商品规格
	@RequestMapping(value="/save/{cid}",method=RequestMethod.POST)
	@ResponseBody
	public TaotaoResult addItemParam(@PathVariable long cid,String paramData){
		TaotaoResult result = itemParamService.addItemParam(cid, paramData);
		return result;
	}
}
