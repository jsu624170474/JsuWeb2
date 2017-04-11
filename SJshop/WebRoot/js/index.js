//首页左侧菜单划过显示效果
$(function(){
	//划过时样式
	$('.admin-nav .active li').hover(function(){
		$(this).addClass('active2');
	},function(){
		$(this).removeClass('active2');
	});
	//点击时样式
	$('.admin-nav .active li').bind('click',function(){
		$('.admin-nav .active li').removeClass('active');
		$(this).addClass('active');
	});
	//商品录入--------[['颜色'],['制式'],[型号]表格
	/*$('.table-btn').on('click',function(){
		$this=$(this);
		$('.rightTable .table').show();
		var fields = $('#rightMain .form-group .field');
		var labels = $('#rightMain .form-group .label');
		var wamp=new Array();
		var inner;
		var aa='';
		for(var i=0;i<fields.length;i++){
			wamp[i]=new Array();
			for(var j=0;j<fields.eq(i).find('input').length;j++){
				
				wamp[i][j]=fields.eq(i).find('input').eq(j).val();
			}
		}
		
		var resultArray = cartesian(wamp,wamp.length-1);
		
		
		
		//拼接出表格的头的代码字符串
		var tableHead = "<tr>";
		for(var i = 0 ; i< labels.length;i++){
			tableHead = tableHead + "<td>" +labels.eq(i).find('label').text()+ "</td>";
		}
		tableHead = tableHead + "<td>价格</td><td>分期价格</td>";
		labels.each(function(index){
			tableHead = tableHead + "<td>" + $(this).find('label').text()+ "</td>";
		});
		tableHead = tableHead + "</tr>";
		//拼接出展示的table的html代码
		var tableHtml = "<table id='propertyTable'>" + tableHead;
		for(var i = 0; i < resultArray.length ; i ++){
			tableHtml = tableHtml + "<tr>";
			for(var j = 0 ; j < resultArray[i].length;j++){
				tableHtml = tableHtml +"<td>"+resultArray[i][j]+"</td>";
			}
			
			
			tableHtml = tableHtml + "<td><div class='form-group'><input data-validate='required:请输入价格' placeholder='输入价格' onchange='calcPrice(this)' onblur='blurCheckInput(this)' type='text'></input></div></td><td></td></tr>";
		}
		tableHtml = tableHtml +"</table>";
		$('.tbody-main').html(tableHtml);
		
		
		//生成笛卡尔积数组
	   function cartesian(arr,l){
			if (l == 0) {
				var tmpArray3 = new Array();
				for ( var j = 0; j < arr[0].length; j++) {
					tmpArray3[j] = new Array();
					tmpArray3[j][0] = arr[0][j];
				}
				return tmpArray3;

			} else if (l >= 2) {
				var tmpArray2 = cartesian(arr, l - 1);
				var tmpArray3 = new Array();
				for ( var j = 0; j < tmpArray2.length; j++) {
					for ( var i = 0; i < arr[l].length; i++) {
						tmpArray3[j * arr[l].length + i] = tmpArray2[j]
								.slice(0);
						tmpArray3[j * arr[l].length + i][tmpArray2[j].length] = arr[l][i];
					}
				}
				return tmpArray3;

			} else {
				var tmpArray = new Array();
				for ( var j = 0; j < arr[0].length; j++) {
					for ( var h = 0; h < arr[1].length; h++) {
						tmpArray[j * arr[1].length + h] = new Array();
						tmpArray[j * arr[1].length + h][0] = arr[0][j];
						tmpArray[j * arr[1].length + h][1] = arr[1][h];
					}
				}
				return tmpArray;
			}

		}
		
	
		
	});*/
	
	
//	/*单张图片上传*/
//	$("#up3").uploadPreview({ Img: "ImgPr3", Width: 90, Height: 80 });
//	$("#up4").uploadPreview({ Img: "ImgPr4", Width: 90, Height: 80 });
//	$("#editup3").uploadPreview({ Img: "editImgPr3", Width: 90, Height: 80 });
//	$("#editup4").uploadPreview({ Img: "editImgPr4", Width: 90, Height: 80 });
	/*上传成功清除提示文字*/
	$('.img-load input').bind('click',function(){
		if (this.value) {
            if (!RegExp("\.(" + opts.ImgType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
                alert("选择文件错误,图片类型必须是" + opts.ImgType.join("，") + "中的一种");
                this.value = "";
                return false;
            }
            //size max 8388608 8M 
            if(this.files[0].size > 8388608){
            	alert("图片太大 ，超过最大限制8M，请重新选择");
            	return false;
            }
            if (navigator.userAgent.indexOf("MSIE") > -1) {
                try {
                    $("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]));
                } catch (e) {
                    var src = "";
                    var obj = $("#" + opts.Img);
                    var div = obj.parent("div")[0];
                    _self.select();
                    if (top != self) {
                        window.parent.document.body.focus();
                    } else {
                        _self.blur();
                    }
                    src = document.selection.createRange().text;
                    document.selection.empty();
                    obj.hide();
                    obj.parent("div").css({
                        'filter': 'progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)',
                        'width': opts.Width + 'px',
                        'height': opts.Height + 'px'
                    });
                    div.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = src;
                }
            } else {
                $("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]));
            }
            opts.Callback();
        }
		
		
		if($(this).next().attr('src')!=''){
			$(this).next().next().html('');
		}
	});
	
	
});