package com.taotao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taotao.service.ContentCatgoryService;

import Utils.TaotaoResult;
import pojo.EasyuiTreeNode;

@Controller
@RequestMapping("/content/category")
public class ContentCategoryController {
	@Autowired
	ContentCatgoryService contentCatgoryService;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<EasyuiTreeNode> getContentCategoryList(@RequestParam(value = "id",defaultValue="0") Long parentId){
		List<EasyuiTreeNode> result = contentCatgoryService.getContentCatList(parentId);
		return result;
	}
	
	@RequestMapping("/create")
	@ResponseBody
	public TaotaoResult insertContentCategory(Long parentId, String name){
		TaotaoResult result = contentCatgoryService.insertContentCategory(parentId, name);
		return result;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void deleteContentCategory(Long id){
		contentCatgoryService.deleteContentCategory(id);
	}
}
