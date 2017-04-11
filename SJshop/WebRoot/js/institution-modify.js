//选择框的显示与隐藏
var showFlag =  true;
$(".click-btn").on("click", function () {
	if(showFlag){
		$(".chose-content").show();
		$(".choseBox").css("backgroundImage","url('img/z-arrow1.png')");
	}else {
		$(".chose-content").hide();
		$(".choseBox").css("backgroundImage","url('img/z-arrow2.png')");
	}
	showFlag = !showFlag;
});

//选择内容的显示
$(".chose-content").find("li").on("click", function () {
	var value = $(this).html();
	$(".choseBox").find("input").val(value);
	$(".chose-content").hide();
	$(".choseBox").css("backgroundImage","url('img/z-arrow2.png')");
	showFlag = true;
});