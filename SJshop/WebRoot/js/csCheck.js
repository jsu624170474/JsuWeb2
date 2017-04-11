$(function(){
    // 导航、二级栏目、 二级栏目内容区域联动
    $(".has-submenu").on('click','a',function(){
        var $this=$(this);
        var $parent=$this.parent();
        if($parent.hasClass('on')){
            $parent.removeClass('on').siblings().removeClass('on');
            $this.next('.sndtit').slideUp();
            $this.find('.roicon').css('transform','rotate(0deg)');
        }else{
            $parent.addClass('on').siblings().removeClass('on');
            $this.next('.sndtit').slideDown();
            $this.find('.roicon').css('transform','rotate(180deg)');
        }
    });


    $(".sndtit li").on('click','a',function(){
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
            if(length <=7){
                //  二级栏目标题
                var liItem=$('<li>'+text+'<i class="iconfont icon-close"></i></li>');
                // 二级栏目内容区域
//                var content=$('<li><iframe src="'+url+'" width="100%" scrolling="no" frameborder="0"></iframe></li>');
                var content=$('<li><iframe src="'+url+'" style="width:100%;height:calc(100vh - 120px);padding:0px;"></iframe></li>');
                // 二级栏目标题添加到头部
                $(".hgroup2").append(liItem);

                $(".conT").append(content);
                /*content.find('iframe').get(0).onload=function(){
                    var ifm= this;
                    var subWeb = ifm.contentDocument;
                    if(ifm != null && subWeb != null) {
                        ifm.height = subWeb.body.scrollHeight;
                    }
                }*/

                //content.load(url);
                liItem.addClass('on').siblings().removeClass('on');
                content.data('text',text).addClass('on').siblings().removeClass('on');
            }else{
                layer.alert('页面数量不能超过8个！');
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
                    $('.hgroup2').children('li').last().trigger('click');
                })
            }
        });
    });

    // 内容区域标题tab切换
    $(".tab").eq(0).css('display','block').siblings('.tab').css('display','none');
    $(".hgroup3").on('click','h4',function(){
        var index =$(this).index();
        $(this).addClass('loanbg').siblings().removeClass('loanbg');
        $(".tab").eq(index).show().siblings('.tab').hide();
    });

    //表单验证
    $('.valid').Validform({
        tiptype:function(msg,o,cssctl){
            var objtip=$("<span class='formTip'></span>");
            switch (o.type){
                case 2:
                    o.obj.css('borderColor','#dfdfdf');
                    o.obj.nextAll('.formTip').remove();
                    break;
                case 3:
                    o.obj.nextAll('.formTip').remove();
                    o.obj.css('borderColor','#f00').after(objtip);
                    break;
            }
            cssctl(objtip,o.type);
            objtip.html("<i class='iconfont icon-warn'></i>"+msg);
        },
        showAllError:false,
    });


    $('#nav').mCustomScrollbar();

    $('.bigpic').viewer({
        url: 'data-original',
    });

});
