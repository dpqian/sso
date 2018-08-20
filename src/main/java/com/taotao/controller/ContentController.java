package com.taotao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taotao.pojo.TbContent;
import com.taotao.service.ContentService;

import Utils.TaotaoResult;
import pojo.EasyUIDataGrid;

@Controller
@RequestMapping("/content")
public class ContentController {
	@Autowired
	ContentService contentService;
	
	//根据左边内容分类查询内容列表，分页
	@RequestMapping("/query/list")
	@ResponseBody
	public EasyUIDataGrid getContentList(Long categoryId,int page,int rows){
		EasyUIDataGrid result = contentService.getContentList(categoryId, page, rows);
		return result;
	}
	
	//新增内容
	@RequestMapping("/save")
	@ResponseBody
	public TaotaoResult insertContent(TbContent content){
		return contentService.insertContent(content);
	}
}
