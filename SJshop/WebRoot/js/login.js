$(function(){
	$('.remember').on('click',function(){
		var $checkBox = $(this).find('em');
		if($checkBox.hasClass('checked')){
			$checkBox.removeClass('checked');
		}else{
			$checkBox.addClass('checked');
		}
	})

	$('.lg1-remember').on('click',function(){
		var $checkBox = $(this).find('em');
		if($checkBox.hasClass('checked')){
			$checkBox.removeClass('checked');
		}else{
			$checkBox.addClass('checked');
		}
	})
	
	$('.lg2-btn').on('mousedown',function(){
		$(this).addClass('focus');
		$('.lg2-btn').on('mouseup',function(){
			$(this).removeClass('focus');
		})
	})

})
