package com.taotao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taotao.pojo.TbItem;
import com.taotao.service.PageService;

@Controller
public class PageController {
	
	@Autowired
	PageService PageService;
	
	@RequestMapping("/{page}")
	public String getPage(@PathVariable String page){
		
		return page;
	}
	
	@RequestMapping("/item")
	@ResponseBody
	public TbItem getItem(){
		
		TbItem item = PageService.getItemById(536563);
		return item;
	}
}
