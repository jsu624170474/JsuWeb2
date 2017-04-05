/*! no_rails_asset_compression */

webpackJsonp([43],{696:function(e,t,a){"use strict"
var r,o,i,m,u
r=a(111).RegexConstants
u=r.VIDEO_UPLOAD.YOUTUBE
m=r.VIDEO_UPLOAD.VIMEO
i=function(e){return u.test(e)?"youtube":m.test(e)?"vimeo":r.VIDEO_UPLOAD.YOUKU.test(e)?"youku":r.VIDEO_UPLOAD.TUDOU.test(e)?"tudou":r.VIDEO_UPLOAD.QQ.test(e)?"qq":""}
o={getVideoType:i,getVideoID:function(e,t){t||(t=i(e))
switch(t){case"youtube":return e.match(u)[1].split("&")[0]
case"vimeo":return e.match(m)[1]}},getSmallYTThumbnail:function(e){return"//img.youtube.com/vi/"+e+"/mqdefault.jpg"},getNormalYTThumbnail:function(e){return"//img.youtube.com/vi/"+e+"/hqdefault.jpg"},getHDYTThumbnail:function(e){return"//img.youtube.com/vi/"+e+"/maxresdefault.jpg"},getYTIFrameHtml:function(e,t,a){var r
null==t&&(t=854)
null==a&&(a=480)
r=e+"_"+(new Date).getTime()
return"<iframe id='"+r+"' src='//www.youtube.com/embed/"+e+"?rel=1&autoplay=1&loop=1&playlist="+e+"&showinfo=0&wmode=transparent&controls=0&enablejsapi=1&origin=' frameborder='0' width='"+t+"' height='"+a+"'></iframe>"},getVimeoIFrameHtml:function(e,t,a){var r
r=e+"_"+(new Date).getTime()
return"<iframe id='"+r+"' src='//player.vimeo.com/video/"+e+"?api=1&player_id="+r+"&autopause=0&autoplay=1&badge=0&loop=1&portrait=0&title=0&origin=' frameborder='0' width='"+t+"' height='"+a+"'></iframe>"},getNormalVideoHtml:function(e,t,a){return"<video src='"+e+"' autoplay='true' muted='true' controls='false' loop='true' width='"+t+"' height='"+a+"'/>"},getVideoHtmlByUrl:function(e,t,a){var r
r=i(e)
switch(r){case"youtube":return o.getYTIFrameHtml(o.getVideoID(e,"youtube"),t,a)
case"vimeo":return o.getVimeoIFrameHtml(o.getVideoID(e,"vimeo"),t,a)
default:return o.getNormalVideoHtml(e,t,a)}},getYouKuHtml:function(e,t,a){var r,o
null==t&&(t=854)
null==a&&(a=480)
r=e.match(/\/id_([^.\/]*)(?:.html)?/)||[]
if(r.length){o=r[1]
return"<iframe width='"+t+"' height='"+a+"' src='//player.youku.com/embed/"+o+"' frameborder=0 allowfullscreen></iframe>"}return""},getTuDouHtml:function(e,t,a){var r,o,i,m
null==t&&(t=854)
null==a&&(a=480)
if(/\/programs\/view\//.test(e)){o=e.match(/\/programs\/view\/([^.\/]*)\//)||[]
i=0}else if(/\/listplay\//.test(e)){o=e.match(/\/listplay\/([^.\/]*)\/([^.\/]*)(?:.html)?/)||[]
i=1}else{if(!/\/albumplay\//.test(e))return""
o=e.match(/\/albumplay\/([^.\/]*)\/([^.\/]*)(?:.html)?/)||[]
i=2}if(o.length){m=""
r=""
switch(o.length){case 3:m=o[2]
r=o[1]
break
case 2:m=o[1]}return"<iframe src='//www.tudou.com/programs/view/html5embed.action?type="+i+"&code="+m+"&lcode="+r+"' width='"+t+"' height='"+a+"' allowtransparency='true' allowfullscreen='true' allowfullscreenInteractive='true' scrolling='no' border='0' frameborder='0'></iframe>"}return""},getQQHtml:function(e,t,a){var r,o,i,m
null==t&&(t=640)
null==a&&(a=498)
r=/v\.qq\.com.*vid=(\w*)$/
o=/v\.qq\.com.*\/page.*\/(\w*)\.html/
m=""
i=e.match(r);(null!=i?i.length:void 0)&&(m=i[1])
i=e.match(o);(null!=i?i.length:void 0)&&(m=i[1])
return m?"<iframe frameborder='0' width='"+t+"' height='"+a+"' src='//v.qq.com/iframe/player.html?vid="+m+"&tiny=0&auto=0' allowfullscreen></iframe>":""},getMoreVideoTypesForFancybox:function(){return{youku:{matcher:/v\.youku\.com\/v_show\/id_([^.\/]*)(?:.html)?/,type:"iframe",url:"//player.youku.com/embed/$1"},tudou1:{matcher:/www\.tudou\.com\/programs\/view\/([^.\/]*)\//,type:"iframe",url:"//www.tudou.com/programs/view/html5embed.action?type=0&code=$1"},tudou2:{matcher:/www\.tudou\.com\/listplay\/([^.\/]*)\/([^.\/]*)(?:.html)?/,type:"iframe",url:"//www.tudou.com/programs/view/html5embed.action?type=1&code=$2&lcode=$1"},tudou3:{matcher:/www\.tudou\.com\/albumplay\/([^.\/]*)\/([^.\/]*)(?:.html)?/,type:"iframe",url:"//www.tudou.com/programs/view/html5embed.action?type=1&code=$2&lcode=$1"}}}}
e.exports=o},710:function(){!function(e){"use strict"
var t=e.fancybox,a=function(t,a,r){r=r||""
"object"===e.type(r)&&(r=e.param(r,!0))
e.each(a,function(e,a){t=t.replace("$"+e,a||"")})
r.length&&(t+=(t.indexOf("?")>0?"&":"?")+r)
return t}
t.helpers.media={defaults:{youtube:{matcher:/(youtube\.com|youtu\.be|youtube-nocookie\.com)\/(watch\?v=|v\/|u\/|embed\/?)?(videoseries\?list=(.*)|[\w-]{11}|\?listType=(.*)&list=(.*)).*/i,params:{autoplay:1,autohide:1,fs:1,rel:0,hd:1,wmode:"opaque",enablejsapi:1},type:"iframe",url:"//www.youtube.com/embed/$3"},vimeo:{matcher:/(?:vimeo(?:pro)?.com)\/(?:[^\d]+)?(\d+)(?:.*)/,params:{autoplay:1,hd:1,show_title:1,show_byline:1,show_portrait:0,fullscreen:1},type:"iframe",url:"//player.vimeo.com/video/$1"},metacafe:{matcher:/metacafe.com\/(?:watch|fplayer)\/([\w\-]{1,10})/,params:{autoPlay:"yes"},type:"swf",url:function(t,a,r){r.swf.flashVars="playerVars="+e.param(a,!0)
return"//www.metacafe.com/fplayer/"+t[1]+"/.swf"}},dailymotion:{matcher:/dailymotion.com\/video\/(.*)\/?(.*)/,params:{additionalInfos:0,autoStart:1},type:"swf",url:"//www.dailymotion.com/swf/video/$1"},twitvid:{matcher:/twitvid\.com\/([a-zA-Z0-9_\-\?\=]+)/i,params:{autoplay:0},type:"iframe",url:"//www.twitvid.com/embed.php?guid=$1"},twitpic:{matcher:/twitpic\.com\/(?!(?:place|photos|events)\/)([a-zA-Z0-9\?\=\-]+)/i,type:"image",url:"//twitpic.com/show/full/$1/"},instagram:{matcher:/(instagr\.am|instagram\.com)\/p\/([a-zA-Z0-9_\-]+)\/?/i,type:"image",url:"//$1/p/$2/media/?size=l"},google_maps:{matcher:/maps\.google\.([a-z]{2,3}(\.[a-z]{2})?)\/(\?ll=|maps\?)(.*)/i,type:"iframe",url:function(e){return"//maps.google."+e[1]+"/"+e[3]+e[4]+"&output="+(e[4].indexOf("layer=c")>0?"svembed":"embed")}}},beforeLoad:function(t,r){var o,i,m,u,l=r.href||"",n=!1
for(o in t)if(t.hasOwnProperty(o)){i=t[o]
m=l.match(i.matcher)
if(m){n=i.type
u=e.extend(!0,{},i.params,r[o]||(e.isPlainObject(t[o])?t[o].params:null))
l="function"===e.type(i.url)?i.url.call(this,m,u,r):a(i.url,m,u)
break}}if(n){r.href=l
r.type=n
r.autoHeight=!1}}}}(jQuery)}})
;
