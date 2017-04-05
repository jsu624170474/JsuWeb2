<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0035)http://site-70533-4207-7641.sxl.cn/ -->
<html itemscope="" itemtype="http://schema.org/WebPage" lang="zh"
	xmlns:fb="https://www.facebook.com/2008/fbml"
	xmlns:og="http://ogp.me/ns#" xmlns="http://www.w3.org/1999/xhtml"
	class="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>食品零食</title>
<script type="text/javascript" src="<%=path%>/static/frontSingle/74f55de04c"></script>
<script src="<%=path%>/static/frontSingle/beacon.js" async=""></script>
<script src="<%=path%>/static/frontSingle/nr-1026.min.js"></script>
<script type="text/javascript" async=""
	src="<%=path%>/static/frontSingle/keen-2.1.0-min.js"></script>
<script async="" src="<%=path%>/static/frontSingle/analytics.js"></script>
<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.nr-data.net","errorBeacon":"bam.nr-data.net","licenseKey":"74f55de04c","applicationID":"13304874","transactionName":"IlcLQxBeWFoHShYWSgRKOkQLRVFFTUtRDE4=","queueTime":0,"applicationTime":76,"agent":"","atts":"GhoQFVhKFlgNVkoXWBVRBhVYABgUBE1VD2YUSgkVWBNcQhZIA0wWElERUk8GBANRCxRXC1EPSABUBQUYEUBVTVoPF0dKHw=="}</script>
<script type="text/javascript">window.NREUM||(NREUM={}),__nr_require=function(e,n,t){function r(t){if(!n[t]){var o=n[t]={exports:{}};e[t][0].call(o.exports,function(n){var o=e[t][1][n];return r(o||n)},o,o.exports)}return n[t].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<t.length;o++)r(t[o]);return r}({1:[function(e,n,t){function r(){}function o(e,n,t){return function(){return i(e,[c.now()].concat(u(arguments)),n?null:this,t),n?void 0:this}}var i=e("handle"),a=e(2),u=e(3),f=e("ee").get("tracer"),c=e("loader"),s=NREUM;"undefined"==typeof window.newrelic&&(newrelic=s);var p=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],d="api-",l=d+"ixn-";a(p,function(e,n){s[n]=o(d+n,!0,"api")}),s.addPageAction=o(d+"addPageAction",!0),s.setCurrentRouteName=o(d+"routeName",!0),n.exports=newrelic,s.interaction=function(){return(new r).get()};var m=r.prototype={createTracer:function(e,n){var t={},r=this,o="function"==typeof n;return i(l+"tracer",[c.now(),e,t],r),function(){if(f.emit((o?"":"no-")+"fn-start",[c.now(),r,o],t),o)try{return n.apply(this,arguments)}finally{f.emit("fn-end",[c.now()],t)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(e,n){m[n]=o(l+n)}),newrelic.noticeError=function(e){"string"==typeof e&&(e=new Error(e)),i("err",[e,c.now()])}},{}],2:[function(e,n,t){function r(e,n){var t=[],r="",i=0;for(r in e)o.call(e,r)&&(t[i]=n(r,e[r]),i+=1);return t}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],3:[function(e,n,t){function r(e,n,t){n||(n=0),"undefined"==typeof t&&(t=e?e.length:0);for(var r=-1,o=t-n||0,i=Array(o<0?0:o);++r<o;)i[r]=e[n+r];return i}n.exports=r},{}],4:[function(e,n,t){n.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],ee:[function(e,n,t){function r(){}function o(e){function n(e){return e&&e instanceof r?e:e?f(e,u,i):i()}function t(t,r,o,i){if(!d.aborted||i){e&&e(t,r,o);for(var a=n(o),u=m(t),f=u.length,c=0;c<f;c++)u[c].apply(a,r);var p=s[y[t]];return p&&p.push([b,t,r,a]),a}}function l(e,n){v[e]=m(e).concat(n)}function m(e){return v[e]||[]}function w(e){return p[e]=p[e]||o(t)}function g(e,n){c(e,function(e,t){n=n||"feature",y[t]=n,n in s||(s[n]=[])})}var v={},y={},b={on:l,emit:t,get:w,listeners:m,context:n,buffer:g,abort:a,aborted:!1};return b}function i(){return new r}function a(){(s.api||s.feature)&&(d.aborted=!0,s=d.backlog={})}var u="nr@context",f=e("gos"),c=e(2),s={},p={},d=n.exports=o();d.backlog=s},{}],gos:[function(e,n,t){function r(e,n,t){if(o.call(e,n))return e[n];var r=t();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,n,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[n]=r,r}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],handle:[function(e,n,t){function r(e,n,t,r){o.buffer([e],r),o.emit(e,n,t)}var o=e("ee").get("handle");n.exports=r,r.ee=o},{}],id:[function(e,n,t){function r(e){var n=typeof e;return!e||"object"!==n&&"function"!==n?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");n.exports=r},{}],loader:[function(e,n,t){function r(){if(!x++){var e=h.info=NREUM.info,n=d.getElementsByTagName("script")[0];if(setTimeout(s.abort,3e4),!(e&&e.licenseKey&&e.applicationID&&n))return s.abort();c(y,function(n,t){e[n]||(e[n]=t)}),f("mark",["onload",a()+h.offset],null,"api");var t=d.createElement("script");t.src="https://"+e.agent,n.parentNode.insertBefore(t,n)}}function o(){"complete"===d.readyState&&i()}function i(){f("mark",["domContent",a()+h.offset],null,"api")}function a(){return E.exists&&performance.now?Math.round(performance.now()):(u=Math.max((new Date).getTime(),u))-h.offset}var u=(new Date).getTime(),f=e("handle"),c=e(2),s=e("ee"),p=window,d=p.document,l="addEventListener",m="attachEvent",w=p.XMLHttpRequest,g=w&&w.prototype;NREUM.o={ST:setTimeout,CT:clearTimeout,XHR:w,REQ:p.Request,EV:p.Event,PR:p.Promise,MO:p.MutationObserver};var v=""+location,y={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1026.min.js"},b=w&&g&&g[l]&&!/CriOS/.test(navigator.userAgent),h=n.exports={offset:u,now:a,origin:v,features:{},xhrWrappable:b};e(1),d[l]?(d[l]("DOMContentLoaded",i,!1),p[l]("load",r,!1)):(d[m]("onreadystatechange",o),p[m]("onload",r)),f("mark",["firstbyte",u],null,"api");var x=0,E=e(4)},{}]},{},["loader"]);</script>
<meta
	content="width=device-width,initial-scale=1.0,user-scalable=no,minimum-scale=1.0,maximum-scale=1.0"
	id="viewport" name="viewport">
<script>
//<![CDATA[
window.$S={};$S.global_conf={"premium_apps":["HtmlApp","EcwidApp","MailChimpApp","CeleryApp","LocuApp"],"environment":"production","host_suffix":"sxl.cn","asset_url":"https://assets.sxlcdn.com","locale":"zh-CN","in_china":true,"browser_locale":null,"is_sxl":true,"user_image_cdn":{"qn":"//nzr2ybsda.qnssl.com"},"SEGMENTIO_API_KEY":"xPBGAXEVKOJ7HnZa3w51Q8Mw4plpF7vf","FACEBOOK_APP_ID":null,"WECHAT_APP_ID":"wxaaff643af53f8730","WECHAT_MP_APP_ID":"wx9cffa46c7c73d7ee","KEEN_IO_PROJECT_ID":"56419d00672e6c7537838ab6","KEEN_IO_WRITE_KEY":"b4eaba4d0c664463297ebf0f9a1f22d260fe904d3ce5b6ef6b9888d18f450d61a36572797e9287f91b335a18b1ad1be9bcce1fd52027d7b603c0e9f3a18cd63fa616536a5d1c8a12e031d3988de90b0e159fae59ebe73c99530f3ebd4d50b5ceb8728833b021f74f3f64c4db0829d4c2","FIREBASE_URL":"","CLOUDINARY_CLOUD_NAME":"hrscywv4p","CLOUDINARY_PRESET":"oxbxiyxl","rollout":{"advanced_layouts":true,"new_mobile_actions":true,"background_for_all_sections":false,"product_page":true,"wechat_sharing":true,"new_wechat_oauth":true}};$S.app_instances=[];$S.nav=[{"name":null,"uid":null}];$S.conf={"pages_show_static_path":"https://assets.sxlcdn.com/assets/pages_show_static-c30d27847ccbf939c0bcede1c0857c57.js","keenio_collection":"sxl_pageviews","keenio_collection_sharding":"sxl_pageviews-10900001-11000000","keenio_pbs_impression_collection":"sxl_pbs_impression","keenio_pbs_conversion_collection":"sxl_pbs_conversion","keenio_pageservice_imageshare_collection":"sxl_pageservice_imageshare","keenio_page_socialshare_collection":"sxl_page_socialshare","keenio_page_framing_collection":"sxl_page_framing","keenio_file_download_collection":"sxl_file_download","keenio_ecommerce_buyer_landing":"sxl_ecommerce_buyer_landing","keenio_ecommerce_buyer_viewed_checkout_dialog":"sxl_ecommerce_buyer_viewed_checkout_dialog","keenio_ecommerce_buyer_completed_shipping_address":"sxl_ecommerce_buyer_completed_shipping_address","keenio_ecommerce_buyer_selected_payment_method":"sxl_ecommerce_buyer_selected_payment_method","keenio_ecommerce_buyer_canceled_order":"sxl_ecommerce_buyer_canceled_order","keenio_ecommerce_buyer_added_item_to_cart":"sxl_ecommerce_buyer_added_item_to_cart","is_screenshot_rendering":false,"contact_form_layouts_feature":true,"ecommerce_stripe_alipay":false,"headless_render":null,"wx_instant_follow":false,"is_google_analytics_enabled":true,"is_strikingly_analytics_enabled":true};$S.fonts={"abril fatface":"\"abril fatface\", georgia, serif","great vibes":"\"great vibes\", cursive","parisienne":"parisienne, cursive","dancing script":"\"dancing script\", cursive","lora":"lora, georgia, serif","istok web":"\"istok web\", helvetica, sans-serif","chewy":"chewy, helvetica, sans-serif","trocchi":"trocchi, georgia, serif","quando":"\"quando\", serif","arapey":"arapey, georgia, serif","josefin slab":"\"josefin slab\", georgia, serif","arvo":"arvo, georgia, serif","lato":"lato, helvetica, sans-serif","roboto":"roboto, helvetica, sans-serif","roboto slab":"\"roboto slab\", helvetica, sans-serif","roboto condensed":"\"roboto condensed\", sans-serif","montserrat":"montserrat, helvetica, sans-serif","nunito":"nunito, helvetica, sans-serif","archivo narrow":"\"archivo narrow\", helvetica, sans-serif","cardo":"cardo, georgia, serif","dosis":"dosis, \"terminal dosis\", helvetica, sans-serif","raleway":"raleway, helvetica, sans-serif","playfair display":"\"playfair display\", serif","bitter":"bitter, georgia, serif","vollkorn":"\"vollkorn\", times, georgia, serif","titillium web":"\"titillium web\", titillium, helvetica, sans-serif","old standard tt":"\"old standard tt\", georgia, serif","pt sans narrow":"\"pt sans narrow\", sans-serif","bebas neue":"\"bebas neue\", bebas, helvetica, sans-serif","brandon":"\"brandon grotesque\", brandon, helvetica, sans-serif","tisa":"tisa, georgia, serif","garamond":"garamond, serif","gotham rounded":"\"gotham rounded\", helvetica, sans-serif","arial":"arial, sans-serif","georgia":"georgia, serif","open sans":"\"open sans\", helvetica, sans-serif","source sans pro":"\"source sans pro\", helvetica, sans-serif","work sans":"work sans, helvetica, sans-serif","hei":"\"Open Sans\", \"Lucida Grande\", \"Verdana\", \"Pingfang SC\", \"Pingfang TC\", \"Hiragino Sans GB\", \"Microsoft YaHei\", sans-serif","song":"\"Cardo\", \"STSong\", \"Songti SC\", \"SimSun\", serif","kai":"\"Times New Roman\", STKaiTi, KaiTi, Kaiti_GB2312, serif"};$S.stores={"showStatic":{"footerLogoSeoData":{"anchor_link":"https://www.sxl.cn/?ref=logo\u0026permalink=site-70533-4207-7641\u0026custom_domain=\u0026utm_campaign=footer_pbs\u0026utm_content=http%3A%2F%2Fsite-70533-4207-7641.sxl.cn%2F\u0026utm_medium=user_page\u0026utm_source=footer_logo","anchor_text":"Powered by Strikingly - Best website builder for the mobile age"},"isEditMode":false},"pageData":{"type":"Site","id":"f_229ea673-a40d-4deb-857a-88a0f6d3c528","defaultValue":null,"horizontal":false,"fixedSocialMedia":false,"new_page":true,"showMobileNav":true,"showCookieNotification":false,"showTermsAndConditions":false,"multi_pages":false,"showNav":true,"showFooter":true,"showStrikinglyLogo":false,"showNavigationButtons":false,"showButtons":true,"navFont":"","titleFont":"song","logoFont":"","bodyFont":"hei","headingFont":"song","theme":"fresh","templateVariation":"default","templatePreset":"","termsText":null,"fontPreset":"standard","pages":[{"type":"Page","id":"f_88e06143-493f-425f-aab0-784bd241f8c0","defaultValue":null,"sections":[{"type":"Slide","id":"f_41173422-32f2-42e6-a79c-45d7a0982a8e","defaultValue":true,"template_id":null,"template_name":"media","components":{"slideSettings":{"type":"SlideSettings","id":"f_55d4dc94-a285-4384-8c4a-40f2ed42ad27","defaultValue":false,"show_nav":true,"nameChanged":true,"name":"我们的故事","sync_key":null,"layout_variation":"media-center-text","display_settings":{}},"background1":{"type":"Background","id":"f_7a62db3b-d184-4c84-ad28-8afb70b206f4","defaultValue":true,"url":"","textColor":"light","backgroundVariation":"","sizing":"cover","userClassName":null,"videoUrl":"","videoHtml":"","storageKey":null,"storage":null,"format":null,"h":null,"w":null,"s":null,"noCompression":null},"text1":{"type":"RichText","id":"f_1195af0a-834b-4507-83d0-70de7c68584a","defaultValue":true,"value":"\u003cp style=\"text-align: center; font-size: 160%;\"\u003e我们的故事\u003c/p\u003e","backupValue":"照片和视频","version":1},"text2":{"type":"RichText","id":"f_7b2fa1b2-9602-40c3-a83d-c5646cc504f7","defaultValue":true,"value":"","backupValue":"试试吧","version":1},"repeatable1":{"type":"Repeatable","id":"f_fc47d160-5083-46f6-8512-6238b6fd5c0a","defaultValue":true,"list":[{"type":"RepeatableItem","id":"f_e7594e72-6ad5-4f73-8172-bf028353d571","defaultValue":true,"components":{"media1":{"type":"Media","id":"f_a39eee84-1075-4f92-87ec-63b4f34d8361","defaultValue":true,"video":{"type":"Video","id":"f_e2353011-96c9-4827-9e32-79b3b7a97fe4","defaultValue":true,"html":"","url":"http://vimeo.com/18150336","thumbnail_url":null,"maxwidth":700,"description":null},"image":{"type":"Image","id":"f_59b1578d-27cb-46f6-8143-0981e1a9b841","defaultValue":true,"link_url":"","thumb_url":"!","url":"!","caption":"","description":"","storageKey":"images/24978/FiSjxtT886BhR_XE93aRoxWrAP6z.png","storage":"qn","format":"png","h":260,"w":700,"s":111520,"new_target":true,"noCompression":null},"current":"image"},"text1":{"type":"RichText","id":"f_954c1eb8-32c1-4764-80c1-9a32f5bff908","defaultValue":true,"value":"\u003cp style=\"font-size:80%\"\u003e“保持初心，做最好的烘焙甜品。”\u003c/p\u003e\u003cp style=\"font-size:80%\"\u003e \u003c/p\u003e","backupValue":"标题文本","version":1},"text2":{"type":"RichText","id":"f_754eb91e-699a-4813-9e01-c7a623998c29","defaultValue":true,"value":"","backupValue":null,"version":null},"text3":{"type":"RichText","id":"f_ba575db5-09e9-47c4-a4ec-2d143af161cb","defaultValue":true,"value":"\u003cp\u003eBakery烘焙品牌诞生于2006年的中国上海，\u003c/p\u003e\u003cp\u003e从不起眼的南京东路一家烘焙店开始，以对品质的苛刻与烘焙的热爱。 现成为中国评价最好的烘焙店之一。\u003c/p\u003e\u003cp\u003e \u003c/p\u003e\u003cp\u003e每年，有成百上千的顾客从世界各地而来，只为品尝最好的烘焙美食。\u003c/p\u003e\u003cp\u003e精选上好食材，严格加工程序，我们保证每一个从Bakery产出的糕点都是新鲜美味并且独一无二的。\u003c/p\u003e\u003cp\u003e \u003c/p\u003e\u003cp\u003e \u003c/p\u003e","backupValue":"简介你的产品、功能或项目","version":1},"button1":{"type":"Button","id":null,"defaultValue":true,"text":"","url":"","new_target":null}}}],"components":{"media1":{"type":"Media","id":"f_2a8b983f-973e-418c-8725-f8f75b3b123f","defaultValue":true,"video":{"type":"Video","id":"f_e79991d3-e27c-4237-8f8f-cdbe7bbb18ab","defaultValue":true,"html":"","url":"http://vimeo.com/18150336","thumbnail_url":null,"maxwidth":700,"description":null},"image":{"type":"Image","id":"f_3afd8547-ddd7-4698-8a20-57f9f4b51cc4","defaultValue":true,"link_url":null,"thumb_url":"http://uploads.strikinglycdn.com/static/backgrounds/striking-pack-3/7.jpg","url":"http://uploads.strikinglycdn.com/static/backgrounds/striking-pack-3/7.jpg","caption":"","description":"","storageKey":null,"storage":null,"format":null,"h":null,"w":null,"s":null,"new_target":true,"noCompression":null},"current":"image"},"text1":{"type":"RichText","id":"f_9cca0789-85f7-4b32-99da-5cba2bc3ee88","defaultValue":true,"value":"输入标题","backupValue":null,"version":null},"text2":{"type":"RichText","id":"f_15a8f7f1-d9d5-473c-ab92-605bbb3464e7","defaultValue":true,"value":"","backupValue":null,"version":null},"text3":{"type":"RichText","id":"f_74674320-7f49-42df-bd81-e5d960160ced","defaultValue":true,"value":"简介你的产品、功能或项目","backupValue":null,"version":null}}}}},{"type":"Slide","id":"f_7238c4b7-d44c-41db-9e68-095f4303ea24","defaultValue":null,"template_id":null,"template_name":"rows","components":{"slideSettings":{"type":"SlideSettings","id":"f_e2464c6d-8d93-4767-a13e-10d314e8897b","defaultValue":false,"show_nav":true,"nameChanged":true,"name":"烘焙品类","sync_key":null,"layout_variation":"row-medium1-text-left","display_settings":{}},"background1":{"type":"Background","id":"f_417aad9c-b6c2-4902-9817-ff0dfc7e2097","defaultValue":true,"url":"http://o0m4okv24.qnssl.com/static/backgrounds/striking-pack-2/28.jpg","textColor":"light","backgroundVariation":"","sizing":"cover","userClassName":null,"videoUrl":"","videoHtml":"","storageKey":null,"storage":null,"format":null,"h":null,"w":null,"s":null,"noCompression":null},"text1":{"type":"RichText","id":"f_3cf8337f-dae5-4590-a7e9-850a0fa59f22","defaultValue":true,"value":"\u003cp style=\"text-align: center; font-size: 160%;\"\u003e烘焙品类\u003c/p\u003e","backupValue":"What We Do","version":1},"text2":{"type":"RichText","id":"f_015704f1-8afe-4a06-bb07-7248a71a492c","defaultValue":true,"value":"","backupValue":"Show off your projects, features, or clients in this section.","version":1},"repeatable1":{"type":"Repeatable","id":"f_fb73ba0c-9805-4ded-bc49-c51ac4ce1de6","defaultValue":true,"list":[{"type":"RepeatableItem","id":"f_dcca23d8-6b5e-419d-86c9-95357db3f879","defaultValue":null,"components":{"media1":{"type":"Media","id":"f_3fb85250-ae0f-4ce4-af98-70d74a56baa6","defaultValue":true,"video":{"type":"Video","id":"f_14126a34-6ef4-44e2-bfcf-9da2724a91af","defaultValue":true,"html":"","url":"http://vimeo.com/12236680","thumbnail_url":null,"maxwidth":700,"description":null},"image":{"type":"Image","id":"f_f05b488e-0fc2-4575-9620-eb49682bcd09","defaultValue":true,"link_url":null,"thumb_url":"!","url":"!","caption":"","description":"","storageKey":"images/24978/FioVZGy3Q4nsTfshgUAI1-ZO2WFJ.png","storage":"qn","format":"png","h":460,"w":460,"s":104732,"new_target":true,"noCompression":null},"current":"image"},"text1":{"type":"RichText","id":"f_9552a0b8-7799-4f61-b237-5453ad73267d","defaultValue":true,"value":"\u003cp\u003e甜品\u003c/p\u003e","backupValue":"Title Text","version":1},"text2":{"type":"RichText","id":"f_632b5cf2-8703-4142-9486-28ac4985d611","defaultValue":true,"value":"\u003cp\u003e香浓醇厚，甜而不腻 \u003c/p\u003e","backupValue":"A small tagline","version":1},"text3":{"type":"RichText","id":"f_ce7e829a-f1ca-4446-a9c8-b90ca7c2c66e","defaultValue":true,"value":"\u003cp\u003e甜品的组合非常特别，是由可可豆和坚果组成。这里的花生其实指的就是蛋糕外围米白色的那层酱，而甜饼之间放入了货真价实的香蕉片。外层是可可味道，中间是香蕉蛋糕，内层是香蕉和巧克力酱。不同层次的刺激，不同的味道，不怎么搭的食物如今混合在一起，变成一个不可能的好吃甜饼。\u003c/p\u003e","backupValue":"A sentence or two describing this item. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.","version":1},"button1":{"type":"Button","id":null,"defaultValue":true,"text":"","url":"","new_target":null}}},{"type":"RepeatableItem","id":"f_34d70b8a-1a33-43f2-9e05-5abaa30edc24","defaultValue":null,"components":{"media1":{"type":"Media","id":"f_9bf9c31d-7a30-41b5-bcea-eb491cf85332","defaultValue":true,"video":{"type":"Video","id":"f_738372ad-5f86-4c16-8876-ce83088acb0f","defaultValue":true,"html":"","url":"http://vimeo.com/12236680","thumbnail_url":null,"maxwidth":700,"description":null},"image":{"type":"Image","id":"f_99670034-d210-4d4a-9319-3ee9502f13b1","defaultValue":true,"link_url":null,"thumb_url":"!","url":"!","caption":"","description":"","storageKey":"images/24978/FsxXlGhnBXLubMHWY-pArykS4XWI.png","storage":"qn","format":"png","h":460,"w":460,"s":131940,"new_target":true,"noCompression":null},"current":"image"},"text1":{"type":"RichText","id":"f_5605e745-5065-44b6-9279-01a1db3da09f","defaultValue":true,"value":"\u003cp\u003e面包\u003c/p\u003e","backupValue":"Title Text","version":1},"text2":{"type":"RichText","id":"f_fdccd104-a1b2-46e6-8018-f580f6a8910e","defaultValue":true,"value":"\u003cp\u003e可口多汁，健康美味\u003c/p\u003e","backupValue":"A small tagline","version":1},"text3":{"type":"RichText","id":"f_19976be1-11a6-492f-9400-a1153e1c9ffe","defaultValue":true,"value":"\u003cp\u003e主打面包为全麦面包，采用阳光7*12小时日照，因此麦穗非常饱满。＝肉眼能看到很多麦麸的小粒，质地比较粗糙，有香气。它的营养价值比白面包高，含有丰富粗纤维、维生素E以及锌、钾等矿物质，\u003c/p\u003e","backupValue":"A sentence or two describing this item. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.","version":1},"button1":{"type":"Button","id":null,"defaultValue":true,"text":"","url":"","new_target":null}}},{"type":"RepeatableItem","id":"f_c9c53911-07c1-46eb-a5ee-cde3792abdea","defaultValue":null,"components":{"media1":{"type":"Media","id":"f_c9e5a6a2-165c-4aa9-afcd-050488f79712","defaultValue":true,"video":{"type":"Video","id":"f_738372ad-5f86-4c16-8876-ce83088acb0f","defaultValue":true,"html":"","url":"http://vimeo.com/12236680","thumbnail_url":null,"maxwidth":700,"description":null},"image":{"type":"Image","id":"f_99670034-d210-4d4a-9319-3ee9502f13b1","defaultValue":true,"link_url":null,"thumb_url":"!","url":"!","caption":"","description":"","storageKey":"images/24978/FohB8AGmXpRDEAclj2wwFpE4iPQv.png","storage":"qn","format":"png","h":460,"w":460,"s":138464,"new_target":true,"noCompression":null},"current":"image"},"text1":{"type":"RichText","id":"f_f05f08dc-56cc-478a-abd1-38b0a6e6fc97","defaultValue":true,"value":"\u003cp\u003e蛋糕\u003c/p\u003e","backupValue":"Title Text","version":1},"text2":{"type":"RichText","id":"f_0ed96c31-2b6f-403a-8d18-29399d78bfe0","defaultValue":true,"value":"\u003cp\u003e奶香回味，柔软香甜\u003c/p\u003e","backupValue":"A small tagline","version":1},"text3":{"type":"RichText","id":"f_07537e6f-e948-47ff-9fe8-b4a38d69f36e","defaultValue":true,"value":"\u003cp\u003e底层以蛋白等材料制成，顶层以色彩缤纷的新鲜水果以及奶油作为装饰。蛋糕的口感相当特别，底层的蛋白胚子外脆内滑，外壳的触感是硬邦邦的，其实松松脆脆入口即化，里层是软软的海棉质地，像绵软香甜的棉花糖，再与表层清爽香甜的水果以及冰冷香滑的奶油交融在一起，甜蜜幸福的滋味充斥着你的舌尖！\u003c/p\u003e","backupValue":"A sentence or two describing this item. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.","version":1},"button1":{"type":"Button","id":null,"defaultValue":true,"text":"","url":"","new_target":null}}}],"components":{"media1":{"type":"Media","id":"f_e6942b72-df87-4b3d-ac42-b1b31bc7a8e8","defaultValue":true,"video":{"type":"Video","id":"f_d56e0c6c-b598-4a01-aa26-fd9d99a6a0d3","defaultValue":true,"html":"","url":"http://vimeo.com/12236680","thumbnail_url":null,"maxwidth":700,"description":null},"image":{"type":"Image","id":"f_42b0a7e3-a73c-45be-8a82-edb2172753ec","defaultValue":true,"link_url":null,"thumb_url":"//o0m4okv24.qnssl.com/static/backgrounds/striking-pack-3/7.jpg","url":"//o0m4okv24.qnssl.com/static/backgrounds/striking-pack-3/7.jpg","caption":"","description":"","storageKey":null,"storage":null,"format":null,"h":null,"w":null,"s":null,"new_target":true,"noCompression":null},"current":"image"},"text1":{"type":"RichText","id":"f_7464521f-bb70-44f8-8f8b-6d5c84181caa","defaultValue":true,"value":"Title Text","backupValue":null,"version":null},"text2":{"type":"RichText","id":"f_13af84d8-79cd-41d1-acc8-ce37987d2fcf","defaultValue":true,"value":"A small tagline","backupValue":null,"version":null},"text3":{"type":"RichText","id":"f_86b7a827-ae41-4351-b1d0-69d738b7db57","defaultValue":true,"value":"A sentence or two describing this item. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.","backupValue":null,"version":null}}}}},{"type":"Slide","id":"f_2791b3d3-6179-4d2b-9ff1-4104f8038ec0","defaultValue":true,"template_id":null,"template_name":"ecommerce","components":{"slideSettings":{"type":"SlideSettings","id":"f_7a41336c-8ca7-4e48-899c-00414e2ed029","defaultValue":false,"show_nav":true,"nameChanged":true,"name":"在线预订","sync_key":null,"layout_variation":"card","display_settings":{}},"background1":{"type":"Background","id":"f_17fd335e-f95a-44d6-922b-b8b990af6f60","defaultValue":true,"url":"http://uploads.strikinglycdn.com/static/backgrounds/striking-pack-2/28.jpg","textColor":"light","backgroundVariation":"","sizing":"cover","userClassName":null,"videoUrl":"","videoHtml":"","storageKey":null,"storage":null,"format":null,"h":null,"w":null,"s":null,"noCompression":null},"text1":{"type":"RichText","id":"f_0f023615-e33b-413d-be03-9aee616548d4","defaultValue":true,"value":"\u003cp style=\"text-align: center; font-size: 160%;\"\u003e本周供应\u003c/p\u003e","backupValue":"立即购买","version":1},"text2":{"type":"RichText","id":"f_9b93de8c-15ce-436c-bde4-1890e3bd937d","defaultValue":true,"value":"","backupValue":"查看我们的产品","version":1},"ecommerce1":{"type":"EcommerceComponent","id":"f_bae50e38-47e5-4d76-9550-94acfb21baed","defaultValue":true,"text":null,"category":null}}},{"type":"Slide","id":"f_6e587977-21e3-424d-8445-d6a23cb5d2fa","defaultValue":true,"template_id":null,"template_name":"info","components":{"slideSettings":{"type":"SlideSettings","id":"f_2f9e26df-b411-48bd-95ce-899d44f72696","defaultValue":false,"show_nav":true,"nameChanged":true,"name":"顾客评价","sync_key":null,"layout_variation":"box-two-text","display_settings":{}},"background1":{"type":"Background","id":"f_b4849ec4-fdb9-4fe9-b552-0d8730e503f5","defaultValue":true,"url":"!","textColor":"overlay","backgroundVariation":"","sizing":"cover","userClassName":null,"videoUrl":"","videoHtml":"","storageKey":"images/24978/FpQnG9V2IDv9aDdaT_SiFcKnCe-J.jpg","storage":"qn","format":"jpeg","h":1097,"w":2000,"s":684329,"noCompression":null},"text1":{"type":"RichText","id":"f_48db6d63-942f-4046-8001-8a46474547a1","defaultValue":true,"value":"\u003cp style=\"text-align: center; font-size: 160%;\"\u003e评价\u003c/p\u003e","backupValue":"数据","version":1},"text2":{"type":"RichText","id":"f_ce8fcdc4-a915-4bf5-b175-db7576921122","defaultValue":true,"value":"","backupValue":"让结果证明一切","version":1},"repeatable1":{"type":"Repeatable","id":"f_696d8f11-6201-4cc9-889a-178debd0fa55","defaultValue":true,"list":[{"type":"RepeatableItem","id":"f_71fba64d-11e3-4156-a83b-678590c8164a","defaultValue":true,"components":{"text1":{"type":"RichText","id":"f_582b8c58-732b-4e7d-bb6f-8d7d17a3e614","defaultValue":true,"value":"\u003cp style=\"font-size: 80%; text-align: center;\"\u003e★★★★★\u003c/p\u003e\u003cp style=\"font-size: 80%; text-align: center;\"\u003e“预订到收获一共只用了不到一个小时，配送非常快！”\u003c/p\u003e\u003cp style=\"font-size: 80%; text-align: center;\"\u003e \u003c/p\u003e","backupValue":"两千万","version":1},"text2":{"type":"RichText","id":"f_f230ece6-d05e-4480-92e0-307884d1563c","defaultValue":true,"value":"\u003cp style=\"text-align: center;\"\u003e— Nomo\u003c/p\u003e","backupValue":"用户","version":1},"button1":{"type":"Button","id":null,"defaultValue":true,"text":"","url":"","new_target":null}}},{"type":"RepeatableItem","id":"f_cb29a787-c90b-456f-a375-0fe0d21226e7","defaultValue":true,"components":{"text1":{"type":"RichText","id":"f_7a48bc63-0992-4823-92b1-533b6e0feddf","defaultValue":true,"value":"\u003cp style=\"font-size: 80%; text-align: center;\"\u003e★★★★★\u003c/p\u003e\u003cp style=\"font-size: 80%; text-align: center;\"\u003e“生日首选Cake,女朋友送的芝士蛋糕，甜而不腻，一本满足！”\u003c/p\u003e\u003cp style=\"font-size: 80%; text-align: center;\"\u003e \u003c/p\u003e","backupValue":"一百万元","version":1},"text2":{"type":"RichText","id":"f_e4b45fd5-702b-4295-8131-b4114fcc18cf","defaultValue":true,"value":"\u003cp style=\"text-align:center\"\u003e— DF\u003c/p\u003e","backupValue":"融资金额","version":1},"button1":{"type":"Button","id":null,"defaultValue":true,"text":"","url":"","new_target":null}}},{"type":"RepeatableItem","id":"f_603b6a0c-3ea4-46c1-8fa1-d0c056d7ab0f","defaultValue":null,"components":{"text1":{"type":"RichText","id":"f_714f9c65-4607-4af6-81c8-e80d6eb5ef50","defaultValue":true,"value":"\u003cp style=\"text-align: center; font-size: 80%;\"\u003e★★★★\u003c/p\u003e\u003cp style=\"text-align: center; font-size: 80%;\"\u003e“一直在吃Bakery家的面包，干净好吃，分量很足。”\u003c/p\u003e\u003cp style=\"font-size: 80%; text-align: center;\"\u003e \u003c/p\u003e","backupValue":"一百万元","version":1},"text2":{"type":"RichText","id":"f_6f9c0a2b-e0e9-4801-a560-0aade0c60bb5","defaultValue":true,"value":"\u003cp style=\"text-align: center;\"\u003e— CassyMoss\u003c/p\u003e","backupValue":"融资金额","version":1},"button1":{"type":"Button","id":null,"defaultValue":true,"text":"","url":"","new_target":null}}},{"type":"RepeatableItem","id":"f_d6ce35f4-de28-4f62-9426-27b3d89bd397","defaultValue":null,"components":{"text1":{"type":"RichText","id":"f_415828a9-6542-4c3c-98ad-e8e6eedf314d","defaultValue":true,"value":"\u003cp style=\"font-size: 80%; text-align: center;\"\u003e★★★★★\u003c/p\u003e\u003cp style=\"font-size: 80%; text-align: center;\"\u003e“一家很用心的烘焙店，喜欢的不得了！”\u003c/p\u003e\u003cp style=\"font-size: 80%; text-align: center;\"\u003e \u003c/p\u003e","backupValue":"一百万元","version":1},"text2":{"type":"RichText","id":"f_d6808192-6ed4-4bf5-9e58-733481b3d053","defaultValue":true,"value":"\u003cp style=\"text-align: center;\"\u003e— 萌萌酱\u003c/p\u003e","backupValue":"融资金额","version":1},"button1":{"type":"Button","id":null,"defaultValue":true,"text":"","url":"","new_target":null}}}],"components":{"text1":{"type":"RichText","id":"f_4c8d865c-1e05-480b-93a6-2ebd1b20deb2","defaultValue":true,"value":"500","backupValue":null,"version":null},"text2":{"type":"RichText","id":"f_9c06795d-f94b-4b32-83c6-bd55280de259","defaultValue":true,"value":"客户","backupValue":null,"version":null}}}}},{"type":"Slide","id":"f_e34a6773-ac00-44a8-b31e-7c8607ddd45e","defaultValue":true,"template_id":null,"template_name":"icons","components":{"slideSettings":{"type":"SlideSettings","id":"f_bb7931d0-fbdf-4cd4-9c73-0a4a23c8f056","defaultValue":true,"show_nav":true,"nameChanged":null,"name":"关注我们","sync_key":null,"layout_variation":"col","display_settings":{}},"background1":{"type":"Background","id":"f_02b8c649-dfda-4b8d-bf7c-8eb514f08a20","defaultValue":true,"url":"","textColor":"light","backgroundVariation":"","sizing":"cover","userClassName":null,"videoUrl":"","videoHtml":"","storageKey":null,"storage":null,"format":null,"h":null,"w":null,"s":null,"noCompression":null},"text1":{"type":"RichText","id":"f_4e37ec99-3363-4086-9eb4-393294b703a4","defaultValue":true,"value":"\u003cp style=\"text-align: center; font-size: 160%;\"\u003e关注我们\u003c/p\u003e","backupValue":"联系我们","version":1},"text2":{"type":"RichText","id":"f_6dd0f629-14d8-4ca9-a4c5-1db6aaf642d3","defaultValue":true,"value":"","backupValue":"试试在图标上添加链接","version":1},"repeatable1":{"type":"Repeatable","id":"f_a7d14226-641c-496c-a0d9-8eb42afbeccd","defaultValue":true,"list":[{"type":"RepeatableItem","id":"f_68a9a247-1eaf-42b1-84f1-056debfca8b5","defaultValue":true,"components":{"image1":{"type":"Image","id":"f_35120ec5-b4cd-429d-8373-4501b3eafe6d","defaultValue":true,"link_url":null,"thumb_url":"!","url":"!","caption":"","description":"","storageKey":"images/24978/Fjtf9s36SwCOrNBp_jykAbO9SIRs.png","storage":"qn","format":"png","h":160,"w":160,"s":8307,"new_target":true,"noCompression":null},"text1":{"type":"RichText","id":"f_2360ddbb-7803-4c76-b45d-9786ccc11b52","defaultValue":true,"value":"\u003cp\u003e微信：Bakerycn\u003c/p\u003e","backupValue":"邮箱","version":1}}},{"type":"RepeatableItem","id":"f_c2abc9c1-e812-459a-be85-b0440905c653","defaultValue":true,"components":{"image1":{"type":"Image","id":"f_83806892-91ab-43b7-a43d-00330053bf56","defaultValue":true,"link_url":null,"thumb_url":"!","url":"!","caption":"","description":"","storageKey":"images/24978/FhBsFVIGTTRpRZzaKg0cHQu-dk7e.png","storage":"qn","format":"png","h":160,"w":160,"s":9419,"new_target":true,"noCompression":null},"text1":{"type":"RichText","id":"f_f7683097-5171-43df-b4bb-b6a8e320807b","defaultValue":true,"value":"\u003cp\u003e微博：Bakery\u003c/p\u003e","backupValue":"电话","version":1}}},{"type":"RepeatableItem","id":"f_542fa313-a36b-4479-a7d9-f3fd366f8645","defaultValue":null,"components":{"image1":{"type":"Image","id":"f_d7f553a4-ae5e-47b6-8f6a-10aeeda09023","defaultValue":true,"link_url":null,"thumb_url":"!","url":"!","caption":"","description":"","storageKey":"images/24978/FqbJzrfURRsKRclhneiYCtRxFu3w.png","storage":"qn","format":"png","h":160,"w":160,"s":7094,"new_target":true,"noCompression":null},"text1":{"type":"RichText","id":"f_d879d0c0-a22e-4de9-a675-258a60c66cb8","defaultValue":true,"value":"\u003cp\u003e邮箱：hi@bakery.cn\u003c/p\u003e","backupValue":"电话","version":1}}}],"components":{"image1":{"type":"Image","id":"f_cd3b31b5-2e95-414a-b770-fb85085ed1b0","defaultValue":true,"link_url":null,"thumb_url":null,"url":"//assets.strikingly.com/static/icons/brown/linkedin-icon.png","caption":"","description":"","storageKey":null,"storage":null,"format":null,"h":null,"w":null,"s":null,"new_target":true,"noCompression":null},"text1":{"type":"RichText","id":"f_a21990f3-cfe3-45dc-a843-608895cb501d","defaultValue":true,"value":"添加文字","backupValue":null,"version":null}}}}}],"title":null,"uid":null,"path":null,"autoPath":null}],"menu":{"type":"Menu","id":"f_956db06d-6f9c-48bc-842b-dd8c79865758","defaultValue":null,"template_name":"navbar","logo":null,"components":{"image1":{"type":"Image","id":"f_ce182f6f-646d-4eb9-ae68-4c7fe203e971","defaultValue":false,"link_url":"","thumb_url":"!","url":"!","caption":"","description":"","storageKey":"images/24978/FrjuEuZO0oi68roAAqsLAugu8rZi.png","storage":"qn","format":"png","h":320,"w":320,"s":24221,"new_target":true,"noCompression":null},"image2":{"type":"Image","id":"f_8169accc-5dd1-4c96-9d93-852b0aff2256","defaultValue":true,"link_url":null,"thumb_url":null,"url":"http://assets.strikingly.com/assets/themes/fresh/power.png","caption":"","description":"","storageKey":null,"storage":null,"format":null,"h":null,"w":null,"s":null,"new_target":true,"noCompression":null},"text1":{"type":"RichText","id":"f_4722082d-3a6f-45ee-989f-883de0ad504e","defaultValue":true,"value":"\u003cp style=\"font-size: 80%; text-align: left;\"\u003e\u003cstrong\u003ebakery\u003c/strong\u003e\u003c/p\u003e","backupValue":"Title Text","version":1},"background1":{"type":"Background","id":"f_7729fe28-32bc-423d-a9dd-255797e7c6b2","defaultValue":true,"url":"!","textColor":"overlay","backgroundVariation":"","sizing":"cover","userClassName":null,"videoUrl":null,"videoHtml":"","storageKey":"images/24978/FjmHAYfm8sC9LJ14L3nqDm91cCgT.jpeg","storage":"qn","format":"jpeg","h":2667,"w":4000,"s":655066,"noCompression":null},"text2":{"type":"RichText","id":"f_75159ff0-b5c0-4893-a69f-8957f145a121","defaultValue":true,"value":"\u003cp style=\"font-size: 80%; text-align: left;\"\u003e始于2006年，十年来\u003c/p\u003e\u003cp style=\"font-size: 80%; text-align: left;\"\u003e我们发现、研究烘焙食材，只为做美味新鲜的甜品。\u003c/p\u003e","backupValue":"Subtitle Text","version":1}}},"footer":{"type":"Footer","id":"f_360be991-1dcb-4145-8aee-3ba35b2ad7cb","defaultValue":null,"socialMedia":null,"copyright":null,"components":{"socialMedia":{"type":"SocialMediaList","id":"f_b559b440-26f8-489b-97c8-edae5cc917fd","defaultValue":false,"link_list":[{"type":"LinkedIn","id":"f_96ae70f9-c841-4bb8-bcb0-53c6af954339","defaultValue":null,"url":"","link_url":null,"share_text":null,"show_button":false},{"type":"SinaWeibo","id":"f_a823cfb3-d689-4446-b9a2-3f395d79d654","defaultValue":null,"url":"","link_url":null,"share_text":null,"show_button":true}],"button_list":[{"type":"LinkedIn","id":"f_43fb63ac-3326-4f7e-8e01-9e902ee50951","defaultValue":null,"url":"","link_url":null,"share_text":null,"show_button":false},{"type":"SinaWeibo","id":"f_47756658-f300-4d6e-9250-233d9b3050a4","defaultValue":null,"url":"","link_url":null,"share_text":null,"show_button":true}],"list_type":null},"copyright":{"type":"RichText","id":"f_ab85cb07-d383-4c41-a8bc-d056e07ec02f","defaultValue":false,"value":"\u003cp\u003e© 2016\u003c/p\u003e","backupValue":"© 2015","version":1},"background1":{"type":"Background","id":null,"defaultValue":true,"url":"","textColor":"light","backgroundVariation":"","sizing":"cover","userClassName":null,"videoUrl":"","videoHtml":"","storageKey":null,"storage":null,"format":null,"h":null,"w":null,"s":null,"noCompression":null}},"layout_variation":null},"submenu":{"type":"SubMenu","id":"f_950bde0b-003d-4ba7-b78f-3d514e25cb37","defaultValue":null,"list":[],"components":{"link":{"type":"Button","id":"f_b7313650-3528-47fc-8ad1-d5352da4c7c1","defaultValue":null,"text":"Facebook","url":"http://www.facebook.com","new_target":true}}},"customColors":{"type":"CustomColors","id":"f_a3d02aca-04f9-41d0-b082-d6aa120da2b9","defaultValue":null,"active":false,"highlight1":"#222222","highlight2":null},"navigation":{}},"pageMeta":{"user":{"membership":"reseller","id":70533,"v2_domains":true,"domainSetting":{"canHaveFreeDomain":false,"hasFreeDomain":false,"creditTokens":0,"creditTokenValue":0.0,"entitledToFreeDomain":false}},"category":null,"s4_migration":{"is_migrated":false,"is_retired_theme":false,"has_custom_code":false},"page_groups":[],"slide_names":["我们的故事","烘焙品类","在线预订","顾客评价","关注我们"],"theme":{"name":"onyx_new"},"connected_sites":[],"linkedin_app":false,"is_weitie_page":false,"forced_locale":"zh-CN","mobile_actions":{"phone":null,"sms":null,"location":null,"email":null,"version":"v2","actions":[]},"domain_connection":null,"public_url":"http://site-70533-4207-7641.sxl.cn/","current_path":"/","current_path_params":{},"rollouts":{"custom_code":true,"pro_sections":true,"pro_apps":true,"new_settings_dialog_feature":true,"google_analytics":true,"strikingly_analytics":true,"sections_name_sync":true},"site_mode":"show","google":{"enable_ga_universal":false,"analytics_tracker":null,"analytics_type":null,"site_checker":null},"facebook_pixel_id":null,"baidu_site_verification":null,"optimizely":{"project_id":null,"experiment_id":null},"id":10936003,"permalink":"site-70533-4207-7641","created_at":"2017-02-16T22:50:07.941-08:00","logo_url":"https://assets.sxlcdn.com/images/fb_images/default-sxl.jpg","icon_url":"https://assets.sxlcdn.com/images/favicon-sxl.ico","description":null,"name":"食品零食","social_media_config":{"url":"http://site-70533-4207-7641.sxl.cn/","title":"食品零食","image":"https://assets.sxlcdn.com/images/fb_images/default-sxl.jpg","description":null,"fb_app_id":null},"keenio_config":{"keenio_project_id":"56419d00672e6c7537838ab6","keenio_write_key":"b4eaba4d0c664463297ebf0f9a1f22d260fe904d3ce5b6ef6b9888d18f450d61a36572797e9287f91b335a18b1ad1be9bcce1fd52027d7b603c0e9f3a18cd63fa616536a5d1c8a12e031d3988de90b0e159fae59ebe73c99530f3ebd4d50b5ceb8728833b021f74f3f64c4db0829d4c2"},"show_strikingly_logo":false,"show_navigation_buttons":false,"social_media":null,"has_optimizely":false,"optimizely_experiment_id":null,"services":[],"strk_upvt":"Rk1xVzZjQlFpQzVPTERMUkkrWVAvRnowYW9nOW0wN2ZiODk1MHNEL2lXSW9OcHZxbTI1S1hrVFJ5dUZaTW9sRGkvVlBHNDhQSEV5UVptSnh3aWJEdVh5dm1sdDNBSUIzL3c2TzdwWGgxdXZmT3VSc1JCY0NOQUNReHdYbFVHSmtzUmc0V1JMdWlad2hwaUR4ZDF6TXU3Ujg5L25SU3p4SlVZeHJ0cDJsMlN3PS0tT1VoMStZTUN6SGFxcXBkSVY3ZG1CQT09--de69d2542b24174c67d34701c166e854063fab4f","strk_ga_tracker":"UA-25124444-14","google_analytics_tracker":null,"google_analytics_type":null,"exception_tracking":true,"ecommerce":{"seller_wechat_app_id":null}}};$S.blink={"page":{"logo_url":"https://assets.sxlcdn.com/images/fb_images/default-sxl.jpg","weitie_url":"http://site-70533-4207-7641.weitie.co","description":null,"name":"食品零食"},"conf":{"WECHAT_APP_ID":"someidthatisnotexist..."}};
//]]>
</script>
<link rel="stylesheet" media="screen"
	href="<%=path%>/static/frontSingle/_reset-ce75619b7efeb96917d87c8f79266429.css">
<link rel="stylesheet" media="screen"
	href="<%=path%>/static/frontSingle/main_v4-3b82efc4efb9aa060cf736cec1eaf567.css">
<!--[if lte IE 9]><link rel="stylesheet" media="screen" href="https://assets.sxlcdn.com/assets/themes/onyx_new/main_v4_split2-50d4a0fc8e53da8223d7f74121e1720f.css"/><![endif]-->
<link href="https://assets.sxlcdn.com/images/favicon-sxl.ico"
	rel="shortcut icon" type="image/x-icon">
<link href="<%=path%>/static/frontSingle/default-sxl.jpg" rel="apple-touch-icon"
	sizes="60x60">
<link href="<%=path%>/static/frontSingle/default-sxl.jpg" rel="apple-touch-icon"
	sizes="76x76">
<link href="<%=path%>/static/frontSingle/default-sxl.jpg" rel="apple-touch-icon"
	sizes="120x120">
<link href="<%=path%>/static/frontSingle/default-sxl.jpg" rel="apple-touch-icon"
	sizes="152x152">
<meta content="食品零食" property="og:title">
<meta content="http://site-70533-4207-7641.sxl.cn/" property="og:url">
<meta
	content="https://assets.sxlcdn.com/images/fb_images/default-sxl.jpg"
	property="og:image">
<meta content="食品零食" property="og:site_name">
<meta property="og:description">
<meta content="食品零食" itemprop="name">
<meta itemprop="description">
<meta
	content="https://assets.sxlcdn.com/images/fb_images/default-sxl.jpg"
	itemprop="image">
<meta content="summary" name="twitter:card">
<meta content="食品零食" name="twitter:title">
<meta content="" name="twitter:description">
<meta
	content="https://assets.sxlcdn.com/images/fb_images/default-sxl.jpg"
	name="twitter:image">
<meta name="description">
<meta name="keywords">
<meta name="support-helper"
	content="{&quot;permalink&quot;:&quot;site-70533-4207-7641&quot;,&quot;id&quot;:10936003}">
<link rel="canonical" href="<%=path%>/static/frontSingle/食品零食.html">
<link href="https://assets.sxlcdn.com/images/favicon-sxl.ico"
	rel="shortcut icon" type="image/x-icon">
<meta name="asset-url" content="https://assets.sxlcdn.com">
<!--[if lte IE 10]><link rel="stylesheet" media="screen" href="https://assets.sxlcdn.com/assets/ie8-28ce32e2165721a27540385b577eebf5.css"/><![endif]-->
<noscript>&lt;style&gt; .s-entrance-mask .s-section
	.container { opacity: 1 !important; } &lt;/style&gt;</noscript>
<script>
var _gaq = _gaq || [];
if ($S.stores.pageMeta.exception_tracking) {
/* load errorception */
var _errs=["56557d16455c179b7c00004f"];(function(a,b){a.onerror=function(){_errs.push(arguments)};
var d=function(){var a=b.createElement("script"),c=b.getElementsByTagName("script")[0];
a.src="//d15qhc0lu1ghnk.cloudfront.net/beacon.js";a.async=!0;
c.parentNode.insertBefore(a,c)};a.addEventListener?a.addEventListener("load",d,!1):
a.attachEvent("onload",d)})(window,document);
}

// Google Analytics (Universal) Setup
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','__ga');

// configuration for keen.io
var Keen=Keen||{configure:function(e){this._cf=e},addEvent:function(e,t,n,i){this._eq=this._eq||[],this._eq.push([e,t,n,i])},setGlobalProperties:function(e){this._gp=e},onChartsReady:function(e){this._ocrq=this._ocrq||[],this._ocrq.push(e)}};(function(){var e=document.createElement("script");e.type="text/javascript",e.async=!0,e.src=("https:"==document.location.protocol?"https://":"http://")+"dc8na2hxrj29i.cloudfront.net/code/keen-2.1.0-min.js";var t=document.getElementsByTagName("script")[0];t.parentNode.insertBefore(e,t)})();
// Configure the Keen object with your Project ID and (optional) access keys.
Keen.configure({
projectId: $S.global_conf.KEEN_IO_PROJECT_ID,
writeKey: $S.global_conf.KEEN_IO_WRITE_KEY
});

var _strk = _strk || []
window.runAfterDomBinding = {
  add: function(name, fn) {
    _strk.push(['Page.didMount', fn])
  }
}

window.strkHooks = {
  subscribe: function(eventName, cb) {
    _strk.push([eventName, cb])
  }
}


</script>
<script>
  (function() {
    window.$B || (window.$B = {});
  
  }).call(this);
</script>
<script src="<%=path%>/static/frontSingle/detectIE-aeae2c759789800f5aca28184189c731.js"
	async="async"></script>
<script type="text/javascript" charset="utf-8" async=""
	src="<%=path%>/static/frontSingle/15.06d61ce8d88e0e1e5f6c-site-bundle.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	src="<%=path%>/static/frontSingle/5.06d61ce8d88e0e1e5f6c-site-bundle.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	src="<%=path%>/static/frontSingle/34.06d61ce8d88e0e1e5f6c-site-bundle.js"></script>
<style type="text/css"></style>
<script type="text/javascript" charset="utf-8" async=""
	src="<%=path%>/static/frontSingle/26.06d61ce8d88e0e1e5f6c-site-bundle.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	src="<%=path%>/static/frontSingle/43.06d61ce8d88e0e1e5f6c-site-bundle.js"></script>
<style type="text/css">
.fancybox-margin {
	margin-right: 0px;
}
</style>
</head>
<body class="show locale-zh-CN" id="user_sites" ontouchstart=""
	screen_capture_injected="true">
	<div id="s-page-container">
		<div data-reactroot="">
			<!-- react-empty: 2 -->
			<div id="s-content"
				class="s-variation-default s-font-heading-song s-font-title-song s-font-body-hei">
				<div class="social-thumbnail">
					<div style="display: none;">
						<img src="<%=path%>/static/frontSingle/default-sxl.jpg" alt="page thumbnail"
							width="300" height="300">
					</div>
					<div id="lw-share-data" style="display: none;">
						<div class="lws-title">食品零食</div>
						<div class="lws-description">Website</div>
						<div class="lws-image">https://assets.sxlcdn.com/images/fb_images/default-sxl.jpg</div>
					</div>
				</div>
				<div
					class="s-bg-image s-bg-light-text s-bg-overlay navigator s-navbar-section s-section transition"
					style="background-image: url(&quot;//nzr2ybsda.qnssl.com/images/24978/FjmHAYfm8sC9LJ14L3nqDm91cCgT.jpeg?imageMogr2/strip/thumbnail/2000x1500&gt;/quality/90!/interlace/1/format/jpeg&quot;); background-color: transparent; background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;">
					<div class="container">
						<div class="columns sixteen">
							<div class="impression">
								<div class="left">
									<div class="s-onyxnew-logo">
										<div class="s-component s-image">
											<span><div class="s-component-content">
													<div>
														<!-- react-text: 21 -->
														<!-- /react-text -->
														<img src="<%=path%>/static/frontSingle/FrjuEuZO0oi68roAAqsLAugu8rZi.png"
															alt="" title="" data-description="">
														<!-- react-text: 23 -->
														<!-- /react-text -->
													</div>
												</div></span>
										</div>
									</div>
								</div>
								<div class="right">
									<div class="vcenter">
										<div class="header-title">
											<div class="s-component s-text">
												<h1 class="s-component-content s-font-title">
													<p style="font-size: 80%; text-align: left;">
														<strong>bakery</strong>
													</p>
												</h1>
											</div>
										</div>
										<div class="header-subtitle">
											<div class="s-component s-text">
												<h3 class="s-component-content s-font-heading">
													<p style="font-size: 80%; text-align: left;">始于2006年，十年来</p>
													<p style="font-size: 80%; text-align: left;">我们发现、研究烘焙食材，只为做美味新鲜的甜品。</p>
												</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="columns sixteen">
							<div id="s-nav-placeholder" class="s-nav"
								style="height: 44px; display: block;"></div>
							<div class="s-nav strikingly-fixed fixed" id="s-nav"
								style="display: block; top: 0px;">
								<ul class="ib items s-nav">
									<li><a class="s-font-body s-nav-item"
										href="http://site-70533-4207-7641.sxl.cn/#_1">我们的故事</a></li>
									<li><a class="s-font-body s-nav-item selected"
										href="http://site-70533-4207-7641.sxl.cn/#_2">烘焙品类</a></li>
									<li><a class="s-font-body s-nav-item"
										href="http://site-70533-4207-7641.sxl.cn/#_3">在线预订</a></li>
									<li><a class="s-font-body s-nav-item"
										href="http://site-70533-4207-7641.sxl.cn/#_4">顾客评价</a></li>
									<li><a class="s-font-body s-nav-item"
										href="http://site-70533-4207-7641.sxl.cn/#_5">关注我们</a></li>
									<li id="s-ecommerce-nav-shopping-cart-wrapper"
										class="s-ecommerce-nav-shopping-cart-wrapper hidden">
										<!-- react-empty: 1 -->
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="s-navbar-container">
					<div class="navbar-drawer-bar strikingly-nav-transition">
						<div class="drawer-container">
							<a class="navbar" href="javascript:void(0);"><div
									class="navbar-icons">
									<span></span><span></span><span></span>
								</div></a>
							<div id="s-mobile-shopping-cart-new">
								<!-- react-empty: 1 -->
							</div>
							<div class="navbar-drawer-title-container"></div>
						</div>
					</div>
					<div id="navbar-drawer-mask"></div>
					<div
						class="navbar-drawer strikingly-drawer strikingly-nav-transition">
						<ul id="nav-drawer-list">
							<span><li><a class="navbar-drawer-item s-font-body"
									href="http://site-70533-4207-7641.sxl.cn/#1">我们的故事</a></li></span>
							<span><li><a
									class="navbar-drawer-item s-font-body selected"
									href="http://site-70533-4207-7641.sxl.cn/#2">烘焙品类</a></li></span>
							<span><li><a class="navbar-drawer-item s-font-body"
									href="http://site-70533-4207-7641.sxl.cn/#3">在线预订</a></li></span>
							<span><li><a class="navbar-drawer-item s-font-body"
									href="http://site-70533-4207-7641.sxl.cn/#4">顾客评价</a></li></span>
							<span><li><a class="navbar-drawer-item s-font-body"
									href="http://site-70533-4207-7641.sxl.cn/#5">关注我们</a></li></span>
						</ul>
					</div>
					<div class="mobile-actions strikingly-nav-transition"
						style="height: 172px;">
						<ul id="mobile-action-list">
							<!-- react-empty: 77 -->
						</ul>
					</div>
				</div>
				<div class="page-wrapper">
					<ul class="slides s-page-1" style="display: block;">
						<li class="slide s-section-1"
							id="section-f_41173422-32f2-42e6-a79c-45d7a0982a8e"><div
								class="waypoint"></div>
							<a class="section-anchor"></a>
						<div>
								<!-- react-text: 84 -->
								<!-- /react-text -->
								<div
									class="s-new-media-section s-section s-media-section transition collapse-bottom-padding">
									<div class="container">
										<div class="columns sixteen">
											<div class="s-title-group  ">
												<div class="s-title sb-title-center-align">
													<div class="s-component s-text">
														<h1 class="s-component-content s-font-title">
															<p style="text-align: center; font-size: 160%;">我们的故事</p>
														</h1>
													</div>
												</div>
											</div>
										</div>
										<!-- react-text: 92 -->
										<!-- /react-text -->
										<div class="s-mh s-layout-normal s-repeatable">
											<div>
												<div data-sorting-index="0"
													class="s-repeatable-item s-last-row">
													<div class="clearfix">
														<div class="sixteen columns  center">
															<div class="s-item-media-wrapper s-mhi ">
																<div class="s-item-media-group">
																	<div class="s-component s-media ">
																		<span><div class="s-component-content">
																				<div>
																					<!-- react-text: 104 -->
																					<!-- /react-text -->
																					<img
																						src="<%=path%>/static/frontSingle/FiSjxtT886BhR_XE93aRoxWrAP6z.png"
																						alt="" title="" data-description="">
																					<!-- react-text: 106 -->
																					<!-- /react-text -->
																				</div>
																			</div></span>
																	</div>
																</div>
															</div>
															<div class="">
																<div class="s-item-text-group ">
																	<div class="s-item-title">
																		<div class="s-component s-text">
																			<h3 class="s-component-content s-font-heading">
																				<p style="font-size: 80%">“保持初心，做最好的烘焙甜品。”</p>
																				<p style="font-size: 80%">&nbsp;</p>
																			</h3>
																		</div>
																	</div>
																	<div class="s-item-text">
																		<div class="s-component s-text">
																			<div class="s-component-content s-font-body">
																				<p>Bakery烘焙品牌诞生于2006年的中国上海，</p>
																				<p>从不起眼的南京东路一家烘焙店开始，以对品质的苛刻与烘焙的热爱。
																					现成为中国评价最好的烘焙店之一。</p>
																				<p>&nbsp;</p>
																				<p>每年，有成百上千的顾客从世界各地而来，只为品尝最好的烘焙美食。</p>
																				<p>精选上好食材，严格加工程序，我们保证每一个从Bakery产出的糕点都是新鲜美味并且独一无二的。</p>
																				<p>&nbsp;</p>
																				<p>&nbsp;</p>
																			</div>
																		</div>
																	</div>
																	<div class=""></div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- react-text: 116 -->
										<!-- /react-text -->
									</div>
								</div>
								<!-- react-text: 117 -->
								<!-- /react-text -->
							</div></li>
						<li class="slide s-section-2"
							id="section-f_7238c4b7-d44c-41db-9e68-095f4303ea24"><div
								class="waypoint"></div>
							<a class="section-anchor"></a>
						<div>
								<!-- react-text: 122 -->
								<!-- /react-text -->
								<div
									class="s-new-media-section s-section s-rows-section transition collapse-bottom-padding">
									<div class="container">
										<div class="columns sixteen">
											<div class="s-title-group">
												<div class="s-title sb-title-center-align">
													<div class="s-component s-text">
														<h2 class="s-component-content s-font-title">
															<p style="text-align: center; font-size: 160%;">烘焙品类</p>
														</h2>
													</div>
												</div>
											</div>
										</div>
										<!-- react-text: 130 -->
										<!-- /react-text -->
										<div class="s-media-left s-layout-mediaLeft s-repeatable">
											<div>
												<div data-sorting-index="0" class="s-repeatable-item">
													<div class="clearfix">
														<div class="">
															<div
																class="s-item-media-wrapper six columns  s-left-in-row">
																<div class="s-item-media-group">
																	<div class="s-component s-media ">
																		<span><div class="s-component-content">
																				<div>
																					<!-- react-text: 142 -->
																					<!-- /react-text -->
																					<div class="s-ratio-box"
																						style="max-width: 460px; max-height: 460px;">
																						<div class="s-ratio-fill"
																							style="padding-bottom: 100%;"></div>
																						<div>
																							<img alt="" title="" data-description=""
																								width="460" height="460"
																								src="<%=path%>/static/frontSingle/FioVZGy3Q4nsTfshgUAI1-ZO2WFJ.png"
																								class="lazyautosizes lazyloaded"
																								data-src="//nzr2ybsda.qnssl.com/images/24978/FioVZGy3Q4nsTfshgUAI1-ZO2WFJ.png?imageMogr2/strip/thumbnail/720x1440&gt;/quality/90!/format/png"
																								data-sizes="auto" sizes="228px">
																						</div>
																					</div>
																					<!-- react-text: 147 -->
																					<!-- /react-text -->
																				</div>
																			</div></span>
																	</div>
																</div>
															</div>
															<div class="ten columns s-right-in-row">
																<div class="s-item-text-group half-offset-left">
																	<div class="s-item-title">
																		<div class="s-component s-text">
																			<h3 class="s-component-content s-font-heading">
																				<p>甜品</p>
																			</h3>
																		</div>
																	</div>
																	<div class="s-item-subtitle">
																		<div class="s-component s-text">
																			<h6 class="s-component-content s-font-body">
																				<p>香浓醇厚，甜而不腻</p>
																			</h6>
																		</div>
																	</div>
																	<div class="s-item-text">
																		<div class="s-component s-text">
																			<div class="s-component-content s-font-body">
																				<p>甜品的组合非常特别，是由可可豆和坚果组成。这里的花生其实指的就是蛋糕外围米白色的那层酱，而甜饼之间放入了货真价实的香蕉片。外层是可可味道，中间是香蕉蛋糕，内层是香蕉和巧克力酱。不同层次的刺激，不同的味道，不怎么搭的食物如今混合在一起，变成一个不可能的好吃甜饼。</p>
																			</div>
																		</div>
																	</div>
																	<div class=""></div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div data-sorting-index="1" class="s-repeatable-item">
													<div class="clearfix">
														<div class="">
															<div
																class="s-item-media-wrapper six columns  s-left-in-row">
																<div class="s-item-media-group">
																	<div class="s-component s-media ">
																		<span><div class="s-component-content">
																				<div>
																					<!-- react-text: 169 -->
																					<!-- /react-text -->
																					<div class="s-ratio-box"
																						style="max-width: 460px; max-height: 460px;">
																						<div class="s-ratio-fill"
																							style="padding-bottom: 100%;"></div>
																						<div>
																							<img alt="" title="" data-description=""
																								width="460" height="460"
																								src="<%=path%>/static/frontSingle/FsxXlGhnBXLubMHWY-pArykS4XWI.png"
																								class="lazyautosizes lazyloaded "
																								data-src="//nzr2ybsda.qnssl.com/images/24978/FsxXlGhnBXLubMHWY-pArykS4XWI.png?imageMogr2/strip/thumbnail/720x1440&gt;/quality/90!/format/png"
																								data-sizes="auto" sizes="228px">
																						</div>
																					</div>
																					<!-- react-text: 174 -->
																					<!-- /react-text -->
																				</div>
																			</div></span>
																	</div>
																</div>
															</div>
															<div class="ten columns s-right-in-row">
																<div class="s-item-text-group half-offset-left">
																	<div class="s-item-title">
																		<div class="s-component s-text">
																			<h3 class="s-component-content s-font-heading">
																				<p>面包</p>
																			</h3>
																		</div>
																	</div>
																	<div class="s-item-subtitle">
																		<div class="s-component s-text">
																			<h6 class="s-component-content s-font-body">
																				<p>可口多汁，健康美味</p>
																			</h6>
																		</div>
																	</div>
																	<div class="s-item-text">
																		<div class="s-component s-text">
																			<div class="s-component-content s-font-body">
																				<p>主打面包为全麦面包，采用阳光7*12小时日照，因此麦穗非常饱满。＝肉眼能看到很多麦麸的小粒，质地比较粗糙，有香气。它的营养价值比白面包高，含有丰富粗纤维、维生素E以及锌、钾等矿物质，</p>
																			</div>
																		</div>
																	</div>
																	<div class=""></div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div data-sorting-index="2"
													class="s-repeatable-item s-last-row">
													<div class="clearfix">
														<div class="">
															<div
																class="s-item-media-wrapper six columns  s-left-in-row">
																<div class="s-item-media-group">
																	<div class="s-component s-media ">
																		<span><div class="s-component-content">
																				<div>
																					<!-- react-text: 196 -->
																					<!-- /react-text -->
																					<div class="s-ratio-box"
																						style="max-width: 460px; max-height: 460px;">
																						<div class="s-ratio-fill"
																							style="padding-bottom: 100%;"></div>
																						<div>
																							<img alt="" title="" data-description=""
																								width="460" height="460"
																								src="<%=path%>/static/frontSingle/FohB8AGmXpRDEAclj2wwFpE4iPQv.png"
																								class="lazyautosizes lazyloaded "
																								data-src="//nzr2ybsda.qnssl.com/images/24978/FohB8AGmXpRDEAclj2wwFpE4iPQv.png?imageMogr2/strip/thumbnail/720x1440&gt;/quality/90!/format/png"
																								data-sizes="auto" sizes="228px">
																						</div>
																					</div>
																					<!-- react-text: 201 -->
																					<!-- /react-text -->
																				</div>
																			</div></span>
																	</div>
																</div>
															</div>
															<div class="ten columns s-right-in-row">
																<div class="s-item-text-group half-offset-left">
																	<div class="s-item-title">
																		<div class="s-component s-text">
																			<h3 class="s-component-content s-font-heading">
																				<p>蛋糕</p>
																			</h3>
																		</div>
																	</div>
																	<div class="s-item-subtitle">
																		<div class="s-component s-text">
																			<h6 class="s-component-content s-font-body">
																				<p>奶香回味，柔软香甜</p>
																			</h6>
																		</div>
																	</div>
																	<div class="s-item-text">
																		<div class="s-component s-text">
																			<div class="s-component-content s-font-body">
																				<p>底层以蛋白等材料制成，顶层以色彩缤纷的新鲜水果以及奶油作为装饰。蛋糕的口感相当特别，底层的蛋白胚子外脆内滑，外壳的触感是硬邦邦的，其实松松脆脆入口即化，里层是软软的海棉质地，像绵软香甜的棉花糖，再与表层清爽香甜的水果以及冰冷香滑的奶油交融在一起，甜蜜幸福的滋味充斥着你的舌尖！</p>
																			</div>
																		</div>
																	</div>
																	<div class=""></div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- react-text: 214 -->
										<!-- /react-text -->
									</div>
								</div>
								<!-- react-text: 215 -->
								<!-- /react-text -->
							</div></li>
						<li class="slide s-section-3"
							id="section-f_2791b3d3-6179-4d2b-9ff1-4104f8038ec0"><div
								class="waypoint"></div>
							<a class="section-anchor"></a>
						<div class="s-section s-store-section transition">
								<div class="container">
									<div class="columns sixteen">
										<div class="s-title-group  ">
											<div class="s-title sb-title-center-align">
												<div class="s-component s-text">
													<h2 class="s-component-content s-font-title">
														<p style="text-align: center; font-size: 160%;">本周供应</p>
													</h2>
												</div>
											</div>
										</div>
									</div>
									<div class="s-ecommerce-container">
										<div class="s-component s-ecommerce">
											<div class="s-ecommerce-content">
												<div>
													<div class="s-ecommerce-products-wrapper ">
														<div class="s-ecommerce-card-view-wrapper"
															style="left: 0px;">
															<div class="s-ecommerce-card-view-cards-wrapper">
																<div class="s-ecommerce-card-view-cards"
																	style="margin: 30px 0px; height: auto;">东奔西走有木有</div>
															</div>
															<div class="s-ecommerce-card-view-detail"
																style="height: 1px;">
																<div
																	class="s-ecommerce-card-view-detail-header columns sixteen ">
																	<a class="s-common-link back-btn left s-font-body"><i
																		class="fa fa-long-arrow-left"
																		style="margin-right: 5px;"></i>
																	<!-- react-text: 238 -->浏览所有商品<!-- /react-text --></a>
																	<div class="right"></div>
																</div>
																<div
																	class="s-ecommerce-card-view-detail-header columns sixteen bottom">
																	<a class="s-common-link back-btn left s-font-body"><i
																		class="fa fa-long-arrow-left"
																		style="margin-right: 5px;"></i>
																	<!-- react-text: 243 -->浏览所有商品<!-- /react-text --></a>
																	<div class="right"></div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div></li>
						<li class="slide s-section-4"
							id="section-f_6e587977-21e3-424d-8445-d6a23cb5d2fa"><div
								class="waypoint"></div>
							<a class="section-anchor"></a>
						<div>
								<!-- react-text: 249 -->
								<!-- /react-text -->
								<div
									class="s-bg-image s-bg-light-text s-bg-overlay s-new-text-section s-section s-info-section transition lazyloaded"
									data-bg="//nzr2ybsda.qnssl.com/images/24978/FpQnG9V2IDv9aDdaT_SiFcKnCe-J.jpg?imageMogr2/strip/thumbnail/2000x1500&gt;/quality/90!/interlace/1/format/jpeg"
									style="background-image: url(&quot;//nzr2ybsda.qnssl.com/images/24978/FpQnG9V2IDv9aDdaT_SiFcKnCe-J.jpg?imageMogr2/strip/thumbnail/2000x1500&gt;/quality/90!/interlace/1/format/jpeg&quot;); background-color: transparent; background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;">
									<div class="container">
										<div class="clearfix">
											<div class="columns sixteen">
												<div class="s-title-group  ">
													<div class="s-title sb-title-center-align">
														<div class="s-component s-text">
															<h2 class="s-component-content s-font-title">
																<p style="text-align: center; font-size: 160%;">评价</p>
															</h2>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="center-align">
											<!-- react-text: 259 -->
											<!-- /react-text -->
											<div class="s-mh s-repeatable">
												<div>
													<div data-sorting-index="0"
														class="eight columns no-float s-repeatable-item">
														<div class="s-mhi s-info-box" style="min-height: 203px;">
															<div class="s-item-text-group ">
																<div class="s-item-title">
																	<div class="s-component s-text">
																		<h3 class="s-component-content s-font-heading">
																			<p style="font-size: 80%; text-align: center;">★★★★★</p>
																			<p style="font-size: 80%; text-align: center;">“预订到收获一共只用了不到一个小时，配送非常快！”</p>
																			<p style="font-size: 80%; text-align: center;">&nbsp;</p>
																		</h3>
																	</div>
																</div>
																<div class="s-item-text">
																	<div class="s-component s-text">
																		<div class="s-component-content s-font-body">
																			<p style="text-align: center;">— Nomo</p>
																		</div>
																	</div>
																</div>
																<div class="center-align"></div>
															</div>
														</div>
													</div>
													<div data-sorting-index="1"
														class="eight columns no-float s-repeatable-item">
														<div class="s-mhi s-info-box" style="min-height: 203px;">
															<div class="s-item-text-group ">
																<div class="s-item-title">
																	<div class="s-component s-text">
																		<h3 class="s-component-content s-font-heading">
																			<p style="font-size: 80%; text-align: center;">★★★★★</p>
																			<p style="font-size: 80%; text-align: center;">“生日首选Cake,女朋友送的芝士蛋糕，甜而不腻，一本满足！”</p>
																			<p style="font-size: 80%; text-align: center;">&nbsp;</p>
																		</h3>
																	</div>
																</div>
																<div class="s-item-text">
																	<div class="s-component s-text">
																		<div class="s-component-content s-font-body">
																			<p style="text-align: center">— DF</p>
																		</div>
																	</div>
																</div>
																<div class="center-align"></div>
															</div>
														</div>
													</div>
													<div data-sorting-index="2"
														class="eight columns no-float s-repeatable-item s-last-row">
														<div class="s-mhi s-info-box" style="min-height: 203px;">
															<div class="s-item-text-group ">
																<div class="s-item-title">
																	<div class="s-component s-text">
																		<h3 class="s-component-content s-font-heading">
																			<p style="text-align: center; font-size: 80%;">★★★★</p>
																			<p style="text-align: center; font-size: 80%;">“一直在吃Bakery家的面包，干净好吃，分量很足。”</p>
																			<p style="font-size: 80%; text-align: center;">&nbsp;</p>
																		</h3>
																	</div>
																</div>
																<div class="s-item-text">
																	<div class="s-component s-text">
																		<div class="s-component-content s-font-body">
																			<p style="text-align: center;">— CassyMoss</p>
																		</div>
																	</div>
																</div>
																<div class="center-align"></div>
															</div>
														</div>
													</div>
													<div data-sorting-index="3"
														class="eight columns no-float s-repeatable-item s-last-row">
														<div class="s-mhi s-info-box" style="min-height: 203px;">
															<div class="s-item-text-group ">
																<div class="s-item-title">
																	<div class="s-component s-text">
																		<h3 class="s-component-content s-font-heading">
																			<p style="font-size: 80%; text-align: center;">★★★★★</p>
																			<p style="font-size: 80%; text-align: center;">“一家很用心的烘焙店，喜欢的不得了！”</p>
																			<p style="font-size: 80%; text-align: center;">&nbsp;</p>
																		</h3>
																	</div>
																</div>
																<div class="s-item-text">
																	<div class="s-component s-text">
																		<div class="s-component-content s-font-body">
																			<p style="text-align: center;">— 萌萌酱</p>
																		</div>
																	</div>
																</div>
																<div class="center-align"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- react-text: 302 -->
											<!-- /react-text -->
										</div>
									</div>
								</div>
								<!-- react-text: 303 -->
								<!-- /react-text -->
							</div></li>
						<li class="slide s-section-5"
							id="section-f_e34a6773-ac00-44a8-b31e-7c8607ddd45e"><div
								class="waypoint"></div>
							<a class="section-anchor"></a>
						<div
								class="s-icons-section s-section transition collapse-bottom-padding">
								<div class="container">
									<div class="columns sixteen">
										<div class="s-title-group  ">
											<div class="s-title sb-title-center-align">
												<div class="s-component s-text">
													<h2 class="s-component-content s-font-title">
														<p style="text-align: center; font-size: 160%;">关注我们</p>
													</h2>
												</div>
											</div>
										</div>
									</div>
									<div class="center-align">
										<!-- react-text: 315 -->
										<!-- /react-text -->
										<div class="s-mh s-repeatable">
											<div>
												<div data-sorting-index="0"
													class="third columns half-fixed no-float s-repeatable-item s-last-row">
													<div class="s-item-media-group s-mhi"
														style="min-height: 160px;">
														<div class="s-component s-image">
															<span><div class="s-component-content">
																	<div>
																		<!-- react-text: 324 -->
																		<!-- /react-text -->
																		<div class="s-ratio-box"
																			style="max-width: 160px; max-height: 160px;">
																			<div class="s-ratio-fill"
																				style="padding-bottom: 100%;"></div>
																			<div>
																				<img alt="" title="" data-description="" width="160"
																					height="160"
																					src="<%=path%>/static/frontSingle/Fjtf9s36SwCOrNBp_jykAbO9SIRs.png"
																					class="lazyautosizes lazyloaded "
																					data-src="//nzr2ybsda.qnssl.com/images/24978/Fjtf9s36SwCOrNBp_jykAbO9SIRs.png?imageMogr2/strip/thumbnail/480x960&gt;/format/png"
																					data-sizes="auto" sizes="160px">
																			</div>
																		</div>
																		<!-- react-text: 329 -->
																		<!-- /react-text -->
																	</div>
																</div></span>
														</div>
													</div>
													<div class="s-item-text-group">
														<div class="s-component s-text">
															<div class="s-component-content s-font-body">
																<p>微信：Bakerycn</p>
															</div>
														</div>
													</div>
												</div>
												<div data-sorting-index="1"
													class="third columns half-fixed no-float s-repeatable-item s-last-row">
													<div class="s-item-media-group s-mhi"
														style="min-height: 160px;">
														<div class="s-component s-image">
															<span><div class="s-component-content">
																	<div>
																		<!-- react-text: 339 -->
																		<!-- /react-text -->
																		<div class="s-ratio-box"
																			style="max-width: 160px; max-height: 160px;">
																			<div class="s-ratio-fill"
																				style="padding-bottom: 100%;"></div>
																			<div>
																				<img alt="" title="" data-description="" width="160"
																					height="160"
																					src="<%=path%>/static/frontSingle/FhBsFVIGTTRpRZzaKg0cHQu-dk7e.png"
																					class="lazyautosizes lazyloaded "
																					data-src="//nzr2ybsda.qnssl.com/images/24978/FhBsFVIGTTRpRZzaKg0cHQu-dk7e.png?imageMogr2/strip/thumbnail/480x960&gt;/format/png"
																					data-sizes="auto" sizes="160px">
																			</div>
																		</div>
																		<!-- react-text: 344 -->
																		<!-- /react-text -->
																	</div>
																</div></span>
														</div>
													</div>
													<div class="s-item-text-group">
														<div class="s-component s-text">
															<div class="s-component-content s-font-body">
																<p>微博：Bakery</p>
															</div>
														</div>
													</div>
												</div>
												<div data-sorting-index="2"
													class="third columns half-fixed no-float s-repeatable-item s-last-row">
													<div class="s-item-media-group s-mhi"
														style="min-height: 160px;">
														<div class="s-component s-image">
															<span><div class="s-component-content">
																	<div>
																		<!-- react-text: 354 -->
																		<!-- /react-text -->
																		<div class="s-ratio-box"
																			style="max-width: 160px; max-height: 160px;">
																			<div class="s-ratio-fill"
																				style="padding-bottom: 100%;"></div>
																			<div>
																				<img alt="" title="" data-description="" width="160"
																					height="160"
																					src="<%=path%>/static/frontSingle/FqbJzrfURRsKRclhneiYCtRxFu3w.png"
																					class="lazyautosizes lazyloaded "
																					data-src="//nzr2ybsda.qnssl.com/images/24978/FqbJzrfURRsKRclhneiYCtRxFu3w.png?imageMogr2/strip/thumbnail/480x960&gt;/format/png"
																					data-sizes="auto" sizes="160px">
																			</div>
																		</div>
																		<!-- react-text: 359 -->
																		<!-- /react-text -->
																	</div>
																</div></span>
														</div>
													</div>
													<div class="s-item-text-group">
														<div class="s-component s-text">
															<div class="s-component-content s-font-body">
																<p>邮箱：hi@bakery.cn</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- react-text: 363 -->
										<!-- /react-text -->
									</div>
								</div>
							</div>
							<div class="waypoint"></div></li>
					</ul>
				</div>
				<!-- react-empty: 365 -->
				<div id="strikingly-tooltip-container"></div>
				<div class="s-footer-section s-section  transition">
					<div class="container s-layout-vertical">
						<div class="columns row sixteen ">
							<div>
								<div class="s-component s-social-media">
									<span><div class="s-component-content">
											<ul class="s-social-media-buttons">
												<!-- react-empty: 398 -->
												<li class="s-social-media-button"><div
														class="col sinaweibo-counter">
														<img src="<%=path%>/static/frontSingle/weibo-share.png">
													</div></li>
											</ul>
										</div></span>
								</div>
							</div>
							<div class="s-footer-text">
								<div class="s-component s-text">
									<div class="s-component-content s-font-body">
										<p>© 2016</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="ecommerce-drawer" class="s-category-drawer-wrapper">
					<div data-reactroot="">
						<div
							class="s-category-drawer strikingly-drawer drawer-animation on-top">
							<div class="close-btn">×</div>
							<div class="drawer-title">商品分类</div>
							<ul>
								<li><a href="http://site-70533-4207-7641.sxl.cn/#3">所有商品分类</a></li>
							</ul>
						</div>
						<div class="navbar-drawer-mask fadeOut"></div>
					</div>
				</div>
				<div id="blog-category-drawer" class="s-category-drawer-wrapper"></div>
				<!-- react-empty: 379 -->
				<div class="s-floated-components">
					<div>
						<div class="ecommerce-buy-dialog s-edit-modal extend"
							id="ecommerce-buy-dialog" style="margin-top: 0px;">
							<div class="s-component s-ecommerce-buy"
								style="position: relative;">
								<div class="close-button">
									<h5>
										<a> × </a>
									</h5>
								</div>
							</div>
						</div>
					</div>
					<div id="s-ecommerce-shopping-cart-wrapper"
						class="s-ecommerce-shopping-cart-wrapper" style="display: block;"></div>
					<div id="s-new-mobile-actions-wrapper" class="">
						<ul class="s-mobile-actions clearfix s-font-body"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="fb-root" style="height: 0px;"></div>
	<div id="app-script-root"></div>
	<div id="app-view-root"></div>
	<script src="<%=path%>/static/frontSingle/jquery.min.js"></script>
	<script>
  window.jQuery || document.write('<script src="https://assets.sxlcdn.com/assets/jquery-23ef5dbee60d99b494224b5e1be09563.js"><\/script>');
</script>
	<script src="<%=path%>/static/frontSingle/i18n-4a613731904a84c1416aba0ed774b8b2.js"></script>
	<script>
  window.pingpp = {}
</script>
	<script src="<%=path%>/static/frontSingle/site-dll-bca7bea1aa5614d9914d802acc8708b0.js"></script>
	<script
		src="<%=path%>/static/frontSingle/page-site-bundle-1f4e5fbc45a2cbe4bed1f8d3f8c59b6f.js"></script>
	<!-- Powered by Sxl.cn 4 (1) Mar 16, 2017 at 12:50-->
	<script src="<%=path%>/static/frontSingle/checkout.js"></script>
</body>
</html>