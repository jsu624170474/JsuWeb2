function chose(){
	var showFlag = true;
	$(".option").each(function (index, ele) {
		$(ele).click(function (eve) {
			var event = eve || window.event;
			event.stopPropagation();
			if ($(this).hasClass("active")) {
				$(".z-content").prepend($(this));
				quchong($(".z-content"));
				$(this).removeClass("active");
				//getResult();
				
			} else {
				$(".z-box").prepend($(this));
				quchong($(".z-box"));
				$(this).addClass("active");
				
				//getResult();
			}
		});
	});
	$(".z-clickBtn").click(function (eve) {
		var event = eve || window.event;
		event.stopPropagation();
		if (showFlag) {
			$(".z-content").show();
			$(".z-target").addClass("z-changeImage")
		} else {
			$(".z-content").hide();
			$(".z-target").removeClass("z-changeImage");
		}
		showFlag = !showFlag;
	});
	$(document).on("click",function(){
		$(".z-content").hide();
		$(".z-target").removeClass("z-changeImage");
		showFlag = true;
	})

}
	var result = [];
	function getResult(){
		
		//console.log($(".z-box").find("li").html());
		$(".z-box").find("li").each(function (index, ele) {
			result.push($(ele).html().split("<")[0]);
			
		})
		return result;
	}
	function deleteOptions() {
		$(".z-content").find(".option").each(function (index, ele) {
			var $this = $(ele);
			$(".z-box").find(".option").each(function (index, ele) {
				if ($this.html().split("<")[0] == $(ele).html().split("<")[0]) {
					$this.remove();
				}
			})
		})
	}
	function quchong(ele){
		var arr = [];
		ele.find(".option").each(function (index,ele) {
			if(arr.indexOf($.trim($(ele).html().split("<")[0]))==-1){
				arr.push($.trim($(ele).html().split("<")[0]))
			}else{
				$(ele).remove();
			}
		})
	}

