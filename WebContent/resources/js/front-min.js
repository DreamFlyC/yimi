var LW=new Object();LW.util=new Object();LW.util.toTop=function(){var totopdiv=$("<div id='totop' style='cursor:pointer;position:fixed;bottom:100px;right:10px;'><img src='resources/images/btn_totop.gif'/></div>").appendTo("body");totopdiv.click(function(){$("html,body").animate({scrollTop:"0px"},300);return false});LW.util.scrollTop();$(window).scroll(function(){LW.util.scrollTop()})};LW.util.scrollTop=function(){var st=$(document).scrollTop();var winh=$(window).height();(st>0)?$("#totop").show():$("#totop").hide();if(!window.XMLHttpRequest){$("#totop").css("top",st+winh-166)}};LW.util.submitForm=function(formName){$("#"+formName).submit()};LW.util.createProgressDiv=function(){var div="<div id='progressDiv' class='loader'></div>";return div};LW.util.progressRemove=function(){$(".loader").fadeOut(1000,function(){$(this).remove()})};LW.util.progress=function(){var div=LW.util.createProgressDiv();document.writeln(div);$(function(){LW.util.progressRemove()})};LW.util.progress();LW.util.lazyload=function(){$("img[original]").each(function(){_self=$(this);if(_self.attr("lazyloadpass")==undefined&&_self.attr("original")&&(!_self.attr("src")||(_self.attr("src")&&_self.attr("original")!=_self.attr("src")))){if((_self.offset().top)<($(window).height()+$(document).scrollTop()+200)&&(_self.offset().left)<($(window).width()+$(document).scrollLeft()+200)){_self.attr("src",_self.attr("original"));_self.attr("lazyloadpass","1");_self.animate({opacity:"1"},400)}}})};LW.util.initlazy=function(){LW.util.lazyload();var itv;$(window).scroll(function(){clearTimeout(itv);itv=setTimeout(LW.util.lazyload,400)});$(window).resize(function(){clearTimeout(itv);itv=setTimeout(LW.util.lazyload,400)})};LW.message=new Object();LW.message.confirm=function(dialogId,content,fn){var dialog="<div class='modal fade' id='"+dialogId+"' tabindex='-1' role='dialog' aria-labelledby='"+dialogId+"ModalLabel' aria-hidden='true'>";dialog+="<div class='modal-dialog modal-sm' style='margin-top:20%;'><div class='modal-content'><div class='modal-header'>";dialog+="<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>";dialog+="<h4 class='modal-title' id='"+dialogId+"ModalLabel'>提示</h4></div>";dialog+="<div class='modal-body' style='text-align:center;'>"+content+"</div>";dialog+="<div class='modal-footer'>";dialog+="<button type='button' class='btn btn-default' data-dismiss='modal'>关闭</button>";dialog+="<button type='button' class='btn btn-info' id='"+dialogId+"OK'>确定</button>";dialog+="</div></div></div></div>";$(dialog).appendTo(document.body);$("#"+dialogId).modal("show");$("#"+dialogId).on("hide.bs.modal",function(){$("#"+dialogId).remove();if(fn){fn(false);return false}});$("#"+dialogId+"OK").bind("click",function(){$("#"+dialogId).remove();if(fn){fn(true);return false}})};LW.message.show=function(content){var dialog="<div class='modal fade' id='alertDialog' tabindex='-1' role='dialog' aria-labelledby='alertDialogModalLabel' aria-hidden='true'>";dialog+="<div class='modal-dialog modal-sm' style='margin-top:20%;'><div class='modal-content'><div class='modal-header'>";dialog+="<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>";dialog+="<h4 class='modal-title' id='alertDialogModalLabel'>提示</h4></div>";dialog+="<div class='modal-body text-center'>"+content+"</div>";dialog+="<div class='modal-footer'>";dialog+="<button type='button' class='btn btn-info' data-dismiss='modal' id='alertDialogOK'>确定</button>";dialog+="</div></div></div></div>";$(dialog).appendTo(document.body);$("#alertDialog").modal("show");$("#alertDialog").on("hide.bs.modal",function(){$("#alertDialog").remove()})};LW.location=new Object();LW.location.checkLocation=function(){if(window.location.href==window.parent.location.href){window.location.href=""}};LW.location.forward=function(url){window.location.href=url};LW.location.reload=function(){window.location.reload()};LW.goods=new Object();LW.goods.loadByProperty=function(pageNo){$.ajax({url:"goods.html?pageNo="+(pageNo),success:function(msg){$("#list_rec").append(msg)}})};LW.goods.loadByType=function(type,pageNo){if(!$._data($("#pager_rec")[0],"events")){$("#pager_rec").bind("click",function(){$("#pager_rec").html("正在加载数据...");LW.goods.loadByType(type,++pageNo)})}$.ajax({url:"goods/type-"+type+".html?pageNo="+(pageNo),success:function(msg){$("#list_rec").append(msg)}})};LW.goods.ccNumber=function(number,price){number=number<=0?1:number;$("#number").val(number);$("#marketprice").html("￥"+(number*price).toFixed(2)+"元")};LW.goods.gallery=function(count){try{new Swipe($("#banner_box")[0],{speed:500,auto:3000,callback:function(){var lis=$(this.element).next("ol").children();lis.removeClass("on").eq(this.index).addClass("on")}});if(count>0){(function(window,$,PhotoSwipe){$("#banner_box ul li a[rel]").photoSwipe({})}(window,window.jQuery,window.Code.PhotoSwipe))}}catch(e){}};LW.cart=new Object();LW.cart.addToCartDialog=function(goodsId,number){$.ajax({url:"cart/add/"+goodsId+"-"+number+".html",cache:false,success:function(count){$("#cartModal").modal("show");
LW.cart.loadNumber()}})};LW.cart.addToCart=function(goodsId,number){$.ajax({url:"cart/add/"+goodsId+"-"+number+".html",cache:false,success:function(count){LW.cart.cartAnimate(count)}})};LW.cart.loadNumber=function(){try{$.ajax({url:"cart/num.html",cache:false,success:function(count){LW.cart.cartAnimate(count)}})}catch(e){}};LW.cart.cartAnimate=function(count){$("#addToCart").css({"width":"40px","height":"40px","line-height":"40px","text-align":"center"}).html(count).animate({"width":"20px","height":"20px","line-height":"10px","text-align":"center","padding-bottom":"2px"},"slow")};LW.cart.ccNumber=function(cartId,number){$.ajax({url:"member/cart/update/"+cartId+"-"+number+".html",success:function(msg){$("#cartContainer").html(msg);LW.cart.loadNumber()}})};LW.cart.canculatePrice=function(){var total=0;$(".singletotalprice").each(function(){total+=parseFloat($(this).html())});$("#pricetotal").html(total)};LW.address=new Object();LW.address.delAddre=function(id){LW.message.confirm(1,"确定从地址列表中删除此地址？",function(r){if(r){LW.location.forward("member/address/remove/"+id+".html")}})};LW.address.initMemberAddress=function(addressId,address,name,telephone){$("#receiveName").html(name);$("#receiveAddressId").val(addressId);$("#receiveAddress").html(address);$("#receivePhone").html(telephone);LW.restaurant.resetOrderParam($("#receiveAddressId").val(),$("#receiveAddress").text())};LW.address.loadDefault=function(){try{$.ajax({url:"member/address/default.html?v="+(new Date()),dataType:"json",error:function(){LW.message.show("加载用户默认地址失败!")},success:function(msg){LW.address.initMemberAddress(msg.id,msg.address,msg.name,msg.telephone)}})}catch(e){LW.message.show(e)}};var isLoadAllAddress=false;LW.address.loadAddress=function(){$("#memberAddressCt").hide();$(".oc-address-list").fadeIn();if(!isLoadAllAddress){isLoadAllAddress=true;$.ajax({url:"member/address/load.html",success:function(msg){$(".oc-address-list").html(msg);$(".oc-address-list > li").bind("click",function(){$(".oc-address-list li").removeClass("glyphicon glyphicon-ok");$(this).addClass("glyphicon glyphicon-ok");LW.address.initMemberAddress($(this).val(),$(this).attr("address"),$(this).attr("name"),$(this).attr("tel"));$(".oc-address-list").hide();$("#memberAddressCt").fadeIn()})}});return}};LW.address.validate=function(){var name=$("#name");var telephone=$("#telephone");var address=$("#address");if($.trim(name.val()).length<1){name.tooltip("show");return false}if($.trim(telephone.val()).length<1){telephone.tooltip("show");return false}if($.trim(address.val()).length<1){address.tooltip("show");return false}return true};LW.restaurant=new Object();LW.restaurant.resetOrderParam=function(addressId,address){$("#addressId").val(addressId);$("#address").val(address)};var isLoadCabinet=false;LW.restaurant.loadCabinet=function(){try{var sel=$("#restaurantSel option:selected");$(".or-restaurant-address").html(sel.attr("address"));$(".or-restaurant-tel").html(sel.attr("tel"));if(isLoadCabinet){LW.restaurant.resetOrderParam(sel.val(),sel.attr("address"))}$("#restBtn").attr("href","http://apis.map.qq.com/uri/v1/marker?marker=coord:"+sel.attr("latitude")+","+sel.attr("longitude")+";title:"+sel.text()+";addr:"+sel.attr("address"));LW.restaurant.initBindEventCabinet();$.ajax({url:"restaurant/cabinet-"+sel.val()+".html",beforeSend:function(){$(".oc-cabinet-list").html(LW.util.createProgressDiv())},error:function(){$(".oc-cabinet-list").html("<a style='display: block;text-align: center;margin-top: 30px;' href='javascript:void(0)' onclick='LW.restaurant.loadCabinet()'>数据拉去失败,再试一次!</a>")},success:function(data){$(".oc-cabinet-list").empty();$(".oc-cabinet-list").append("<option value='0' address=''>---请选择自提地点---</option>");$(data).each(function(index,item){var option=$("<option value='"+item.id+"' address='"+item.address+"' freeCount='"+item.freeCount+"'> "+item.address+" 剩余"+item.freeCount+"个柜子</option>");$(".oc-cabinet-list").append(option)})}})}catch(e){LW.message.show(e)}};var isBindCabinetChange=true;LW.restaurant.initBindEventCabinet=function(){if(isBindCabinetChange){$(".oc-cabinet-list").bind("change",function(){var option=$(".oc-cabinet-list option:selected");if(option.attr("freeCount")==0){LW.message.show("柜子已经用完,请选择其他自提地点!");$(this).get(0).selectedIndex=0;return}LW.restaurant.resetOrderParam($(this).val(),option.attr("address"))});isBindCabinetChange=false}};LW.restaurant.chooseTake=function(){var isLoadDefaultAddress=false;try{$('a[data-toggle="tab"]').on("shown.bs.tab",function(e){LW.restaurant.resetOrderParam(0,"");var takeType=$(e.target).attr("data");$("#takeType").val(takeType);if(!$("#cabinetContainer").is(":hidden")){isLoadCabinet=false;$(".oc-cabinet-list").change()}else{if(!$("#storeContainer").is(":hidden")){isLoadCabinet=true;var sel=$("#restaurantSel option:selected");LW.restaurant.resetOrderParam(sel.val(),sel.attr("address"))}else{if(!$("#doorContainer").is(":hidden")){isLoadCabinet=false;if(!isLoadDefaultAddress){LW.address.loadDefault();isLoadDefaultAddress=true
}LW.restaurant.resetOrderParam($("#receiveAddressId").val(),$("#receiveAddress").text())}}}})}catch(e){LW.message.show(e)}};LW.order=new Object();LW.order.categoryNav=function(){$(".ordernav").bind("click",function(){$(".ordernav").css({"background":"","color":"#333"});$(this).css({"background":"#e9342a","color":"#fff"});$.ajax({url:"member/order/category-"+$(this).attr("data")+".html",error:function(){LW.util.progressRemove()},beforeSend:function(){$("#order_list").html(LW.util.createProgressDiv())},success:function(msg){$("#order_list").html(msg)}})});$(".ordernav").eq(0).click()};LW.order.validForm=function(){if($("#mealTime").val()==""||$("#mealTime").val()==undefined){LW.message.show("请选择订餐时间!");return false}if($("#restaurantSel").val()==""||$("#restaurantSel").val()==undefined){LW.message.show("请选择门店!");return false}if($("#address").val()==""||$("#address").val()<=0||$("#address").val()==undefined){LW.message.show("请选择地址!");return false}return true};LW.order.submit=function(){$.ajax({type:"POST",url:"member/order/submit.html",data:$("#orderConfirmForm").serialize()})};LW.order.cancel=function(orderNo){LW.message.confirm("cancelDialog","您确定要取消该订单吗?",function(r){if(r){$.ajax({url:"member/order/cancel/"+orderNo})}})};LW.order.timeChoose=function(){$(".oc-ordertime").bind("click",function(){$("#mealTime").val($(this).attr("data"));$(".oc-ordertime").addClass("nav_bg");$(".oc-ordertime").removeClass("nav_orderbg");$(this).addClass("nav_orderbg")})};LW.pay=new Object();LW.pay.submit=function(orderNo){$.ajax({url:"member/pay/submit/"+orderNo+".html"})};LW.pay.submitTrade=function(tradeNo){$.ajax({url:"member/pay/submit/tradeno-"+tradeNo+".html"})};
LW.wx=new Object();LW.wx.getLocation=function(){wx.ready(function(){wx.getLocation({success:function(res){var latitude=res.latitude;var longitude=res.longitude;var speed=res.speed;var accuracy=res.accuracy;alert("纬度："+latitude+" 经度："+longitude+" 速度："+speed+" 位置:"+accuracy)}})})};
LW.wx.pay=function(timestamp,nonceStr,pkg,signType,paySign,orderNo){wx.ready(function(){wx.chooseWXPay({timestamp:timestamp,nonceStr:nonceStr,package:pkg,signType:signType,paySign:paySign,fail:function(res){LW.location.forward("member/pay/fail.html?orderNo="+orderNo);},cancel:function(){LW.location.forward("member/pay/fail.html?orderNo="+orderNo);},success:function (res){LW.location.forward("member/pay/success.html?orderNo="+orderNo);}});});}