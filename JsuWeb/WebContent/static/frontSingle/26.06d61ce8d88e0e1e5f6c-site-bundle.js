/*! no_rails_asset_compression */

webpackJsonp([26],{333:function(e){e.exports={L:1,M:0,Q:3,H:2}},334:function(e,t,r){function n(e,t){if(void 0==e.length)throw new Error(e.length+"/"+t)
for(var r=0;r<e.length&&0==e[r];)r++
this.num=new Array(e.length-r+t)
for(var n=0;n<e.length-r;n++)this.num[n]=e[n+r]}var a=r(335)
n.prototype={get:function(e){return this.num[e]},getLength:function(){return this.num.length},multiply:function(e){for(var t=new Array(this.getLength()+e.getLength()-1),r=0;r<this.getLength();r++)for(var i=0;i<e.getLength();i++)t[r+i]^=a.gexp(a.glog(this.get(r))+a.glog(e.get(i)))
return new n(t,0)},mod:function(e){if(this.getLength()-e.getLength()<0)return this
for(var t=a.glog(this.get(0))-a.glog(e.get(0)),r=new Array(this.getLength()),i=0;i<this.getLength();i++)r[i]=this.get(i)
for(var i=0;i<e.getLength();i++)r[i]^=a.gexp(a.glog(e.get(i))+t)
return new n(r,0).mod(e)}}
e.exports=n},335:function(e){for(var t={glog:function(e){if(e<1)throw new Error("glog("+e+")")
return t.LOG_TABLE[e]},gexp:function(e){for(;e<0;)e+=255
for(;e>=256;)e-=255
return t.EXP_TABLE[e]},EXP_TABLE:new Array(256),LOG_TABLE:new Array(256)},r=0;r<8;r++)t.EXP_TABLE[r]=1<<r
for(var r=8;r<256;r++)t.EXP_TABLE[r]=t.EXP_TABLE[r-4]^t.EXP_TABLE[r-5]^t.EXP_TABLE[r-6]^t.EXP_TABLE[r-8]
for(var r=0;r<255;r++)t.LOG_TABLE[t.EXP_TABLE[r]]=r
e.exports=t},336:function(e){e.exports={MODE_NUMBER:1,MODE_ALPHA_NUM:2,MODE_8BIT_BYTE:4,MODE_KANJI:8}},389:function(e,t,r){(function(t){"use strict"
var n,a,i,o,s,c,l,u,p,d,m,h,g,f,y,v,E,_,C,b,P,N,w,k
_=r(2)
w=r(1)
n=r(3)
d=r(9)
a=r(8)
N=r(116)
i=r(40)
c=r(60)
s=r(35)
y=r(10)
u=r(29)
o=r(54)
l=r(53)
N=r(116)
m=r(19)
P=r(66)
h=r(61)
b=r(906)
C=r(905)
v=r(904)
f=r(900)
g=r(898)
p=r(863)
E=r(864)
k=r(44)
e.exports=a.createPageComponent({displayName:"EcommerceBuy",mixins:[m("ecommerceBuy"),P],bobcatPropTypes:{data:{binding:_.PropTypes.object.isRequired},designer:{currentPanelName:_.PropTypes.string},callbacks:{changeDialogExtendState:_.PropTypes.func}},componentWillMount:function(){var e
e=decodeURIComponent(location?location.href:"")
if(!N(e).getParam("buyer_open_id"))return this.updateData({paymentMethod:""})},componentDidMount:function(){var e
this._loadStripeScript()
this._token=c.register(function(e){return function(t){var r
switch(t.actionType){case s.ActionTypes.GOTO_ECOMMERCE_BUY_DIALOG:return e.props.changeDialogExtendState("waiting"!==(r=t.data.panelName)&&"confirm"!==r)}}}(this))
n.url().param("paypal")&&this._paypalSuccessCallback()
e=N("undefined"!=typeof location&&null!==location?location.href:void 0).paramsToMap()
if(e.open_payment_dialog){this._openDialog()
i.gotoEcommerceBuyDialog("orderPreview")}return this._adjustHeight()},componentWillUnmount:function(){return c.unregister(this._token)},componentDidUpdate:function(){if(this.props.needToAdjustHeight){this._adjustHeight()
return i.adjustHeight(!1)}},_getCartBinding:function(){return o.getCartBinding()},_openDialog:function(){h.openDialog("ecommerceBuyPanel",{strong:!0,autoAdjustPosition:!1})
return i.updateBuyDialogOpenState(!0)},_closeDialog:function(){h.closeDialog("ecommerceBuyPanel")
return i.updateBuyDialogOpenState(!1)},_getPanelProps:function(e){var t,r
t=null!=e?this._getCartBinding().sub(e):this._getCartBinding()
r=t.toJS()
return w.extend(r,{binding:t,mode:this.dsProps.mode,products:u.getProducts(),settings:u.getSettings(),gotoPanelWithoutAdjustHeight:i.gotoEcommerceBuyDialog,gotoPanel:function(){return function(e){return i.gotoEcommerceBuyDialog(e,!0)}}(this),adjustHeight:function(){return function(){return i.adjustHeight(!0)}}(this),openDialog:function(e){return function(){return e._openDialog()}}(this),closeDialog:function(e){return function(){return e._closeDialog()}}(this),changeDialogExtendState:function(e){return function(t){return e.props.changeDialogExtendState(t)}}(this)})},_paypalSuccessCallback:function(){var e,t
this._openDialog()
i.gotoEcommerceBuyDialog("confirm",!0)
this.props.changeDialogExtendState(!1)
t=o.getCart()
e=r(47)
e.trackGAEcommerce()
e.trackPageEventOnFB("Purchase",l.getTrackData())
i.clearShoppingCart()
return k.replace("/",{})},_loadStripeScript:function(){var e
e=n("<script>")
e.attr({src:"https://checkout.stripe.com/checkout.js"})
n("body").append(e)
return n("#viewport").attr("content","width=device-width,initial-scale=1.0,user-scalable=no,minimum-scale=1.0,maximum-scale=1.0")},_changeListener:function(){return this.forceUpdate()},_adjustHeight:function(){var e,t,r,a,i,o,s
e=n(this.refs.ecommerceBuy)
a=e.find(".buy-panel")
r=n(".strikingly-modal-container")
t=e.closest(".ecommerce-buy-dialog")
o=function(e){return function(){var n,i,o
if("terms"!==e.props.currentPanelName){n=a.outerHeight()
i=a.outerWidth()
o=r.outerHeight()
return t.css({height:n,width:i,"margin-top":Math.round(Math.max((o-n)/2,0))})}}}(this)
this._isChanging&&window.clearTimeout(this._adjustTimer)
s=[1e3,500,100,1]
i=function(e){return function(){var t
t=s.pop()
if(null!=t)return e._adjustTimer=e.setTimeout(function(){o()
return i()},t)
window.clearTimeout(e._adjustTimer)
return e._isChanging=!1}}(this)
i()
return this._isChanging=!0},_onClickCloseDialog:function(){u.getProducts().length<=1&&!y.hasInitialProductPage()&&i.clearShoppingCart()
return this._closeDialog()},_renderWaiting:function(){return _.createElement("div",{className:"buy-panel waiting no-extend"},_.createElement("div",{className:"waiting center"},_.createElement("br",null),_.createElement("br",null),_.createElement("div",{className:"title"},_.createElement("i",{className:"fa fa-spinner fa-spin"}),_.createElement("span",null,t("Ecommerce|Charging"))),_.createElement("br",null),_.createElement("br",null)))},_renderRedirecting:function(){return _.createElement("div",{className:"buy-panel redirecting no-extend"},_.createElement("div",{className:"redirecting center"},_.createElement("br",null),_.createElement("br",null),_.createElement("div",{className:"title"},_.createElement("i",{className:"fa fa-spinner fa-spin"}),_.createElement("span",null,t("Ecommerce|Redirecting you to payment platform..."))),_.createElement("br",null),_.createElement("br",null)))},_renderCurrentPanel:function(){switch(this.props.currentPanelName){case"singleProductPanel":return _.createElement(b,Object.assign({},this._getPanelProps()))
case"terms":return _.createElement(p,{gotoPanel:i.gotoEcommerceBuyDialog})
case"shippingForm":return _.createElement(C,Object.assign({},this._getPanelProps()))
case"paymentPanel":return _.createElement(v,Object.assign({},this._getPanelProps()))
case"orderPreview":return _.createElement(f,Object.assign({},this._getPanelProps()))
case"waiting":return this._renderWaiting()
case"redirecting":return this._renderRedirecting()
case"confirm":return _.createElement(g,Object.assign({},this._getPanelProps()))
case"paymentqr":return _.createElement(E,Object.assign({},this._getPanelProps("orderData")))}},render:function(){return _.createElement("div",{style:{position:"relative"},className:"s-component s-ecommerce-buy",ref:"ecommerceBuy"},"terms"!==this.props.currentPanelName?_.createElement("div",{className:"close-button"},_.createElement("h5",null,_.createElement("a",{onClick:this._onClickCloseDialog}," × "))):void 0,this._renderCurrentPanel())}})}).call(t,r(5))},426:function(e,t,r){"use strict"
function n(e){return e&&e.__esModule?e:{default:e}}function a(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function i(e,t){if(!e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called")
return!t||"object"!=typeof t&&"function"!=typeof t?e:t}function o(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function, not "+typeof t)
e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}})
t&&(Object.setPrototypeOf?Object.setPrototypeOf(e,t):e.__proto__=t)}Object.defineProperty(t,"__esModule",{value:!0})
t.default=void 0
var s=function(){var e="function"==typeof Symbol&&Symbol.for&&Symbol.for("react.element")||60103
return function(t,r,n,a){var i=t&&t.defaultProps,o=arguments.length-3
r||0===o||(r={})
if(r&&i)for(var s in i)void 0===r[s]&&(r[s]=i[s])
else r||(r=i||{})
if(1===o)r.children=a
else if(o>1){for(var c=Array(o),l=0;l<o;l++)c[l]=arguments[l+3]
r.children=c}return{$$typeof:e,type:t,key:void 0===n?null:""+n,ref:null,props:r,_owner:null}}}(),c=function(){function e(e,t){for(var r=0;r<t.length;r++){var n=t[r]
n.enumerable=n.enumerable||!1
n.configurable=!0
"value"in n&&(n.writable=!0)
Object.defineProperty(e,n.key,n)}}return function(t,r,n){r&&e(t.prototype,r)
n&&e(t,n)
return t}}(),l=r(2),u=n(l),p=r(10),d=n(p),m=function(e){function t(){a(this,t)
return i(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}o(t,e)
c(t,[{key:"render",value:function(){var e=d.default.getTermsText(),t=[]
e.split("\n").forEach(function(e){var r=t.pop(),n=e.trim()
if("undefined"==typeof r)return t.push(n)
r&&n&&t.push(r+"</br>"+n)
if(r&&!n){t.push(r)
t.push(n)}r||t.push(n)})
return s("div",{className:"text-wrapper"},void 0,t.map(function(e,t){return s("div",{className:"paragraph s-font-body"},t,s("p",{dangerouslySetInnerHTML:{__html:e}}))}))}}])
return t}(u.default.Component)
t.default=m
e.exports=t.default},427:function(e,t,r){function n(e){this.mode=a.MODE_8BIT_BYTE
this.data=e}var a=r(336)
n.prototype={getLength:function(){return this.data.length},write:function(e){for(var t=0;t<this.data.length;t++)e.put(this.data.charCodeAt(t),8)}}
e.exports=n},428:function(e){function t(){this.buffer=new Array
this.length=0}t.prototype={get:function(e){var t=Math.floor(e/8)
return 1==(this.buffer[t]>>>7-e%8&1)},put:function(e,t){for(var r=0;r<t;r++)this.putBit(1==(e>>>t-r-1&1))},getLengthInBits:function(){return this.length},putBit:function(e){var t=Math.floor(this.length/8)
this.buffer.length<=t&&this.buffer.push(0)
e&&(this.buffer[t]|=128>>>this.length%8)
this.length++}}
e.exports=t},429:function(e,t,r){function n(e,t){this.typeNumber=e
this.errorCorrectLevel=t
this.modules=null
this.moduleCount=0
this.dataCache=null
this.dataList=[]}var a=r(427),i=r(430),o=r(428),s=r(431),c=r(334),l=n.prototype
l.addData=function(e){var t=new a(e)
this.dataList.push(t)
this.dataCache=null}
l.isDark=function(e,t){if(e<0||this.moduleCount<=e||t<0||this.moduleCount<=t)throw new Error(e+","+t)
return this.modules[e][t]}
l.getModuleCount=function(){return this.moduleCount}
l.make=function(){if(this.typeNumber<1){var e=1
for(e=1;e<40;e++){for(var t=i.getRSBlocks(e,this.errorCorrectLevel),r=new o,n=0,a=0;a<t.length;a++)n+=t[a].dataCount
for(var a=0;a<this.dataList.length;a++){var c=this.dataList[a]
r.put(c.mode,4)
r.put(c.getLength(),s.getLengthInBits(c.mode,e))
c.write(r)}if(r.getLengthInBits()<=8*n)break}this.typeNumber=e}this.makeImpl(!1,this.getBestMaskPattern())}
l.makeImpl=function(e,t){this.moduleCount=4*this.typeNumber+17
this.modules=new Array(this.moduleCount)
for(var r=0;r<this.moduleCount;r++){this.modules[r]=new Array(this.moduleCount)
for(var a=0;a<this.moduleCount;a++)this.modules[r][a]=null}this.setupPositionProbePattern(0,0)
this.setupPositionProbePattern(this.moduleCount-7,0)
this.setupPositionProbePattern(0,this.moduleCount-7)
this.setupPositionAdjustPattern()
this.setupTimingPattern()
this.setupTypeInfo(e,t)
this.typeNumber>=7&&this.setupTypeNumber(e)
null==this.dataCache&&(this.dataCache=n.createData(this.typeNumber,this.errorCorrectLevel,this.dataList))
this.mapData(this.dataCache,t)}
l.setupPositionProbePattern=function(e,t){for(var r=-1;r<=7;r++)if(!(e+r<=-1||this.moduleCount<=e+r))for(var n=-1;n<=7;n++)t+n<=-1||this.moduleCount<=t+n||(0<=r&&r<=6&&(0==n||6==n)||0<=n&&n<=6&&(0==r||6==r)||2<=r&&r<=4&&2<=n&&n<=4?this.modules[e+r][t+n]=!0:this.modules[e+r][t+n]=!1)}
l.getBestMaskPattern=function(){for(var e=0,t=0,r=0;r<8;r++){this.makeImpl(!0,r)
var n=s.getLostPoint(this)
if(0==r||e>n){e=n
t=r}}return t}
l.createMovieClip=function(e,t,r){var n=e.createEmptyMovieClip(t,r),a=1
this.make()
for(var i=0;i<this.modules.length;i++)for(var o=i*a,s=0;s<this.modules[i].length;s++){var c=s*a,l=this.modules[i][s]
if(l){n.beginFill(0,100)
n.moveTo(c,o)
n.lineTo(c+a,o)
n.lineTo(c+a,o+a)
n.lineTo(c,o+a)
n.endFill()}}return n}
l.setupTimingPattern=function(){for(var e=8;e<this.moduleCount-8;e++)null==this.modules[e][6]&&(this.modules[e][6]=e%2==0)
for(var t=8;t<this.moduleCount-8;t++)null==this.modules[6][t]&&(this.modules[6][t]=t%2==0)}
l.setupPositionAdjustPattern=function(){for(var e=s.getPatternPosition(this.typeNumber),t=0;t<e.length;t++)for(var r=0;r<e.length;r++){var n=e[t],a=e[r]
if(null==this.modules[n][a])for(var i=-2;i<=2;i++)for(var o=-2;o<=2;o++)i==-2||2==i||o==-2||2==o||0==i&&0==o?this.modules[n+i][a+o]=!0:this.modules[n+i][a+o]=!1}}
l.setupTypeNumber=function(e){for(var t=s.getBCHTypeNumber(this.typeNumber),r=0;r<18;r++){var n=!e&&1==(t>>r&1)
this.modules[Math.floor(r/3)][r%3+this.moduleCount-8-3]=n}for(var r=0;r<18;r++){var n=!e&&1==(t>>r&1)
this.modules[r%3+this.moduleCount-8-3][Math.floor(r/3)]=n}}
l.setupTypeInfo=function(e,t){for(var r=this.errorCorrectLevel<<3|t,n=s.getBCHTypeInfo(r),a=0;a<15;a++){var i=!e&&1==(n>>a&1)
a<6?this.modules[a][8]=i:a<8?this.modules[a+1][8]=i:this.modules[this.moduleCount-15+a][8]=i}for(var a=0;a<15;a++){var i=!e&&1==(n>>a&1)
a<8?this.modules[8][this.moduleCount-a-1]=i:a<9?this.modules[8][15-a-1+1]=i:this.modules[8][15-a-1]=i}this.modules[this.moduleCount-8][8]=!e}
l.mapData=function(e,t){for(var r=-1,n=this.moduleCount-1,a=7,i=0,o=this.moduleCount-1;o>0;o-=2){6==o&&o--
for(;;){for(var c=0;c<2;c++)if(null==this.modules[n][o-c]){var l=!1
i<e.length&&(l=1==(e[i]>>>a&1))
var u=s.getMask(t,n,o-c)
u&&(l=!l)
this.modules[n][o-c]=l
a--
if(a==-1){i++
a=7}}n+=r
if(n<0||this.moduleCount<=n){n-=r
r=-r
break}}}}
n.PAD0=236
n.PAD1=17
n.createData=function(e,t,r){for(var a=i.getRSBlocks(e,t),c=new o,l=0;l<r.length;l++){var u=r[l]
c.put(u.mode,4)
c.put(u.getLength(),s.getLengthInBits(u.mode,e))
u.write(c)}for(var p=0,l=0;l<a.length;l++)p+=a[l].dataCount
if(c.getLengthInBits()>8*p)throw new Error("code length overflow. ("+c.getLengthInBits()+">"+8*p+")")
c.getLengthInBits()+4<=8*p&&c.put(0,4)
for(;c.getLengthInBits()%8!=0;)c.putBit(!1)
for(;;){if(c.getLengthInBits()>=8*p)break
c.put(n.PAD0,8)
if(c.getLengthInBits()>=8*p)break
c.put(n.PAD1,8)}return n.createBytes(c,a)}
n.createBytes=function(e,t){for(var r=0,n=0,a=0,i=new Array(t.length),o=new Array(t.length),l=0;l<t.length;l++){var u=t[l].dataCount,p=t[l].totalCount-u
n=Math.max(n,u)
a=Math.max(a,p)
i[l]=new Array(u)
for(var d=0;d<i[l].length;d++)i[l][d]=255&e.buffer[d+r]
r+=u
var m=s.getErrorCorrectPolynomial(p),h=new c(i[l],m.getLength()-1),g=h.mod(m)
o[l]=new Array(m.getLength()-1)
for(var d=0;d<o[l].length;d++){var f=d+g.getLength()-o[l].length
o[l][d]=f>=0?g.get(f):0}}for(var y=0,d=0;d<t.length;d++)y+=t[d].totalCount
for(var v=new Array(y),E=0,d=0;d<n;d++)for(var l=0;l<t.length;l++)d<i[l].length&&(v[E++]=i[l][d])
for(var d=0;d<a;d++)for(var l=0;l<t.length;l++)d<o[l].length&&(v[E++]=o[l][d])
return v}
e.exports=n},430:function(e,t,r){function n(e,t){this.totalCount=e
this.dataCount=t}var a=r(333)
n.RS_BLOCK_TABLE=[[1,26,19],[1,26,16],[1,26,13],[1,26,9],[1,44,34],[1,44,28],[1,44,22],[1,44,16],[1,70,55],[1,70,44],[2,35,17],[2,35,13],[1,100,80],[2,50,32],[2,50,24],[4,25,9],[1,134,108],[2,67,43],[2,33,15,2,34,16],[2,33,11,2,34,12],[2,86,68],[4,43,27],[4,43,19],[4,43,15],[2,98,78],[4,49,31],[2,32,14,4,33,15],[4,39,13,1,40,14],[2,121,97],[2,60,38,2,61,39],[4,40,18,2,41,19],[4,40,14,2,41,15],[2,146,116],[3,58,36,2,59,37],[4,36,16,4,37,17],[4,36,12,4,37,13],[2,86,68,2,87,69],[4,69,43,1,70,44],[6,43,19,2,44,20],[6,43,15,2,44,16],[4,101,81],[1,80,50,4,81,51],[4,50,22,4,51,23],[3,36,12,8,37,13],[2,116,92,2,117,93],[6,58,36,2,59,37],[4,46,20,6,47,21],[7,42,14,4,43,15],[4,133,107],[8,59,37,1,60,38],[8,44,20,4,45,21],[12,33,11,4,34,12],[3,145,115,1,146,116],[4,64,40,5,65,41],[11,36,16,5,37,17],[11,36,12,5,37,13],[5,109,87,1,110,88],[5,65,41,5,66,42],[5,54,24,7,55,25],[11,36,12],[5,122,98,1,123,99],[7,73,45,3,74,46],[15,43,19,2,44,20],[3,45,15,13,46,16],[1,135,107,5,136,108],[10,74,46,1,75,47],[1,50,22,15,51,23],[2,42,14,17,43,15],[5,150,120,1,151,121],[9,69,43,4,70,44],[17,50,22,1,51,23],[2,42,14,19,43,15],[3,141,113,4,142,114],[3,70,44,11,71,45],[17,47,21,4,48,22],[9,39,13,16,40,14],[3,135,107,5,136,108],[3,67,41,13,68,42],[15,54,24,5,55,25],[15,43,15,10,44,16],[4,144,116,4,145,117],[17,68,42],[17,50,22,6,51,23],[19,46,16,6,47,17],[2,139,111,7,140,112],[17,74,46],[7,54,24,16,55,25],[34,37,13],[4,151,121,5,152,122],[4,75,47,14,76,48],[11,54,24,14,55,25],[16,45,15,14,46,16],[6,147,117,4,148,118],[6,73,45,14,74,46],[11,54,24,16,55,25],[30,46,16,2,47,17],[8,132,106,4,133,107],[8,75,47,13,76,48],[7,54,24,22,55,25],[22,45,15,13,46,16],[10,142,114,2,143,115],[19,74,46,4,75,47],[28,50,22,6,51,23],[33,46,16,4,47,17],[8,152,122,4,153,123],[22,73,45,3,74,46],[8,53,23,26,54,24],[12,45,15,28,46,16],[3,147,117,10,148,118],[3,73,45,23,74,46],[4,54,24,31,55,25],[11,45,15,31,46,16],[7,146,116,7,147,117],[21,73,45,7,74,46],[1,53,23,37,54,24],[19,45,15,26,46,16],[5,145,115,10,146,116],[19,75,47,10,76,48],[15,54,24,25,55,25],[23,45,15,25,46,16],[13,145,115,3,146,116],[2,74,46,29,75,47],[42,54,24,1,55,25],[23,45,15,28,46,16],[17,145,115],[10,74,46,23,75,47],[10,54,24,35,55,25],[19,45,15,35,46,16],[17,145,115,1,146,116],[14,74,46,21,75,47],[29,54,24,19,55,25],[11,45,15,46,46,16],[13,145,115,6,146,116],[14,74,46,23,75,47],[44,54,24,7,55,25],[59,46,16,1,47,17],[12,151,121,7,152,122],[12,75,47,26,76,48],[39,54,24,14,55,25],[22,45,15,41,46,16],[6,151,121,14,152,122],[6,75,47,34,76,48],[46,54,24,10,55,25],[2,45,15,64,46,16],[17,152,122,4,153,123],[29,74,46,14,75,47],[49,54,24,10,55,25],[24,45,15,46,46,16],[4,152,122,18,153,123],[13,74,46,32,75,47],[48,54,24,14,55,25],[42,45,15,32,46,16],[20,147,117,4,148,118],[40,75,47,7,76,48],[43,54,24,22,55,25],[10,45,15,67,46,16],[19,148,118,6,149,119],[18,75,47,31,76,48],[34,54,24,34,55,25],[20,45,15,61,46,16]]
n.getRSBlocks=function(e,t){var r=n.getRsBlockTable(e,t)
if(void 0==r)throw new Error("bad rs block @ typeNumber:"+e+"/errorCorrectLevel:"+t)
for(var a=r.length/3,i=new Array,o=0;o<a;o++)for(var s=r[3*o+0],c=r[3*o+1],l=r[3*o+2],u=0;u<s;u++)i.push(new n(c,l))
return i}
n.getRsBlockTable=function(e,t){switch(t){case a.L:return n.RS_BLOCK_TABLE[4*(e-1)+0]
case a.M:return n.RS_BLOCK_TABLE[4*(e-1)+1]
case a.Q:return n.RS_BLOCK_TABLE[4*(e-1)+2]
case a.H:return n.RS_BLOCK_TABLE[4*(e-1)+3]
default:return}}
e.exports=n},431:function(e,t,r){var n=r(336),a=r(334),i=r(335),o={PATTERN000:0,PATTERN001:1,PATTERN010:2,PATTERN011:3,PATTERN100:4,PATTERN101:5,PATTERN110:6,PATTERN111:7},s={PATTERN_POSITION_TABLE:[[],[6,18],[6,22],[6,26],[6,30],[6,34],[6,22,38],[6,24,42],[6,26,46],[6,28,50],[6,30,54],[6,32,58],[6,34,62],[6,26,46,66],[6,26,48,70],[6,26,50,74],[6,30,54,78],[6,30,56,82],[6,30,58,86],[6,34,62,90],[6,28,50,72,94],[6,26,50,74,98],[6,30,54,78,102],[6,28,54,80,106],[6,32,58,84,110],[6,30,58,86,114],[6,34,62,90,118],[6,26,50,74,98,122],[6,30,54,78,102,126],[6,26,52,78,104,130],[6,30,56,82,108,134],[6,34,60,86,112,138],[6,30,58,86,114,142],[6,34,62,90,118,146],[6,30,54,78,102,126,150],[6,24,50,76,102,128,154],[6,28,54,80,106,132,158],[6,32,58,84,110,136,162],[6,26,54,82,110,138,166],[6,30,58,86,114,142,170]],G15:1335,G18:7973,G15_MASK:21522,getBCHTypeInfo:function(e){for(var t=e<<10;s.getBCHDigit(t)-s.getBCHDigit(s.G15)>=0;)t^=s.G15<<s.getBCHDigit(t)-s.getBCHDigit(s.G15)
return(e<<10|t)^s.G15_MASK},getBCHTypeNumber:function(e){for(var t=e<<12;s.getBCHDigit(t)-s.getBCHDigit(s.G18)>=0;)t^=s.G18<<s.getBCHDigit(t)-s.getBCHDigit(s.G18)
return e<<12|t},getBCHDigit:function(e){for(var t=0;0!=e;){t++
e>>>=1}return t},getPatternPosition:function(e){return s.PATTERN_POSITION_TABLE[e-1]},getMask:function(e,t,r){switch(e){case o.PATTERN000:return(t+r)%2==0
case o.PATTERN001:return t%2==0
case o.PATTERN010:return r%3==0
case o.PATTERN011:return(t+r)%3==0
case o.PATTERN100:return(Math.floor(t/2)+Math.floor(r/3))%2==0
case o.PATTERN101:return t*r%2+t*r%3==0
case o.PATTERN110:return(t*r%2+t*r%3)%2==0
case o.PATTERN111:return(t*r%3+(t+r)%2)%2==0
default:throw new Error("bad maskPattern:"+e)}},getErrorCorrectPolynomial:function(e){for(var t=new a([1],0),r=0;r<e;r++)t=t.multiply(new a([1,i.gexp(r)],0))
return t},getLengthInBits:function(e,t){if(1<=t&&t<10)switch(e){case n.MODE_NUMBER:return 10
case n.MODE_ALPHA_NUM:return 9
case n.MODE_8BIT_BYTE:return 8
case n.MODE_KANJI:return 8
default:throw new Error("mode:"+e)}else if(t<27)switch(e){case n.MODE_NUMBER:return 12
case n.MODE_ALPHA_NUM:return 11
case n.MODE_8BIT_BYTE:return 16
case n.MODE_KANJI:return 10
default:throw new Error("mode:"+e)}else{if(!(t<41))throw new Error("type:"+t)
switch(e){case n.MODE_NUMBER:return 14
case n.MODE_ALPHA_NUM:return 13
case n.MODE_8BIT_BYTE:return 16
case n.MODE_KANJI:return 12
default:throw new Error("mode:"+e)}}},getLostPoint:function(e){for(var t=e.getModuleCount(),r=0,n=0;n<t;n++)for(var a=0;a<t;a++){for(var i=0,o=e.isDark(n,a),s=-1;s<=1;s++)if(!(n+s<0||t<=n+s))for(var c=-1;c<=1;c++)a+c<0||t<=a+c||0==s&&0==c||o==e.isDark(n+s,a+c)&&i++
i>5&&(r+=3+i-5)}for(var n=0;n<t-1;n++)for(var a=0;a<t-1;a++){var l=0
e.isDark(n,a)&&l++
e.isDark(n+1,a)&&l++
e.isDark(n,a+1)&&l++
e.isDark(n+1,a+1)&&l++
0!=l&&4!=l||(r+=3)}for(var n=0;n<t;n++)for(var a=0;a<t-6;a++)e.isDark(n,a)&&!e.isDark(n,a+1)&&e.isDark(n,a+2)&&e.isDark(n,a+3)&&e.isDark(n,a+4)&&!e.isDark(n,a+5)&&e.isDark(n,a+6)&&(r+=40)
for(var a=0;a<t;a++)for(var n=0;n<t-6;n++)e.isDark(n,a)&&!e.isDark(n+1,a)&&e.isDark(n+2,a)&&e.isDark(n+3,a)&&e.isDark(n+4,a)&&!e.isDark(n+5,a)&&e.isDark(n+6,a)&&(r+=40)
for(var u=0,a=0;a<t;a++)for(var n=0;n<t;n++)e.isDark(n,a)&&u++
var p=Math.abs(100*u/t/t-50)/5
r+=10*p
return r}}
e.exports=s},432:function(e,t,r){"use strict"
function n(e){return e.webkitBackingStorePixelRatio||e.mozBackingStorePixelRatio||e.msBackingStorePixelRatio||e.oBackingStorePixelRatio||e.backingStorePixelRatio||1}var a,i=r(2),o=r(429),s=r(333),c=i.version.split(/[.-]/)
a="0"===c[0]&&"13"===c[1]||"12"===c[1]?function(e){return e.getDOMNode()}:function(e){return e}
var l=i.createClass({displayName:"QRCode",propTypes:{value:i.PropTypes.string.isRequired,size:i.PropTypes.number,level:i.PropTypes.oneOf(["L","M","Q","H"]),bgColor:i.PropTypes.string,fgColor:i.PropTypes.string},getDefaultProps:function(){return{size:128,level:"L",bgColor:"#FFFFFF",fgColor:"#000000"}},shouldComponentUpdate:function(e){var t=this
return Object.keys(l.propTypes).some(function(r){return t.props[r]!==e[r]})},componentDidMount:function(){this.update()},componentDidUpdate:function(){this.update()},update:function(){var e=this.props,t=e.value,r=e.size,i=e.level,c=e.bgColor,l=e.fgColor,u=new o(-1,s[i])
u.addData(t)
u.make()
var p=a(this.refs.canvas),d=p.getContext("2d"),m=u.modules,h=r/m.length,g=r/m.length,f=(window.devicePixelRatio||1)/n(d)
p.height=p.width=r*f
d.scale(f,f)
m.forEach(function(e,t){e.forEach(function(e,r){d.fillStyle=e?l:c
var n=Math.ceil((r+1)*h)-Math.floor(r*h),a=Math.ceil((t+1)*g)-Math.floor(t*g)
d.fillRect(Math.round(r*h),Math.round(t*g),n,a)})})},render:function(){return i.createElement("canvas",{style:{height:this.props.size,width:this.props.size},height:this.props.size,width:this.props.size,ref:"canvas"})}})
e.exports=l},740:function(e,t,r){(function(n){"use strict"
function a(e){return e&&e.__esModule?e:{default:e}}function i(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function o(e,t){if(!e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called")
return!t||"object"!=typeof t&&"function"!=typeof t?e:t}function s(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function, not "+typeof t)
e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}})
t&&(Object.setPrototypeOf?Object.setPrototypeOf(e,t):e.__proto__=t)}Object.defineProperty(t,"__esModule",{value:!0})
t.default=void 0
var c=function(){var e="function"==typeof Symbol&&Symbol.for&&Symbol.for("react.element")||60103
return function(t,r,n,a){var i=t&&t.defaultProps,o=arguments.length-3
r||0===o||(r={})
if(r&&i)for(var s in i)void 0===r[s]&&(r[s]=i[s])
else r||(r=i||{})
if(1===o)r.children=a
else if(o>1){for(var c=Array(o),l=0;l<o;l++)c[l]=arguments[l+3]
r.children=c}return{$$typeof:e,type:t,key:void 0===n?null:""+n,ref:null,props:r,_owner:null}}}(),l=function(){function e(e,t){for(var r=0;r<t.length;r++){var n=t[r]
n.enumerable=n.enumerable||!1
n.configurable=!0
"value"in n&&(n.writable=!0)
Object.defineProperty(e,n.key,n)}}return function(t,r,n){r&&e(t.prototype,r)
n&&e(t,n)
return t}}(),u=r(2),p=a(u),d=r(3),m=a(d),h=r(14),g=a(h),f=function(e){function t(e){i(this,t)
var r=o(this,(t.__proto__||Object.getPrototypeOf(t)).call(this,e))
r._onClickLink=r._onClickLink.bind(r)
return r}s(t,e)
l(t,[{key:"componentDidMount",value:function(){"terms-and-conditions"===m.default.url().param("open")&&g.default.openDialog("termsDialog")}},{key:"_onClickLink",value:function(){this.props.onClickLink?this.props.onClickLink():g.default.openDialog("termsDialog")}},{key:"_onClickOpenSettings",value:function(){g.default.openPageSettings({tabName:"legal"})}},{key:"render",value:function(){var e="s-terms-link "+(this.props.className||"")
return c("div",{className:e,style:{position:"relative"}},void 0,!1,c("a",{className:"s-common-link",onClick:this._onClickLink,target:"_blank"},void 0,n("EditorSettings|Terms & Conditions")))}}])
return t}(p.default.Component)
t.default=f
e.exports=t.default}).call(t,r(5))},856:function(e,t,r){"use strict"
function n(e){return e&&e.__esModule?e:{default:e}}function a(){var e={}
try{e=JSON.parse(d.default.getItem("__strk_shopping_cart"))
delete e.shipping.states
delete e.shipping.citys
delete e.shipping.countys}catch(e){console.error("出现了未知的错误，请联系我们的客服人员")}return e}function i(e,t){return{appid:$S.stores.pageMeta.ecommerce.seller_wechat_app_id,redirect_uri:e,response_type:"code",scope:t||"snsapi_base"}}function o(){var e="https://open.weixin.qq.com/connect/oauth2/authorize?",t=a(),r=f.transformToParamsWithMap(t),n=""
n=h.default.getRollout("new_wechat_oauth")?"https://www."+(0,g.getConfig)("bobcat").baseUrl+"/mp/wechat_auth?"+r+"&open_payment_dialog=true&site_id="+u.default.getId():"https://www."+(0,g.getConfig)("bobcat").baseUrl+"/s/wechat_auth?"+r+"&open_payment_dialog=true&site_id="+u.default.getId()
var o=i(encodeURIComponent(n)),s=f.transformToParamsWithMap(o)
return""+e+s+"#wechat_redirect"}Object.defineProperty(t,"__esModule",{value:!0})
t.getWxConfForOauth=i
t.getOauthUri=o
var s=r(116),c=n(s),l=r(4),u=n(l),p=r(117),d=n(p),m=r(7),h=n(m),g=r(927),f=(0,c.default)(location.href)},863:function(e,t,r){(function(n){"use strict"
function a(e){return e&&e.__esModule?e:{default:e}}function i(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function o(e,t){if(!e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called")
return!t||"object"!=typeof t&&"function"!=typeof t?e:t}function s(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function, not "+typeof t)
e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}})
t&&(Object.setPrototypeOf?Object.setPrototypeOf(e,t):e.__proto__=t)}Object.defineProperty(t,"__esModule",{value:!0})
t.default=void 0
var c=function(){var e="function"==typeof Symbol&&Symbol.for&&Symbol.for("react.element")||60103
return function(t,r,n,a){var i=t&&t.defaultProps,o=arguments.length-3
r||0===o||(r={})
if(r&&i)for(var s in i)void 0===r[s]&&(r[s]=i[s])
else r||(r=i||{})
if(1===o)r.children=a
else if(o>1){for(var c=Array(o),l=0;l<o;l++)c[l]=arguments[l+3]
r.children=c}return{$$typeof:e,type:t,key:void 0===n?null:""+n,ref:null,props:r,_owner:null}}}(),l=function(){function e(e,t){for(var r=0;r<t.length;r++){var n=t[r]
n.enumerable=n.enumerable||!1
n.configurable=!0
"value"in n&&(n.writable=!0)
Object.defineProperty(e,n.key,n)}}return function(t,r,n){r&&e(t.prototype,r)
n&&e(t,n)
return t}}(),u=r(2),p=a(u),d=r(426),m=a(d),h=function(e){function t(e){i(this,t)
var r=o(this,(t.__proto__||Object.getPrototypeOf(t)).call(this,e))
r._onClickBack=r._onClickBack.bind(r)
return r}s(t,e)
l(t,[{key:"_onClickBack",value:function(){this.props.gotoPanel("singleProductPanel")}},{key:"render",value:function(){return c("div",{className:"ecommerce-terms buy-panel"},void 0,c("div",{className:"s-font-title title"},void 0,c("div",{className:"s-btn gray left-arrow",onClick:this._onClickBack},void 0,c("i",{className:"fa fa-angle-left"}),n("Back")),c("div",{className:"text"},void 0,n("EditorSettings|Terms & Conditions"))),c(m.default,{}))}}])
return t}(p.default.Component)
t.default=h
e.exports=t.default}).call(t,r(5))},864:function(e,t,r){(function(n){"use strict"
function a(e){if(e&&e.__esModule)return e
var t={}
if(null!=e)for(var r in e)Object.prototype.hasOwnProperty.call(e,r)&&(t[r]=e[r])
t.default=e
return t}function i(e){return e&&e.__esModule?e:{default:e}}function o(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function s(e,t){if(!e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called")
return!t||"object"!=typeof t&&"function"!=typeof t?e:t}function c(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function, not "+typeof t)
e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}})
t&&(Object.setPrototypeOf?Object.setPrototypeOf(e,t):e.__proto__=t)}Object.defineProperty(t,"__esModule",{value:!0})
t.default=void 0
var l,u,p=function(){var e="function"==typeof Symbol&&Symbol.for&&Symbol.for("react.element")||60103
return function(t,r,n,a){var i=t&&t.defaultProps,o=arguments.length-3
r||0===o||(r={})
if(r&&i)for(var s in i)void 0===r[s]&&(r[s]=i[s])
else r||(r=i||{})
if(1===o)r.children=a
else if(o>1){for(var c=Array(o),l=0;l<o;l++)c[l]=arguments[l+3]
r.children=c}return{$$typeof:e,type:t,key:void 0===n?null:""+n,ref:null,props:r,_owner:null}}}(),d=function(){function e(e,t){for(var r=0;r<t.length;r++){var n=t[r]
n.enumerable=n.enumerable||!1
n.configurable=!0
"value"in n&&(n.writable=!0)
Object.defineProperty(e,n.key,n)}}return function(t,r,n){r&&e(t.prototype,r)
n&&e(t,n)
return t}}(),m=r(2),h=i(m),g=r(182),f=i(g),y=r(40),v=i(y),E=r(4),_=i(E),C=r(15),b=a(C),P=r(1),N=i(P),w=r(432),k=(b.cdnAssetPath("/images/ecommerce/alipay-logo.png"),b.cdnAssetPath("/images/ecommerce/wechatpay.png"),u=l=function(e){function t(){o(this,t)
return s(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}c(t,e)
d(t,[{key:"componentDidMount",value:function(){var e=this,t=e.props.orderToken
f.default.orders.complete({pageId:_.default.getId(),orderToken:t,success:function(){e.props.gotoPanel("confirm")
v.default.clearShoppingCart()},error:function(e){console.log(e)}})}},{key:"_onClickGotoPrevPanel",value:function(){this.props.gotoPanel("orderPreview")}},{key:"render",value:function(){var e=this.props,t=e.chargeInfo,r=e.provider,a=r.toLowerCase().indexOf("alipay")!==-1,i=a?"支付宝":"微信",o=a?"#00a9f2":"#00ca00"
if(!t)return null
t=JSON.parse(t)
var s="wechatpay"===r?r:N.default.snakeCase(r).substr(7)
return p("div",{className:"buy-panel payment-panel"},void 0,p("div",{className:"s-btn gray mobile-back left-arrow",onClick:this._onClickGotoPrevPanel.bind(this)},void 0,p("i",{className:"fa fa-angle-left"}),n("Back")),p("h4",{style:{textAlign:"center",paddingBottom:"25px"}},void 0,i+"扫码支付"),p("div",{className:"qr-image",style:{textAlign:"center"}},void 0,p(w,{value:t.credential[s],size:200})),p("div",{className:"additional",style:{width:"100%",textAlign:"center",paddingTop:"20px",margin:"0 auto",display:"table"}},void 0,p("span",{style:{padding:"0 2px",color:o,border:"solid 1px "+o,borderRadius:"1px",fontWeight:"300"}},void 0,a?"由支付宝提供安全支付保障":"由微信提供安全支付保障"),p("p",{style:{color:"#52616a",fontWeight:"300",padding:"37px 0 10px 0"}},void 0,a?"请打开支付宝点击扫一扫":"请打开微信扫一扫功能：[发现] - [扫一扫]")))}}])
return t}(h.default.Component),l.defaultProps={provider:"",chargeInfo:""},u)
t.default=k
e.exports=t.default}).call(t,r(5))},897:function(e,t,r){(function(t){"use strict"
var n,a,i,o
i=r(2)
a=r(16)
n=r(8)
o=r(39)
e.exports=n.create({displayName:"EcommerceInput",propTypes:{value:i.PropTypes.string,errorTrigger:i.PropTypes.bool,binding:i.PropTypes.object,styleClass:i.PropTypes.string,messageClass:i.PropTypes.string,checkPattern:i.PropTypes.object,placeholder:i.PropTypes.string,errorText:i.PropTypes.string,hideError:i.PropTypes.bool,errorStateChangeCb:i.PropTypes.func},getDefaultProps:function(){return{value:"",errorTrigger:!1,styleClass:"",messageClass:"",errorText:t("Ecommerce|Invalid value."),hideError:!1,errorStateChangeCb:function(){}}},componentWillMount:function(){return this._lastErrorState=this._isError()},componentDidUpdate:function(){var e,t
t=this._isError()
if(this._lastErrorState!==t){this._lastErrorState=t
return"function"==typeof(e=this.props).errorStateChangeCb?e.errorStateChangeCb(t):void 0}},_getClassName:function(){return o(this.props.styleClass,{error:this._isError(),disabled:this.props.disabled})},_isError:function(){return!(!this.props.errorTrigger||!this.props.checkPattern)&&!this.props.checkPattern.test(this.props.value)},_onChange:function(e){return this.updateData({value:e.target.value})},_onBlur:function(){var e
"function"==typeof(e=this.props).onBlur&&e.onBlur()
return this.updateData({errorTrigger:!0})},_onFoucus:function(){var e
return"function"==typeof(e=this.props).onFocus?e.onFocus():void 0},render:function(){return i.createElement("div",{className:"input"},i.createElement(a.DOM.input,Object.assign({type:"text",className:this._getClassName(),value:this.getData("value"),placeholder:this.props.placeholder,onFocus:this._onFoucus,onBlur:this._onBlur,onChange:this._onChange},this.props)),this._isError()&&!this.props.hideError?i.createElement("div",{className:"error-message"},this.props.errorText):void 0)}})}).call(t,r(5))},898:function(e,t,r){(function(t){"use strict"
var n,a,i,o,s
o=r(2)
s=r(68)
a=r(35)
n=r(40)
i=r(4)
e.exports=o.createClass({displayName:"EcommerceBuyOrderConfirm",bobcatPropTypes:a.BUY_PANEL_PROP_TYPES,componentWillMount:function(){return n.clearShoppingCart()},_getEstimatedDelivery:function(){var e,t
t=this.props.settings.estimatedDelivery
e=i.getForcedLocale()
return s(t).locale(e).format("MMMM YYYY")},_onClickClose:function(){return this.props.closeDialog()},render:function(){var e
e=this.props.settings.estimatedDelivery
return o.createElement("div",{className:"buy-panel confirm no-extend"},o.createElement("div",{className:"confirm"},o.createElement("div",{className:"title"},t("Ecommerce|Thank you for your order!")),o.createElement("div",{className:"message"},t("Ecommerce|Your order has been placed!")+" ",e?o.createElement("span",{className:"bold"},t("Ecommerce|The estimated delivery is: %{delivery}.",{delivery:this._getEstimatedDelivery()})+" "):void 0,t("Ecommerce|Order details will be emailed to you shortly.")),o.createElement("div",{className:"s-btn green",onClick:this._onClickClose},t("Ecommerce|Got it!"))))}})}).call(t,r(5))},899:function(e,t,r){(function(t){"use strict"
var n,a,i,o,s,c,l,u,p
c=r(2)
s=r(16)
l=r(1)
u=r(39)
n=r(8)
a=r(54)
i=r(35)
o=r(53)
p=r(15)
e.exports=n.createPageComponent({displayName:"EcommerceBuyOrderItem",observedProps:["settings","accounts"],bobcatPropTypes:{data:{product:c.PropTypes.object,productId:c.PropTypes.number,orderItem:c.PropTypes.object,isDeleted:c.PropTypes.bool,binding:c.PropTypes.object,settings:c.PropTypes.object},designer:{canBuy:c.PropTypes.bool},callbacks:{deleteItem:c.PropTypes.func}},getBobcatDefaultProps:function(){return{data:{isDeleted:!1,canBuy:!0}}},componentWillMount:function(){this._getDeleteItemFn=this.boundParamsMemoizer(this.cbProps.deleteItem,this)
return this._getOnClickAddQuantityFn=this.boundParamsMemoizer(this._onClickAddQuantity,this)},_isQuantityEnough:function(){var e
e=l.find(this.dtProps.product.variations,function(e){return function(t){return t.id===e.dtProps.orderItem.id}}(this))
return null!=e&&(this.dtProps.orderItem.quantity<=e.quantity||e.quantity===-1)},_hasDiscount:function(){var e
e=a.getCart().coupon
return"percentage"===e.category&&parseInt(this.dtProps.productId)===parseInt(e.option.condition.productId)},_getDiscountInfo:function(){var e,r
e=a.getCart().coupon
r=this.props.removeCoupon
return c.createElement("div",null,t("EcommerceCoupon|Coupon")," ",c.createElement("strong",null,e.token)," ","(",o.getDiscountDescription(),")",c.createElement("a",{onClick:r,style:{marginLeft:"10px"}},t("EcommerceCoupon|Remove")))},_getPrice:function(){return o.addCurrencySymbol(this.dtProps.orderItem.quantity*this.dtProps.orderItem.price)},_getOffedPrice:function(){return o.addCurrencySymbol(this.dtProps.orderItem.quantity*this.dtProps.orderItem.price*((100-a.getCart().coupon.option.amount)/100))},_getErrorText:function(){var e
e=l.find(this.dtProps.product.variations,function(e){return function(t){return t.id===e.dtProps.orderItem.id}}(this))
return 0===e.quantity?t("Ecommerce|Out of stock"):t("Ecommerce|Only %{quantity} in stock",{quantity:e.quantity})},_getProductImage:function(){var e
return(null!=(e=this.dsProps.product.picture[0])?e.thumbnailUrl:void 0)||p.cdnAssetPath(i.DEFAULT_PRODUCT_IMAGE)},_onClickAddQuantity:function(e){return this.setData("orderItem.quantity",this.dtProps.orderItem.quantity+e)},_onChangeQuantity:function(e){var t
t=e.target.value
if(/^(\d+)?$/.test(t)){t=+t||1
return this.setData("orderItem.quantity",t)}},render:function(){var e,r
e=this._getErrorText()
r=this._getPrice()
return c.createElement("div",{className:u("buy-order-item",{"buy-order-item":this.dtProps.isDeleted})},c.createElement("div",{className:"fa fa-trash-o buy-order-item-delete",onClick:this._getDeleteItemFn(this.dtProps.orderItem.id)}),c.createElement("img",{src:this._getProductImage()}),c.createElement("div",{className:"buy-order-item-info ib"},c.createElement("div",{className:"buy-order-item-info-description"},this.dtProps.product.name),"default"!==this.dtProps.orderItem.name?c.createElement("div",{className:"buy-order-item-info-variation"},this.dtProps.orderItem.name):void 0,this._hasDiscount()?c.createElement("div",{className:"buy-order-item-info-discount"},this._getDiscountInfo()):void 0),c.createElement("div",{className:"buy-order-item-quantity-wrapper number-input-wrapper ib"},c.createElement("div",{className:u("minus-icon",{disable:this.dtProps.orderItem.quantity<=1}),onClick:this.dtProps.orderItem.quantity>1?this._onClickAddQuantity.bind(this,-1):null},"-"),c.createElement("input",{type:"text",maxLength:"3",className:"quantity",value:this.dtProps.orderItem.quantity,onChange:this._onChangeQuantity}),c.createElement("div",{className:"plus-icon",onClick:this._getOnClickAddQuantityFn(1)},"+"),this.dtProps.isDeleted?c.createElement("div",{className:"error-text"},t("Ecommerce|Not exists. Please delete this item.")):this._isQuantityEnough()?void 0:c.createElement("div",{className:"error-text"},e)),c.createElement("div",{className:u("buy-order-item-price",{"has-discount":this._hasDiscount()})},c.createElement("div",{className:"old-price"},r),this._hasDiscount()?c.createElement("div",{className:"new-price"},this._getOffedPrice()):void 0))}})}).call(t,r(5))},900:function(e,t,r){(function(t){"use strict"
var n,a,i,o,s,c,l,u,p,d,m,h,g,f,y,v,E,_=[].indexOf||function(e){for(var t=0,r=this.length;t<r;t++)if(t in this&&this[t]===e)return t
return-1}
g=r(2)
v=r(1)
a=r(8)
s=r(40)
c=r(182)
l=r(35)
y=r(116)
h=r(4)
p=r(29)
i=r(7)
m=r(19)
f=r(903)
d=r(902)
n=r(901)
o=r(18)
u=r(53)
E=r(49)
e.exports=a.createPageComponent({displayName:"EcommerceBuyOrderPreview",observedProps:["settings","accounts"],bobcatPropTypes:l.BUY_PANEL_PROP_TYPES,mixins:[m("ecommerceBuyCheckout")],componentWillMount:function(){var e,t,n,a,i,s
this.initMeta({loading:!1,charging:!1})
t=null!=(a=this.getData("orderData"))&&null!=(i=a.toJS())?i.orderToken:void 0
if(o.isWechat()){s=decodeURIComponent("undefined"!=typeof location&&null!==location?location.href:void 0)
n=y(s).getParam("paymentMethod")
"pingppWxPub"===n&&this.updateData({paymentMethod:n})}if(t)switch(this.getData("orderData.provider")){case"stripe":this._setLoading(!0)
E.waitFor(function(){return null!=window.StripeCheckout},function(e){return function(){return e._prepareStripe(e.getData("orderData").toJS())}}(this))}t||this.getData("paymentMethod")&&this._createOrder(this.getData("paymentMethod"))
e=r(47)
return e.trackPageEventOnFB("AddPaymentInfo",u.getTrackData())},_isProductDataReady:function(){var e
return!!(null!=(e=this.getData().toJS().items[0])?e.product:void 0)},_hasShippingInfo:function(){var e,t,r,n
n=this.getData().toJS().items
for(e=0,r=n.length;e<r;e++){t=n[e]
if(t.product.shippingInfo)return!0}return!1},_getOrderSendingData:function(e){var t,r,n,a,i,s,c,l,u
l=y(location.href)
try{i=l.getParam("open_payment_dialog")
u=l.getParam("buyer_open_id")}catch(e){}s=u?l.paramsToMap():this.getData().toJS()
c=s.shipping
a=s.items
r=s.coupon
n={coupon:r.token,email:c.email.value,gateway:function(){switch(e){case"stripe":return"stripe_connect"
case"paypal":return"paypal"
case"alipay":return"alipay"
case"wechatpay":return"wechatpay"
case"pingppAlipayWap":return"pingpp_alipay_wap"
case"pingppAlipayQr":return"pingpp_alipay_qr"
case"pingppWxPub":return"pingpp_wx_pub"
case"pingppWxPubQr":return"pingpp_wx_pub_qr"}}(),orderItems:a.map(function(e){return{id:e.orderItem.id,quantity:e.orderItem.quantity}})}
"wechatpay"===e&&(n.inWechat=!!o.isWechat())
n.shipping={firstName:c.firstName.value,lastName:c.lastName.value,phone:c.phone.value}
u&&(n.buyer_open_id=u)
t=c.county.value||""
this._hasShippingInfo()&&(n.shipping=v.extend(n.shipping,{country:c.country.value,city:c.city.value,state:c.state.value,line1:t+c.address.value,zip:c.zip.value}))
c.notes.value&&(n.notes=c.notes.value)
return n},_getCheckProps:function(){var e
e=this.getData().toJS()
e.settings=this.props.settings
return v.extend(e,{payWithCard:this._payWithCard,adjustHeight:this.props.adjustHeight,loading:this._getLoading(),charging:this._getCharging,cancelOrder:this._cancelOrder,gotoPanel:this.props.gotoPanel})},_prepareStripe:function(e){var t,r
t={key:e.stripePublishableKey,locale:"auto",currency:this.props.settings.currencyCode,token:function(t){return function(r){return t._chargeStripeOrder(r,e)}}(this),amount:(r=this.props.settings.currencyCode,_.call(l.ZERO_DECIMAL_CURRENCY_LIST,r)>=0?e.total/100:e.total),opened:function(e){return function(){e.props.closeDialog()
return e.props.gotoPanel("waiting")}}(this),closed:function(e){return function(){e.props.openDialog()
if(!e._getCharging())return e.props.gotoPanel("orderPreview")}}(this)}
i.getEcommerceStripeAlipay()&&(t.alipay="true")
this._stripeHandler=window.StripeCheckout.configure(t)
return this._setLoading(!1)},_chargeStripeOrder:function(e,n){this._setCharging(!0)
return c.orders.charge({rest:!0,pageId:h.getId(),data:JSON.stringify({orderToken:n.orderToken,stripeToken:e.id,stripeEmail:e.email,clientIp:e.client_ip,stripeTokenType:e.type,card:e.card}),success:function(e){return function(){var t
e._setCharging(!1)
e._resetOrderItem()
e.props.openDialog()
e.props.gotoPanel("confirm")
t=r(47)
t.trackGAEcommerce()
return t.trackPageEventOnFB("Purchase",u.getTrackData())}}(this),error:function(e){return function(r){var n,a
e._setCharging(!1)
e._resetOrderItem()
e.props.closeDialog()
return alert((null!=(n=r.responseJSON.meta)&&null!=(a=n.userMessage)?a.plain:void 0)||t("Ecommerce|This order is expired, can not be charged. Please refresh!"))}}(this)})},_createOrder:function(e){this._setLoading(!0)
return c.orders.create({rest:!0,pageId:h.getId(),data:JSON.stringify(this._getOrderSendingData(e)),success:function(r){return function(n){var a,i,o,s
s=n.data
s.provider=e
o=s.chargeUrl
i=s.chargeInfo
if("stripe"!==e&&!i&&!o||null!=i&&i.error)alert(t("Ecommerce|Looks like there is an error with your payment! Please contact the website owner."))
else{a=JSON.parse(i)
s.startTime=(new Date).getTime()
r.updateData({orderData:s})
r._setLoading(!1)
switch(e){case"stripe":r._setLoading(!0)
return E.waitFor(function(){return null!=window.StripeCheckout},function(){return r._prepareStripe(s)},50)}}}}(this),error:function(e){return function(r){e._setLoading(!1)
return 400===r.status?r.responseJSON.data.errors.indexOf("is not enough")!==-1?alert(t("Ecommerce|Sorry! The item in your shopping cart has just sold out. Please refresh your page!")):alert(t("Ecommerce|Seller has not connected his/her payment gateway. Can not buy now.")):alert(t("Ecommerce|There has been an error. Our engineers are looking into it now. Please retry!"))}}(this)})},_resetOrderItem:function(){s.clearShoppingCart()
return s.getEcommerceProducts({pageId:h.getId()})},_payWithCard:function(){var e
null!=(e=this._stripeHandler)&&e.open()
return this.props.changeDialogExtendState(!1)},_cancelOrder:function(){var e
if(o.isWechat()&&"pingppWxPub"===this.getData("paymentMethod")){window.location.href=window.location.href.split(location.search)[0]+"#"
this._resetOrderItem()}else{this._resetOrderItem()
this.props.closeDialog()}e=r(47)
return e.trackEcommerceBuyerEvent(i.getKeenIoEcommerceBuyerCanceledOrder(),{order:this.getData("orderData").readableNumber})},render:function(){return this._isProductDataReady()?g.createElement("div",{className:"order-preview buy-panel"},g.createElement("div",{className:"shipping-info"},g.createElement("div",{className:"title"},t("Ecommerce|Shipping Details")),g.createElement(f,Object.assign({},this.props))),g.createElement("div",{className:"order-info"},g.createElement("div",{className:"title"},t("Ecommerce|Your Order")),g.createElement(d,Object.assign({loading:this._getLoading()},this.props))),g.createElement(n,Object.assign({},this._getCheckProps()))):null}})}).call(t,r(5))},901:function(e,t,r){(function(t){"use strict"
var n,a,i,o,s,c,l,u,p,d,m={}.hasOwnProperty
s=r(2)
l=r(1)
p=r(68)
d=r(2168)
n=r(40)
a=r(53)
u=r(15)
c=r(17)
o=r(4)
i=r(29)
e.exports=s.createClass({displayName:"exports",_hasMultiplePaymentMethods:function(){return this.props.settings.paymentGatewaysCount>1},_getChargeUrl:function(){var e,t
t=null!=(e=this.props.orderData)?e.chargeUrl:void 0
return c.hasProtocol(t)?t:""},_getEstimatedDelivery:function(){var e
e=this.props.settings.estimatedDelivery
return p(e).format("MMMM YYYY")},_doMobilePayment:function(){var e,t,r
e=JSON.parse(null!=(t=this.props.orderData)?t.chargeInfo:void 0)
r=this
return d.createPayment(e,function(e){if("success"===e){r.props.gotoPanel("confirm")
return n.clearShoppingCart()}if("fail"===e){alert("微信支付发生了错误，请联系网站管理员")
r.props.closeDialog()
return n.clearShoppingCart()}if("cancel"===e)return console.log("微信支付已取消")})},_onClickPayWithCard:function(){return this.props.payWithCard()},_onClickShowRedirectMessage:function(){var e,t
if(0!==(null!=(t=this.props.orderData)?t.total:void 0)||this._getChargeUrl()){window.document.location.href=this._getChargeUrl()
return this.props.gotoPanel("redirecting")}this.props.gotoPanel("confirm")
e=r(47)
return e.trackGAEcommerce()},_onClickPaymentButton:function(){var e,t,r,i,s,c,u,p
r=null!=(i=this.props.orderData)?i.provider:void 0
if(r.toLowerCase().indexOf("qr")!==-1)return this.props.gotoPanel("paymentqr")
if(r.toLowerCase().indexOf("qr")===-1&&r.toLowerCase().indexOf("pingpp")!==-1)return this._doMobilePayment()
if("wechatpay"===r){p=this.props.orderData.chargeUrl
for(t in p)if(m.call(p,t)){u=p[t]
p[t]=u.toString()}e=l.assign({appId:null!=(s=o.getSellerWechatAppId())?s.toString():void 0},p)
c=this
return a.useWechatpay(e,function(){c.props.gotoPanel("confirm")
return n.clearShoppingCart()})}},render:function(){var e,r,n,a,i,o,c,l,p,d,m,h,g,f,y,v,E
n=this.props.settings.estimatedDelivery
r=this._hasMultiplePaymentMethods()
v=t("Ecommerce|Checkout")
E=t("Ecommerce|Pay with PayPal")
f=t("Ecommerce|Pay with Alipay")
y=t("Ecommerce|Pay with card")
e=this._getChargeUrl()||"javascript:void(0);"
return s.createElement("div",{className:"bottom"},this.props.paymentMethod||(null!=(a=this.props.orderData)?a.provider:void 0)?s.createElement("div",{className:"warning"},s.createElement("span",{style:{paddingRight:"20px"}},t("Ecommerce|Your order will be reserved for 10 minutes"))):void 0,n?s.createElement("div",{className:"ship-warning"},s.createElement("div",null,t("Ecommerce|Ships %{delivery}.",{delivery:this._getEstimatedDelivery()})),t("Ecommerce|You will be charged at checkout and notified once your order ships. Thank you for your support!")):void 0,this.props.paymentMethod||(null!=(i=this.props.orderData)?i.provider:void 0)?s.createElement("div",{style:{marginTop:"10px"}},this.props.loading?void 0:s.createElement("div",{className:"cancel-order left",onClick:this.props.cancelOrder},t("Ecommerce|Cancel Order")),this.props.loading?s.createElement("div",{className:"s-btn gray right"},s.createElement("div",{className:"fa fa-spinner fa-spin",style:{marginRight:"5px"}}),s.createElement("span",null,t("Ecommerce|Preparing Order"))):"stripe"===(null!=(o=this.props.orderData)?o.provider:void 0)?s.createElement("div",{className:"right s-btn green",onClick:this._onClickPayWithCard},s.createElement("span",null,r?v:y)):"paypal"===(null!=(c=this.props.orderData)?c.provider:void 0)?s.createElement("a",{style:{color:"#fff"},href:e,onClick:this._onClickShowRedirectMessage},s.createElement("div",{className:"s-btn right paypal-pay"},s.createElement("i",{className:"fa fa-paypal"}),s.createElement("span",null,E))):"alipay"===(null!=(l=this.props.orderData)?l.provider:void 0)?s.createElement("a",{style:{color:"#fff"},href:e,onClick:this._onClickShowRedirectMessage},s.createElement("div",{className:"right"},s.createElement("img",{src:u.cdnAssetPath("/images/ecommerce/alipay-pay.png"),style:{verticalAlign:"top",height:"36px",marginRight:"5px"}}),s.createElement("div",{className:"s-btn alipay-pay"},s.createElement("span",null,f)))):"wechatpay"===(null!=(p=this.props.orderData)?p.provider:void 0)?s.createElement("a",{style:{color:"#fff"},href:e,onClick:this._onClickPaymentButton},s.createElement("div",{className:"right"},s.createElement("img",{src:u.cdnAssetPath("/images/ecommerce/logo-tiny-wechatpay.png"),style:{verticalAlign:"top",height:"36px",marginRight:"5px"}}),s.createElement("div",{className:"s-btn"},s.createElement("span",null,"微信支付")))):(null!=(d=this.props.orderData)&&null!=(m=d.provider)?m.toLowerCase().indexOf("pingppalipay"):void 0)!==-1?s.createElement("a",{style:{color:"#fff"},href:e,onClick:this._onClickPaymentButton},s.createElement("div",{className:"right"},s.createElement("img",{src:u.cdnAssetPath("/images/ecommerce/alipay-pay.png"),style:{verticalAlign:"top",height:"36px",marginRight:"5px"}}),s.createElement("div",{className:"s-btn alipay-pay"},s.createElement("span",null,"支付宝支付")))):(null!=(h=this.props.orderData)&&null!=(g=h.provider)?g.toLowerCase().indexOf("wx"):void 0)!==-1?s.createElement("a",{style:{color:"#1ac823"},href:e,onClick:this._onClickPaymentButton},s.createElement("div",{className:"right"},s.createElement("img",{src:u.cdnAssetPath("/images/ecommerce/logo-tiny-wechatpay.png"),style:{verticalAlign:"top",height:"36px",marginRight:"5px"}}),s.createElement("div",{className:"s-btn",style:{background:"#1ac823"}},s.createElement("span",null,"微信支付")))):void 0):void 0)}})}).call(t,r(5))},902:function(e,t,r){(function(t){"use strict"
var n,a,i,o,s,c
o=r(2)
s=r(1)
a=r(35)
n=r(54)
i=r(53)
c=r(15)
e.exports=o.createClass({displayName:"exports",_hasDiscount:function(){var e
return null!=(null!=(e=n.getCart().coupon)?e.category:void 0)},_getCurrencyType:function(){return this.props.settings.currencyData.symbol},_renderItemList:function(){var e,r,s
e=function(){return function(e){return o.createElement("div",null,e.orderItem.quantity," × ",o.createElement("span",{className:"old-price"},i.addCurrencySymbol(e.orderItem.price)))}}(this)
r=function(){return function(e){return i.addCurrencySymbol(e.orderItem.quantity*e.orderItem.price*((100-n.getCart().coupon.option.amount)/100))}}(this)
s=function(){return function(e){var t
t=n.getCart().coupon
return"percentage"===t.category&&parseInt(e.productId)===parseInt(t.option.condition.productId)}}(this)
return this.props.items.map(function(l,u){var p,d
p=(null!=(d=l.product.picture[0])?d.thumbnailUrl:void 0)||c.cdnAssetPath(a.DEFAULT_PRODUCT_IMAGE)
return o.createElement("div",{className:"buy-order-item",key:u},o.createElement("img",{src:p}),o.createElement("div",{className:"buy-order-item-info ib"},o.createElement("div",{className:"buy-order-item-info-description"},l.product.name),"default"!==l.orderItem.name?o.createElement("div",{className:"buy-order-item-info-variation"},l.orderItem.name):void 0,s(l)?o.createElement("div",{className:"buy-order-item-info-discount"},t("EcommerceCoupon|Coupon")," ",o.createElement("strong",null,n.getCart().coupon.token)," ","(",i.getDiscountDescription(),")"):void 0),o.createElement("div",{className:"buy-order-item-price "+(s(l)?"has-discount":"")},e(l),s(l)?o.createElement("div",{className:"new-price"},r(l)):void 0))})},_renderDescription:function(){var e,r,a,s,c
c=i.getShippingFeeNum()
a=i.userHasCouponWithType("free_shipping")
s=this.props.loading
r=i.getDiscountDescription()
e=i.getDiscount()
return o.createElement("div",{className:"buy-order-shipping"},o.createElement("span",{className:"buy-order-shipping-label"},t("EcommerceCoupon|Coupon"))," ",o.createElement("strong",null,n.getCart().coupon.token)," ","(",r,")",o.createElement("span",{className:"buy-order-shipping-price"},!c&&s&&a?o.createElement("i",{className:"fa fa-spinner fa-spin"}):e))},render:function(){var e,r,n,a,s,c,l,u,p
c=i.getShippingFeeNum()
s=i.addCurrencySymbol(c)
p=i.getTotalPrice()
l=i.getSubtotal()
e=this._hasDiscount()
a=i.needToShowDiscountInfo()
r=i.userHasCouponWithType("free_shipping")
u=i.getTaxes()
n=this.props.loading
return o.createElement("div",{className:"gray-box"},o.createElement("div",{className:"buy-order-items-list"},this._renderItemList()),o.createElement("div",{className:"buy-order-bottom-price"},o.createElement("div",{className:"buy-order-shipping"},o.createElement("span",{className:"buy-order-shipping-label"},t("Ecommerce|Subtotal")),o.createElement("span",{className:"buy-order-shipping-price"},l)),!r&&e&&a?this._renderDescription():void 0,i.getTaxesNum()?o.createElement("div",{className:"buy-order-shipping"},o.createElement("span",{className:"buy-order-shipping-label"},t("Ecommerce|Tax")),o.createElement("span",{className:"buy-order-shipping-price"},u)):void 0,o.createElement("div",{className:"buy-order-shipping"},o.createElement("span",{className:"buy-order-shipping-label"},t("Ecommerce|Shipping")),o.createElement("span",{className:"buy-order-shipping-price"},!c&&n?o.createElement("i",{className:"fa fa-spinner fa-spin"}):s)),r&&e&&a?this._renderDescription():void 0,o.createElement("div",{className:"buy-order-total"},o.createElement("span",{className:"buy-order-total-label"},t("Ecommerce|Total")),o.createElement("div",{className:"buy-order-total-price"},o.createElement("span",{className:"price-label"},this.props.settings.currencyCode),o.createElement("span",null,p)))))}})}).call(t,r(5))},903:function(e,t,r){(function(t){"use strict"
var n,a,i,o
a=r(2)
o=r(1)
n=r(29)
i=r(80)
e.exports=a.createClass({displayName:"exports",_needToshowShippingInfo:function(){var e,t,r,n
n=this.props.items
for(e=0,r=n.length;e<r;e++){t=n[e]
if(t.product.shippingInfo)return!0}return!1},_getValue:function(e){return this.props.shipping[e].value},render:function(){var e,r,o,s,c
o=this._needToshowShippingInfo()
r="contact-info-wrapper "+(this.props.shipping.notes.value?"has-notes":"")
s=this._getValue("state")
e=this._getValue("city")
c=s!==e?s+" "+e:""+s
return a.createElement("div",{className:"gray-box"},a.createElement("div",{className:r},a.createElement("div",{className:"sub-title"},t("Ecommerce|Shipping info")),a.createElement("div",{className:"info-row"},a.createElement("div",{className:"fa fa-user"}),a.createElement("div",{className:"text"},this._getValue("firstName")+" "+this._getValue("lastName"))),this._getValue("phone")?a.createElement("div",{className:"info-row phone"},a.createElement("div",{className:"fa fa-phone"}),a.createElement("div",{className:"text"},this._getValue("phone"))):void 0,a.createElement("div",{className:"info-row email"},a.createElement("div",{className:"fa fa-envelope"}),a.createElement("div",{className:"text"},this._getValue("email"))),o?a.createElement(i,null,a.createElement("div",{className:"info-row"},a.createElement("div",{className:"fa fa-map-marker"}),a.createElement("div",{className:"text"},this._getValue("address")+", "+this._getValue("city")+", "+this._getValue("state")+", "+n.getCountry(this._getValue("country"))+", "+this._getValue("zip"))),a.createElement("div",{className:"info-row"},a.createElement("div",{className:"fa fa-map-marker"}),a.createElement("div",{className:"text"},c+" "+this._getValue("county")+" "+this._getValue("address")))):void 0),this.props.shipping.notes.value?a.createElement("div",{className:"notes-wrapper"},a.createElement("div",{className:"sub-title"},t("Ecommerce|Your notes")),this.props.shipping.notes.value):void 0)}})}).call(t,r(5))},904:function(e,t,r){(function(t){"use strict"
var n,a,i,o,s,c,l,u={}.hasOwnProperty
s=r(2)
n=r(8)
a=r(7)
i=r(18)
l=r(15)
c=r(856)
o=r(35)
e.exports=n.createPageComponent({displayName:"EcommercePaymentPanel",observedProps:["settings","accounts"],bobcatPropTypes:o.BUY_PANEL_PROP_TYPES,componentWillMount:function(){if(a.getIsStrikingly())return this.updateData({paymentMethod:"stripe"})},_onClickGotoPrevPanel:function(){return this.props.gotoPanel("shippingForm")},_onClickGotoNextPanel:function(){var e,t
!i.isWechat()||"pingppWxPub"!==this.getData("paymentMethod")&&"wechatpay"!==this.getData("paymentMethod")?this.props.gotoPanel("orderPreview"):location.href=c.getOauthUri()
t=function(){switch(this.getData("paymentMethod")){case"stripe":return"credit_cart"
case"paypal":return"paypal"
case"alipay":return"alipay"
case"wechatpay":return"wechatpay"
case"pingppAlipayWap":return"pingpp_alipay_wap"
case"pingppAlipayQr":return"pingpp_alipay_qr"
case"pingppWxPub":return"pingpp_wx_pub"
case"pingppWxPubQr":return"pingpp_wx_pub_qr"}}.call(this)
e=r(47)
return e.trackEcommerceBuyerEvent(a.getKeenIoEcommerceBuyerSelectedPaymentMethod(),{vendor:t})},_onClickChoosePaypal:function(){return this.updateData({paymentMethod:"paypal"})},_onClickChooseAlipay:function(){return this.updateData({paymentMethod:"alipay"})},_onClickChooseStripe:function(){return this.updateData({paymentMethod:"stripe"})},_onClickChoosePaymentOf:function(e){return this.updateData({paymentMethod:e})},_shouldRender:function(e){return i.isMobile()?i.isWechat()?"pingppWxPub"===e||"wechatpay"===e:"pingppAlipayWap"===e||"alipay"===e:"pingppAlipayQr"===e||"pingppWxPubQr"===e||"alipay"===e||"wechatpay"===e||"paypal"===e||"stripe"===e},_renderPaymentChannels:function(e){var r,n,a,i,o,c
o=[]
n={stripe:{title:t("Ecommerce|Pay with card"),logo:"/images/ecommerce/pay_with_card.png"},paypal:{title:t("Ecommerce|Pay with PayPal"),logo:"/images/ecommerce/paypal.png"},alipay:{title:t("Ecommerce|Pay with Alipay"),logo:"/images/ecommerce/ic_alipay.png",name:t("Alipay")},pingppAlipayQr:{title:"支付宝扫码支付",logo:"/images/ecommerce/pay_with_alipay.png"},pingppAlipayWap:{title:"支付宝移动网页支付",logo:"/images/ecommerce/pay_with_alipay.png"},pingppWxPub:{title:"微信支付",logo:"/images/ecommerce/wechatpay.png"},pingppWxPubQr:{title:"微信扫码支付",logo:"/images/ecommerce/wechatpay.png"},wechatpay:{title:"微信支付",logo:"/images/ecommerce/ic_wechat_pay.png",name:t("WeChat Pay")}}
c=this.getData("paymentMethod")
for(r in e)if(u.call(e,r)){i=e[r]
if(i&&this._shouldRender(r)){a=s.createElement("div",{className:"payment-chooser first"+(c===r?"choosed":""),onClick:this._onClickChoosePaymentOf.bind(null,r)},s.createElement("input",{type:"radio",checked:c===r,name:"payment",onChange:this._onClickChoosePaymentOf.bind(null,r)}),s.createElement("div",{className:"chooser-content"},s.createElement("div",null,n[r].title),s.createElement("div",{className:"chooser-icon"},s.createElement("img",{src:l.cdnAssetPath(n[r].logo)}),s.createElement("span",null,n[r].name))))
o.push(a)}}return o},render:function(){return s.createElement("div",{className:"buy-panel payment-panel"},s.createElement("div",{className:"title"},s.createElement("div",{className:"s-btn gray mobile-back left-arrow",onClick:this._onClickGotoPrevPanel},s.createElement("i",{className:"fa fa-angle-left"}),t("Back")),s.createElement("span",{style:{display:"inline-block"}},t("Ecommerce|Choose a payment method"))),s.createElement("div",{className:"ecommerce-buy-channel"},this._renderPaymentChannels(this.props.settings.paymentGateways)),s.createElement("div",{className:"bottom"},s.createElement("div",{className:"s-btn gray left desktop-back left-arrow",onClick:this._onClickGotoPrevPanel},s.createElement("i",{className:"fa fa-angle-left"}),s.createElement("span",null,t("Back"))),""!==this.getData("paymentMethod")?s.createElement("div",{className:"s-btn green right right-arrow",onClick:this._onClickGotoNextPanel},t("Ecommerce|Review Order"),s.createElement("i",{className:"fa fa-angle-right"})):s.createElement("div",{className:"s-btn gray right right-arrow"},t("Ecommerce|Review Order"),s.createElement("i",{className:"fa fa-angle-right"}))))}})}).call(t,r(5))},905:function(e,t,r){(function(t){"use strict"
function n(e,t,r){t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r
return e}var a,i,o,s,c,l,u,p,d,m,h,g,f,y,v,E,_,C,b,P,N,w,k=[].indexOf||function(e){for(var t=0,r=this.length;t<r;t++)if(t in this&&this[t]===e)return t
return-1},D={}.hasOwnProperty
v=r(2)
g=r(9)
i=r(3)
b=r(1)
w=r(39)
o=r(8)
E=r(111).RegexConstants
p=r(35)
u=r(182)
y=r(4)
s=r(7)
h=r(29)
l=r(40)
c=r(18)
d=r(53)
C=r(856)
m=r(897)
f=r(19)
_=r(80)
r(2167)
N={}
P=(a={firstName:E.NO_NUMBER,lastName:s.getIsSxl()?/.*/:E.NO_NUMBER,email:E.EMAIL,phone:E.PHONE,city:E.NO_NUMBER,address:/.+/,zip:s.getIsSxl()?/.*/:/.+/,country:/^(?!null).+$/,state:/^(?!null).+$/},n(a,"city",/^(?!null).+$/),n(a,"county",/^(?!null).+$/),a)
e.exports=o.createPageComponent({displayName:"EcommerceBuyShippingForm",mixins:[f("ecommerceBuyShippingForm")],observedProps:["settings","accounts"],bobcatPropTypes:p.BUY_PANEL_PROP_TYPES,componentWillMount:function(){this.initMeta({loading:!1})
return l.getChildrenOf("districtRoot")},componentDidMount:function(){i("input, textarea").placeholder()
return this._selectDefaultCountry()},componentDidUpdate:function(){return this.props.adjustHeight()},_getLoopList:function(){var e,t
e=["firstName","lastName","email","phone"]
t=e.concat(["city","address","zip"])
if(s.getIsSxl()){t.push("county")
t.push("state")}else t.push("country")
return this._needToshowShippingInfo()?t:e},_hasMultiplePaymentMethods:function(){return s.getIsSxl()?d.getAvailableChannelsWithCurrentDevice().length>1:this.props.settings.paymentGatewaysCount>1},_needToshowShippingInfo:function(){var e,t,r,n
n=this.getData("items").toJS()
for(e=0,r=n.length;e<r;e++){t=n[e]
if(t.product.shippingInfo)return!0}return!1},_isInputError:function(e,t){var r
t||(t=this.getData("shipping."+e).toJS())
if(t.errorTrigger){if("country"===e)return!h.getCountry(t.value)||!(r=t.value,k.call(h.getCountryList().map(function(e){return e.code}),r)>=0)
if(P[e])return!P[e].test(b.trim(t.value))}return!1},_isFormError:function(){var e,t,r,n,a
a=this.getData("shipping").toJS()
n=this._getLoopList()
for(e=0,r=n.length;e<r;e++){t=n[e]
if(this._isInputError(t,a[t]))return!0}return!1},_isSelected:function(e){var t
t=this.getData("shipping").get(e).get("value")
return!!selection.value},_needToShowErrorOn:function(e){var t
return t=this.getData("shipping").get(e).get("errorTrigger")},_showErrorInfoOfDistricts:function(){var e,t,r,n,a,i,o,s
a=this.getData("shipping").toObject(),o=a.state,e=a.city,t=a.county
i={state:o,city:e,county:t}
for(n in i)if(D.call(i,n)){s=i[n]
if(this._isInputError(n)){r=n
break}}switch(r){case"state":return"省份不能为空"
case"city":return"城市不能为空"
case"county":return"县、区不能为空"
default:return""}},_isErrorTriggerEnabled:function(){var e,t,r,n,a
a=this.getData("shipping").toJS()
n=this._getLoopList()
for(e=0,r=n.length;e<r;e++){t=n[e]
if(!a[t].errorTrigger)return!1}return!0},_getNextBtnText:function(){return t(this._hasMultiplePaymentMethods()?"Ecommerce|Choose Payment Method":"Ecommerce|Review Order")},_getInputProps:function(e){var t
t=this.getData("shipping."+e).toJS()
return b.extend(t,{binding:this.getDefaultBinding().sub("shipping."+e)})},_setTheOnlyPaymentMethod:function(){var e
if(s.getIsSxl()){e=d.getAvailableChannelsWithCurrentDevice()
return this.updateData({paymentMethod:e[0]})}this.props.settings.paymentGateways.stripe&&this.updateData({paymentMethod:"stripe"})
this.props.settings.paymentGateways.paypal&&this.updateData({paymentMethod:"paypal"})
this.props.settings.paymentGateways.wechatpay&&this.updateData({paymentMethod:"wechatpay"})
this.props.settings.paymentGateways.alipay&&this.updateData({paymentMethod:"alipay"})
this.props.settings.paymentGateways.pingppWxPub&&this.updateData({paymentMethod:"pingppWxPub"})
this.props.settings.paymentGateways.pingppWxPubQr&&this.updateData({paymentMethod:"pingppWxPubQr"})
this.props.settings.paymentGateways.pingppAlipayQr&&this.updateData({paymentMethod:"pingppAlipayQr"})
if(this.props.settings.paymentGateways.pingppAlipayWap)return this.updateData({paymentMethod:"pingppAlipayWap"})},_onClickEnableErrorTrigger:function(){var e,t,r,n,a
a=this.getData("shipping").toJS()
n=this._getLoopList()
for(e=0,r=n.length;e<r;e++){t=n[e]
a[t].errorTrigger=!0}this.updateData({shipping:g.fromJS(a)})
if(!this._isFormError())return this._onClickGotoNextPanel()},_onClickGotoPrevPanel:function(){return this.props.gotoPanel("singleProductPanel")},_onClickGotoNextPanel:function(){var e
if(this._hasMultiplePaymentMethods())this.props.gotoPanel("paymentPanel")
else{this._setTheOnlyPaymentMethod()
!c.isWechat()||"pingppWxPub"!==this.getData("paymentMethod")&&"wechatpay"!==this.getData("paymentMethod")?this.props.gotoPanel("orderPreview"):location.href=C.getOauthUri()}e=r(47)
return e.trackEcommerceBuyerEvent(s.getKeenIoEcommerceBuyerCompletedShippingAddress(),{country:this.getData("shipping.country.value")})},_onSelectCountry:function(e){var t
t=e.target.value
return this.setData("shipping.country.value",t)},_onSelectArea:function(e,t){var r,n
r=t.target.value
if(r){n=this.getData("shipping").get(e+"s").find(function(e){return e.get("code")===r})
return l.changeSelectionOf({category:e,code:r,value:n.get("name")})}},_selectDefaultCountry:function(){var e
e=this.props.settings.currencyCode
if(!this.getData("shipping.country.value"))return this.setData("shipping.country.value",p.CURRENCY_COUNTRY_MAPPING_LIST[e])},_onChangeNotes:function(e){var t
t=e.target.value
return this.setData("shipping.notes.value",t)},_getDistrictData:function(e){return this.getData("shipping."+e+".code")},_isDistrictError:function(){return this._isInputError("state")||this._isInputError("city")||this._isInputError("county")},_renderSXLShippingAddress:function(e,r,n){return v.createElement("div",{className:"address-wrap"},v.createElement("div",{className:w("s-form-section",{"has-error":this._isDistrictError()})},v.createElement("div",{className:"s-form-field inline medium"},v.createElement("div",{className:"input china-regions china-provinces"},v.createElement("select",{className:w({error:this._isInputError("state")}),value:this._getDistrictData("state"),onChange:this._onSelectArea.bind(null,"state")},v.createElement("option",{value:""},"省"),e.map(function(e){return v.createElement("option",{key:e.get("code"),value:e.get("code")},e.get("name"))}))),v.createElement("div",{className:"input china-regions china-citys"},v.createElement("select",{className:w({error:this._isInputError("city")}),value:this._getDistrictData("city"),onChange:this._onSelectArea.bind(null,"city")},v.createElement("option",{value:""},"市"),r.map(function(e){return v.createElement("option",{key:e.get("code"),value:e.get("code")},e.get("name"))}))),v.createElement("div",{className:"input china-regions china-countys"},v.createElement("select",{className:w({error:this._isInputError("county")}),value:this._getDistrictData("county"),onChange:this._onSelectArea.bind(null,"county")},v.createElement("option",{value:""},"县、区"),n.map(function(e){return v.createElement("option",{key:e.get("code"),value:e.get("code")},e.get("name"))}))),!!this._showErrorInfoOfDistricts()&&v.createElement("div",{className:"error-message",style:{display:"block"}},this._showErrorInfoOfDistricts())),v.createElement("div",{className:"s-form-field inline small right"},v.createElement(m,Object.assign({messageClass:"medium",placeholder:t("Ecommerce|ZIP/Postal")},this._getInputProps("zip"),{checkPattern:P.zip})))),v.createElement("div",{className:w("s-form-section",{"has-error":this._isInputError("address")})},v.createElement("div",{className:"s-form-field inline full-width"},v.createElement(m,Object.assign({placeholder:t("Ecommerce|Street Address")},this._getInputProps("address"),{checkPattern:P.address})))))},render:function(){var e,r,n,a,i,o,s,c,l,u,p
o=this._needToshowShippingInfo()
a=this._isErrorTriggerEnabled()
i=this._isFormError()
r=h.getCountryList()
c=(null!=(l=this.getData("shipping.states"))?l.toArray():void 0)||[]
e=(null!=(u=this.getData("shipping.citys"))?u.toArray():void 0)||[]
n=(null!=(p=this.getData("shipping.countys"))?p.toArray():void 0)||[]
s=this._getNextBtnText()
return v.createElement("form",{className:"buy-panel shipping-form s-form"},v.createElement("div",{className:"title"},v.createElement("div",{className:"s-btn gray mobile-back left-arrow",onClick:this._onClickGotoPrevPanel},v.createElement("i",{className:"fa fa-angle-left"}),t("Back")),t(o?"Ecommerce|Shipping Info":"Ecommerce|Contact Info")),this.props.settings.shippingGuideline?v.createElement("div",{className:"shipping-guideline"},this.props.settings.shippingGuideline):void 0,v.createElement("div",{className:w("s-form-section",{"has-error":this._isInputError("firstName")||this._isInputError("lastName")})},v.createElement("div",{className:"s-form-field inline medium left"},v.createElement(m,Object.assign({placeholder:t("Ecommerce|First Name")},this._getInputProps("firstName"),{checkPattern:E.NO_NUMBER}))),v.createElement(_,null,v.createElement("div",{className:"s-form-field inline small right"},v.createElement(m,Object.assign({messageClass:"medium",placeholder:t("Ecommerce|Last Name")},this._getInputProps("lastName"),{checkPattern:E.NO_NUMBER}))),v.createElement("div",null))),v.createElement("div",{className:w("s-form-section",{"has-error":this._isInputError("email")||this._isInputError("phone")})},v.createElement("div",{className:"s-form-field inline medium left"},v.createElement(m,Object.assign({styleClass:"manually-check",placeholder:t("Ecommerce|Email"),errorText:t("Please enter a valid Email address")},this._getInputProps("email"),{checkPattern:E.EMAIL}))),v.createElement("div",{className:"s-form-field inline small right"},v.createElement(m,Object.assign({styleClass:"manually-check",messageClass:"medium",placeholder:t("Ecommerce|Phone"),errorText:t("Ecommerce|Invalid phone number")},this._getInputProps("phone"),{checkPattern:E.PHONE})))),o?v.createElement(_,null,v.createElement("div",{className:"address-wrap"},v.createElement("div",{className:w("s-form-section",{"has-error":this._isInputError("address")})},v.createElement("div",{className:"s-form-field inline full-width"},v.createElement(m,Object.assign({placeholder:t("Ecommerce|Street Address")},this._getInputProps("address"),{checkPattern:P.address})))),v.createElement("div",{className:w("s-form-section",{"has-error":this._isInputError("city")||this._isInputError("state")})},v.createElement("div",{className:"s-form-field inline medium left"},v.createElement(m,Object.assign({placeholder:t("Ecommerce|City")},this._getInputProps("city"),{checkPattern:E.NO_NUMBER}))),v.createElement("div",{className:"s-form-field inline small right"},v.createElement(m,Object.assign({messageClass:"medium",placeholder:t("Ecommerce|State/Province")},this._getInputProps("state"))))),v.createElement("div",{className:w("s-form-section",{"has-error":this._isInputError("zip")})},v.createElement("div",{className:"s-form-field inline medium"},v.createElement("div",{className:"input"},v.createElement("select",{value:this.getData("shipping.country.value"),onChange:this._onSelectCountry,className:w({error:this._isInputError("country",this.getData("shipping.country").toJS())})},v.createElement("option",{value:"null",style:{display:"none"}},t("Ecommerce|Choose a country")),v.createElement("option",{value:"null",disabled:!0},t("Ecommerce|We ship to the following countries:")),r.map(function(e,t){return v.createElement("option",{key:t,value:e.code},e.name)})))),v.createElement("div",{className:"s-form-field inline small right"},v.createElement(m,Object.assign({messageClass:"medium",placeholder:t("Ecommerce|ZIP/Postal")},this._getInputProps("zip"),{checkPattern:P.zip}))))),this._renderSXLShippingAddress(c,e,n)):void 0,v.createElement("div",{className:"s-form-section"},v.createElement("div",{className:"s-form-field"},v.createElement("textarea",{defaultValue:this.getData("shipping.notes.value"),onChange:this._onChangeNotes,placeholder:t("Ecommerce|Send us a note (optional)")}))),v.createElement("div",{className:"bottom"},v.createElement("div",{className:"s-btn gray left desktop-back left-arrow",onClick:this._onClickGotoPrevPanel},v.createElement("i",{className:"fa fa-angle-left"}),v.createElement("span",null,t("Back"))),a?i?v.createElement("div",{className:"s-btn gray right disable right-arrow"},s,v.createElement("i",{className:"fa fa-angle-right"})):v.createElement("div",{className:"s-btn green right right-arrow",onClick:this._onClickGotoNextPanel},v.createElement("span",null,s),v.createElement("i",{className:"fa fa-angle-right"})):v.createElement("div",{className:"s-btn green right right-arrow",onClick:this._onClickEnableErrorTrigger},s,v.createElement("i",{className:"fa fa-angle-right"}))))}})}).call(t,r(5))},906:function(e,t,r){(function(t){"use strict"
var n,a,i,o,s,c,l,u,p,d,m,h,g,f,y,v,E,_
y=r(2)
p=r(9)
n=r(3)
E=r(1)
m=r(16)
a=r(8)
c=r(54)
o=r(40)
s=r(182)
l=r(35)
u=r(53)
f=r(4)
g=r(10)
d=r(19)
i=r(18)
h=r(899)
v=r(740)
_=!1
e.exports=a.createPageComponent({displayName:"EcommerceSingleProductForm",mixins:[d("ecommerceBuySingleProduct")],observedProps:["settings","accounts"],bobcatPropTypes:l.BUY_PANEL_PROP_TYPES,componentWillMount:function(){return this.initMeta({showCoupon:!1,couponCode:"",applyingCoupon:!1,invalidCoupon:!1,couponError:"",termsAccepted:_})},componentDidMount:function(){this._lastItemsNum=this.getDefaultBinding().get("items").size
this._oldListWidth=0
this._scrollBarAdjusted=!1
if(!i.isMobile())return this._setMaxHeight()},componentDidUpdate:function(e){var t,r
r=this.props.settings.buyDialogOpenState&&!e.settings.buyDialogOpenState
t=this._lastItemsNum!==this.getDefaultBinding().get("items").size
t&&(this._lastItemsNum=this.getDefaultBinding().get("items").size);(r||t)&&this._adjustItemListWidth()
if(t&&0===this._lastItemsNum)return this.props.closeDialog()},_setMaxHeight:function(){return n(this.refs.itemList).css("max-height",n(window).height()/2+"px")},_adjustItemListWidth:function(){var e,t
e=this.refs.itemList
if(e){t=e.offsetWidth-e.clientWidth
if(t&&!this._scrollBarAdjusted){this._oldListWidth=n(e).width()
this._scrollBarAdjusted=!0
n(e).width(this._oldListWidth+t)}if(!t&&this._scrollBarAdjusted){n(e).width(this._oldListWidth)
return this._scrollBarAdjusted=!1}}},_canBuy:function(){var e,t,r,n,a,i,o
a=this.getData("items").toJS()
for(r=t=0,i=a.length;t<i;r=++t){n=a[r]
o=E.find(n.product.variations,function(e){return e.id===n.orderItem.id})
if(!o)return!1
e=n.orderItem.quantity<=o.quantity||o.quantity===-1
if(!e)return!1}return!0},_canAddItem:function(){var e,t,r
e=this.getData("items").toJS()
t=this._getProduct()
if(t){r=E.filter(t.variations,function(e){return e.quantity>=1||e.quantity===-1})
return e.length<r.length&&this._canBuy()}},_isProductDataReady:function(){var e
return null!=(e=this.getData("items").toJS()[0])?e.product:void 0},_hasMultipleProduct:function(){return this.props.products.length>=2},_needToshowShippingInfo:function(){return E.any(this.getData("items").toJS(),function(e){return e.product.shippingInfo})},_getProduct:function(){var e
return null!=(e=this.getData("items").toJS()[0])?e.product:void 0},_getVariationList:function(){var e,t
e=this.getData("items").toJS()
t=this._getProduct()
return t?E.filter(t.variations,function(t){return E.all(e,function(e){return e.orderItem.id!==t.id})&&(t.quantity>=1||t.quantity===-1)}):[]},_deleteItem:function(e){var t
t=this.getData("items").toJS()
t=E.filter(t,function(t){return t.orderItem.id!==e})
return this.getDefaultBinding().sub("items").set(p.fromJS(t))},_addVariation:function(e){var t,r,n,a
n=this._getProduct()
if(n){t=c.getCart()
a=E.find(n.variations,function(t){return e===t.id})
if(null!=a){r={orderItem:{quantity:1,price:a.price,name:a.name,id:e},product:n,productId:n.id}
t.items.push(r)
o.updateShoppingCart(t)
return this.props.adjustHeight()}}},_applyCouponCode:function(){var e
o.removeCoupon()
e=this.getMeta("couponCode")
this.updateMeta({applyingCoupon:!0,invalidCoupon:!1})
return s.coupons.verify({pageId:f.getId(),action:"verify",data:{coupon:e},success:function(e){return function(t){var r
r=c.getCart()
r.coupon=t.data.coupon
r.coupon.option.condition=E.extend({productId:null,orderOver:null},r.coupon.option.condition||{})
r.coupon.option.condition.orderOver=r.coupon.option.condition.orderOver/100||null
o.updateShoppingCart(r)
e.updateMeta({applyingCoupon:!1})
e._checkCoupon()
return e.props.adjustHeight()}}(this),fail:function(e){return function(r){var n,a
e.updateMeta({applyingCoupon:!1,appliedCoupon:!1,showCoupon:!0,invalidCoupon:!0,couponError:t("expired"===(null!=(n=r.responseJSON)&&null!=(a=n.meta)?a.devMessage:void 0)?"EcommerceCoupon|This coupon code has expired.":"EcommerceCoupon|Invalid coupon code!")})
return e.props.adjustHeight()}}(this)})},_showCoupon:function(){return this.getMeta("showCoupon")},_isApplyingCoupon:function(){return this.getMeta("applyingCoupon")},_isInvalidCoupon:function(){return this.getMeta("invalidCoupon")},_couponError:function(){return this.getMeta("couponError")},_hasCoupon:function(){var e
return null!=(null!=(e=c.getCart().coupon)?e.category:void 0)},_canUseCoupon:function(){var e
if(this._hasCoupon()&&!this._getErrorMessage()){e=c.getCart().coupon
return u.isInCondition("orderOver")?u.getTotalItemPriceNum()>=e.option.condition.orderOver:!u.isInCondition("productId")||E.find(c.getCart().items,function(t){return parseInt(t.productId)===parseInt(e.option.condition.productId)})}},_getErrorMessage:function(){var e,r,n
r=""
if(this._hasCoupon()){e=c.getCart().coupon
if(u.isInCondition("orderOver"))u.getTotalItemPriceNum()<e.option.condition.orderOver&&(r=t("EcommerceCoupon|This coupon code can only be applied to orders totaling at %{fee} or more.",{fee:u.addCurrencySymbol(e.option.condition.orderOver)}))
else if(u.isInCondition("productId")){if(!E.find(c.getCart().items,function(t){return parseInt(t.productId)===parseInt(e.option.condition.productId)})){n=E.find(this.props.products,function(t){return parseInt(t.id)===parseInt(e.option.condition.productId)})
r=n?t("EcommerceCoupon|This coupon code can only be applied to %{name}",{name:null!=n?n.name:void 0}):t("EcommerceCoupon|Invalid coupon code!")}}else r=""
return r}},_checkCoupon:function(){var e
if(this._hasCoupon()){e=this._getErrorMessage()
return this.updateMeta({couponError:e})}},_onClickGotoNextPanel:function(){var e
this._canUseCoupon()||this._removeCoupon()
this.props.gotoPanel("shippingForm")
e=r(47)
return e.trackPageEventOnFB("InitiateCheckout",u.getTrackData())},_onChangeAddVariation:function(e){var t
t=+e.target.value
return this._addVariation(t)},_onChangeCouponCode:function(e){return this.updateMeta({couponCode:e.target.value})},_onChangeTermsCheckbox:function(e){return this.updateMeta({termsAccepted:e.target.checked})},_onClickApplyCoupon:function(){this.updateMeta({showCoupon:!0})
return this.props.adjustHeight()},_onClickTerms:function(e){switch(e.target.nodeName.toUpperCase()){case"A":return this.props.gotoPanelWithoutAdjustHeight("terms")
case"SPAN":return this.updateMeta({termsAccepted:!this.getMeta("termsAccepted")})}},_removeCoupon:function(){o.removeCoupon()
this.updateMeta({couponError:"",couponCode:""})
return this.props.adjustHeight()},_renderItem:function(e,t){var r
r=E.extend(e.toJS(),{binding:this.getDefaultBinding().sub("items."+t),settings:this.props.settings,adjustHeight:this.props.adjustHeight,removeCoupon:this._removeCoupon,deleteItem:function(e){return function(t){e._deleteItem(t)
return e.props.adjustHeight()}}(this)})
return y.createElement(h,Object.assign({key:t},r))},render:function(){var e,r,n,a,i,o,s,l,p,d,h,f,v,E,C,b,P,N,w,k,D
if(!this._isProductDataReady())return null
h=this._hasMultipleProduct()
i=this._canBuy()
a=this._canAddItem()
N=!h&&a
b=this._showCoupon()
o=this.getMeta("couponCode")
d=this._hasCoupon()&&this._canUseCoupon()
r=this._isApplyingCoupon()
f=this._isInvalidCoupon()||this._getErrorMessage()
s=this._getErrorMessage()||this._couponError()
w=u.getSubtotal()
l=u.getDiscount()
p=u.getDiscountDescription()
k=u.getSubtotalWithDiscount()
C=u.pageHasCoupon()
E=u.needToShowDiscountInfo()
v=u.userHasCouponWithType("free_shipping")
P=g.getShowTermsAndConditions()&&g.getTermsText()
D=!P||this.getMeta("termsAccepted")
_=D
P&&i&&(i=D)
n=t("Ecommerce|Checkout")
e=m.DOM.input
return y.createElement("div",{className:"single-product buy-panel"},y.createElement("div",{className:"title"},t(h?"Ecommerce|Your Cart":"Ecommerce|Your Order")),y.createElement("div",{className:"buy-order-items-list-wrapper",ref:"itemList"},y.createElement("div",{className:"buy-order-items-list"},this.getData("items").map(this._renderItem))),y.createElement("div",{className:"buy-order-bottom-price"},N?y.createElement("select",{className:"add-variation",value:"null",onChange:this._onChangeAddVariation},y.createElement("option",{value:"null"},t("Ecommerce|Add variation")),this._getVariationList().map(function(e,t){return y.createElement("option",{value:e.id,key:t},e.name)})):void 0,y.createElement("div",{className:"buy-order-total"},y.createElement("span",{className:"buy-order-total-label"},t("Ecommerce|Subtotal")),y.createElement("div",{className:"buy-order-total-price"},y.createElement("span",{className:"price-label"},this.props.settings.currencyCode),y.createElement("span",null,w))),d&&E?y.createElement("div",{className:"buy-order-shipping"},y.createElement("span",{className:"buy-order-shipping-label"},t("EcommerceCoupon|Coupon"))," ",y.createElement("strong",null,c.getCart().coupon.token)," ","(",p,")",y.createElement("a",{onClick:this._removeCoupon,style:{marginLeft:"10px"}},t("EcommerceCoupon|Remove")),v?void 0:y.createElement("span",{className:"buy-order-shipping-price"},l)):void 0,d&&E&&!v?y.createElement("div",{className:"buy-order-total",style:{marginTop:"10px"}},y.createElement("span",{className:"buy-order-total-label"},t("Ecommerce|TOTAL"))," ",this._needToshowShippingInfo()&&y.createElement("span",null,t("Ecommerce|(Excluding shipping)")),y.createElement("div",{className:"buy-order-total-price"},y.createElement("span",{className:"price-label"},this.props.settings.currencyCode),y.createElement("span",null,k))):void 0,b&&!d?y.createElement("div",{className:"buy-order-coupon-code"},y.createElement(e,{type:"text",value:o,placeholder:t("EcommerceCoupon|Enter coupon code"),className:"token "+(f?"error":"")+" "+(o.length?"has-value":""),onChange:this._onChangeCouponCode}),y.createElement("div",{className:"s-btn green apply-btn",onClick:this._applyCouponCode},y.createElement("span",null,t("EcommerceCoupon|Apply")),r?y.createElement("i",{className:"fa fa-spinner fa-spin"}):void 0),f?y.createElement("div",{className:"error-message"},s):void 0):b||d||!C?void 0:y.createElement("div",{className:"buy-order-coupon-code"},y.createElement("span",{className:"apply",onClick:this._onClickApplyCoupon},t("Ecommerce|I have a coupon code")))),y.createElement("div",{className:"bottom"},P?y.createElement("div",{className:"terms-checkbox"},y.createElement("input",{style:{marginRight:"5px"},type:"checkbox",checked:D,onChange:this._onChangeTermsCheckbox}),y.createElement("span",{onClick:this._onClickTerms,dangerouslySetInnerHTML:{__html:t("Ecommerce|I agree with <a>Terms & Conditions</a>")}})):void 0,i?y.createElement("div",{className:"s-btn green right right-arrow",onClick:this._onClickGotoNextPanel},y.createElement("span",null,n),y.createElement("i",{className:"fa fa-angle-right"})):y.createElement("div",{className:"s-btn gray right right-arrow disable"},y.createElement("span",null,n),y.createElement("i",{className:"fa fa-angle-right"}))))}})}).call(t,r(5))},926:function(e,t){"use strict"
var r={strikingly:{development:{baseUrl:"strikingly.io:3000",mainUrl:"http://www.strikingly.io:3000",assetUrl:"//strikingly.io:3000"},staging:{baseUrl:"staging.strikingly.com",mainUrl:"http://www.staging.strikingly.com",assetUrl:"//staging.strikingly.com"},uat:{baseUrl:"uat.strikingly.com",mainUrl:"http://www.uat.strikingly.com",assetUrl:"//uat.strikingly.com"},production:{baseUrl:"strikingly.com",mainUrl:"http://www.strikingly.com",assetUrl:"//strikingly.com"}},sxl:{development:{baseUrl:"shangxianle.me:3000",mainUrl:"http://www.shangxianle.me:3000",assetUrl:"//shangxianle.me:3000"},staging:{baseUrl:"staging.sxl.cn",mainUrl:"http://www.staging.sxl.cn",assetUrl:"//staging.sxl.cn"},uat:{baseUrl:"uat.sxl.cn",mainUrl:"http://www.uat.sxl.cn",assetUrl:"//uat.sxl.cn"},production:{baseUrl:"sxl.cn",mainUrl:"http://www.sxl.cn",assetUrl:"//assets.sxlcdn.com"}}}
Object.defineProperty(t,"__esModule",{value:!0})
t.default=r},927:function(e,t,r){"use strict"
var n=r(926),a=r(928)
t.PRODUCT_NAME={NODE_ENV:"production",VERBOSE:void 0}.PRODUCT_NAME||"sxl"
t.ENV="production"
var i={bobcat:n.default,qiniu:a.default}
t.getConfig=function(e){return i[e][t.PRODUCT_NAME][t.ENV]}},928:function(e,t){"use strict"
var r={strikingly:{development:{host:""},staging:{host:""},uat:{host:""},production:{host:""}},sxl:{development:{host:"http://7xpea4.com1.z0.glb.clouddn.com"},staging:{host:"http://7xpea4.com1.z0.glb.clouddn.com"},uat:{host:"http://7xpea4.com1.z0.glb.clouddn.com"},production:{host:"http://nzr2ybsda.qnssl.com"}}}
Object.defineProperty(t,"__esModule",{value:!0})
t.default=r},2167:function(e,t,r){var n,a,i
!function(o){!(a=[r(3)],n=o,i="function"==typeof n?n.apply(t,a):n,void 0!==i&&(e.exports=i))}(function(e){function t(t){var r={},n=/^jQuery\d+$/
return e.each(t.attributes,function(e,t){t.specified&&!n.test(t.name)&&(r[t.name]=t.value)}),r}function r(t,r){var n=this,i=e(n)
if(n.value==i.attr("placeholder")&&i.hasClass(d.customClass))if(i.data("placeholder-password")){if(i=i.hide().nextAll('input[type="password"]:first').show().attr("id",i.removeAttr("id").data("placeholder-id")),t===!0)return i[0].value=r
i.focus()}else n.value="",i.removeClass(d.customClass),n==a()&&n.select()}function n(){var n,a=this,i=e(a),o=this.id
if(""===a.value){if("password"===a.type){if(!i.data("placeholder-textinput")){try{n=i.clone().attr({type:"text"})}catch(r){n=e("<input>").attr(e.extend(t(this),{type:"text"}))}n.removeAttr("name").data({"placeholder-password":i,"placeholder-id":o}).bind("focus.placeholder",r),i.data({"placeholder-textinput":n,"placeholder-id":o}).before(n)}i=i.removeAttr("id").hide().prevAll('input[type="text"]:first').attr("id",o).show()}i.addClass(d.customClass),i[0].value=i.attr("placeholder")}else i.removeClass(d.customClass)}function a(){try{return document.activeElement}catch(e){}}var i,o,s="[object OperaMini]"==Object.prototype.toString.call(window.operamini),c="placeholder"in document.createElement("input")&&!s,l="placeholder"in document.createElement("textarea")&&!s,u=e.valHooks,p=e.propHooks
if(c&&l)o=e.fn.placeholder=function(){return this},o.input=o.textarea=!0
else{var d={}
o=e.fn.placeholder=function(t){var a={customClass:"placeholder"}
d=e.extend({},a,t)
var i=this
return i.filter((c?"textarea":":input")+"[placeholder]").not("."+d.customClass).bind({"focus.placeholder":r,"blur.placeholder":n}).data("placeholder-enabled",!0).trigger("blur.placeholder"),i},o.input=c,o.textarea=l,i={get:function(t){var r=e(t),n=r.data("placeholder-password")
return n?n[0].value:r.data("placeholder-enabled")&&r.hasClass(d.customClass)?"":t.value},set:function(t,i){var o=e(t),s=o.data("placeholder-password")
return s?s[0].value=i:o.data("placeholder-enabled")?(""===i?(t.value=i,t!=a()&&n.call(t)):o.hasClass(d.customClass)?r.call(t,!0,i)||(t.value=i):t.value=i,o):t.value=i}},c||(u.input=i,p.value=i),l||(u.textarea=i,p.value=i),e(function(){e(document).delegate("form","submit.placeholder",function(){var t=e("."+d.customClass,this).each(r)
setTimeout(function(){t.each(n)},10)})}),e(window).bind("beforeunload.placeholder",function(){e("."+d.customClass).each(function(){this.value=""})})}})},2168:function(e){e.exports=pingpp}})
;
