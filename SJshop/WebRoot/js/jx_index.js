$(function(){

    $(".has-submenu").on('click','span',function(){
        var $this=$(this);
        var $parent=$this.parent();
        if($parent.hasClass('on')){
            $parent.removeClass('on').siblings().removeClass('on');
            $this.next('.sndtit').slideUp();
        }else{
            $parent.addClass('on').siblings().removeClass('on');
            $this.next('.sndtit').slideDown();
        }
    });
    

     $(".sndtit p").on('click','a',function(){
        var $this=$(this);
        var text = $(this).text();
        var flag=false;
        var con=false;
        var length = $(".hgroup2 li").length;
        var url = $this.attr('data-href');
        $(".hgroup2 li").each(function(){
            var _this=$(this);
            if(_this.text()==text){
                flag=_this;
            }
        });

        if(flag){
            flag.addClass('on').siblings().removeClass('on');
            $(".conT>li").each(function(){
                var _text=$(this);
                if(_text.data('text')==text){
                    con=_text;
                }
            });
            con.addClass('on').siblings().removeClass('on');
        }else{
            if(length <=4){
                //  二级栏目标题
                var liItem=$('<li>'+text+'<i class="closeBtn"></i></li>');
                // 二级栏目内容区域
                var content=$('<li><div class="panel pl20 pr20 pt20 pb20">'+text+'</div></li>');
                // 二级栏目标题添加到头部
                $(".hgroup2").append(liItem);

                $(".conT").append(content);

                content.load(url);
                liItem.addClass('on').siblings().removeClass('on');
                content.data('text',text).addClass('on').siblings().removeClass('on');
            }else{
                layer.alert('页面数量不能超过5个！');
            }
        }
        $('.titname').removeClass('color');
        $this.parent().addClass('color');

    });

    $('.hgroup2').on('click','li',function(){
        var $this=$(this);
        var $content=$this.text();
        $this.addClass('on').siblings().removeClass('on');
        $('.conT>li').each(function(){
           var _this =$(this);
           var _text=_this.data('text');
            if(_text==$content){
                _this.addClass('on').siblings().removeClass('on');
            }
        });
        $('.titname').each(function(){
            var $titLi =$(this);
            var _thisText = $titLi.text();
            if(_thisText==$content){
                $('.titname').removeClass('color');
                $titLi.addClass('color');
            }
        });
    });

    $('.hgroup2').on('click','i',function(){
        var $this=$(this);
        var $content=$this.parent().text();
        $('.conT>li').each(function(){
            var _this =$(this);
            var _text=_this.data('text');
            if(_text==$content){
                _this.remove();
                $this.parent().remove();
                setTimeout(function(){
                    if($('.hgroup2 li').length==1){
                        $('.titname').removeClass('color');
                    }
                    $('.hgroup2').children('li').last().trigger('click');
                })
            }
        });
    });








});