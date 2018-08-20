
var TAOTAO = TT = {
		// 编辑器参数
		kingEditorParams : {
			//指定上传文件参数名称
			filePostName  : "uploadFile",
			//指定上传文件请求的url。
			uploadJson : '/pic/upload',
			//上传类型，分别为image、flash、media、file
			dir : "image"
		},
		
		init : function(data){
	    	// 初始化选择类目组件
	    	this.initItemCat(data);
	    },
		
	 // 初始化选择类目组件
	    initItemCat : function(data){
	    	$(".selectItemCat").each(function(i,e){
	    		var _ele = $(e);
	    		if(data && data.cid){
	    			_ele.after("<span style='margin-left:10px;'>"+data.cid+"</span>");
	    		}else{
	    			_ele.after("<span style='margin-left:10px;'></span>");
	    		}
	    		_ele.unbind('click').click(function(){
	    			$("<div>").css({padding:"5px"}).html("<ul>")
	    			.window({
	    				width:'500',
	    			    height:"450",
	    			    modal:true,
	    			    closed:true,
	    			    iconCls:'icon-save',
	    			    title:'选择类目',
	    			    onOpen : function(){
	    			    	var _win = this;
	    			    	$("ul",_win).tree({
	    			    		url:'/item/cat/list',
	    			    		animate:true,
	    			    		onClick : function(node){
	    			    			if($(this).tree("isLeaf",node.target)){
	    			    				// 填写到cid中
	    			    				_ele.parent().find("[name=cid]").val(node.id);
	    			    				_ele.next().text(node.text).attr("cid",node.id);
	    			    				$(_win).window('close');
	    			    				if(data && data.fun){
	    			    					data.fun.call(this,node);
	    			    				}
	    			    			}
	    			    		}
	    			    	});
	    			    },
	    			    onClose : function(){
	    			    	$(this).window("destroy");
	    			    }
	    			}).window('open');
	    		});
	    	});
	    },
	    
	//初始化富文本编辑器
	createEditor : function(select) {
		return KindEditor.create(select, TAOTAO.kingEditorParams);
	},
	
	//格式化价格
	formatPrice : function(val,row){
		return (val/1000).toFixed(2);
	},
	
	changeItemParam : function(node,formId){
		$.getJSON('/item/param/query/itemcatid/'+node.id,function(data){
			if(data.status='success' && data.data){
				var paramData = JSON.parse(data.data.paramData);
				var html = '<ul>';
				for(var i in paramData){
					var pi = paramData[i];
					html += '<li><table>';
					html += '<tr><td colspan=\"2\" class=\"group\" align=\"center\">'+pi.group+'</td></tr>';
					for(var j in pi.params){
						var pj = pi.params[j];
						html += '<tr><td class=\"param\">'+pj+'</td><td><input type=\"text\"/></td></tr>';
					}
					html += '</table></li>';
				}
				html += '</ul>';
				$("#"+formId+" .params"+ " td").eq(1).html(html);
				$("#"+formId+" .params").show();
			}else{
				$("#"+formId+" .params").hide();
				$("#"+formId+" .params"+" td").eq(1).empty();
			}
		});
	},
	
	
    createWindow : function(params){
    	$("<div>").css({padding:"5px"}).window({
    		width : params.width?params.width:"80%",
    		height : params.height?params.height:"80%",
    		modal:true,
    		title : params.title?params.title:" ",
    		href : params.url,
		    onClose : function(){
		    	$(this).window("destroy");
		    },
		    onLoad : function(){
		    	if(params.onLoad){
		    		params.onLoad.call(this);
		    	}
		    }
    	}).window("open");
    },
    
 
    
    
	initPicUpload:function(){
		$(".picFileUpload").each(function(i,e){
			$(".picFileUpload").unbind("click").click(function(){
				$("<div>").window({
					width : '500',
					height : "450",
					modal : true,
					//closed : true,
					title : '上传图片',
					content: '<img src="/pic/dog.jpg" />'
				});
			});
		});
		
	}
}

