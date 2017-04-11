$(function(){
	$('.clickable').on('click',function(){
		var $className = $(this).parent('.oprate-tr').attr('data-class');
		if($(this).find('i').hasClass('click-open')){
			$(this).find('i').removeClass('click-open').addClass('click-close');
			$('.'+$className).removeClass('click-show').addClass('click-hide');
		}else{
			$('.'+$className).removeClass('click-hide').addClass('click-show');
			$('.'+$className).find('.clickable:first').each(function(index,ele){
				if($(this).find('i').hasClass('click-close')){
					var $className2 = $(this).parents('.oprate-tr').attr('data-class');
					$('.'+$className2).removeClass('click-show').addClass('click-hide');
				}
			})
			$(this).find('i').removeClass('click-close').addClass('click-open');
		}
	})
})
