// JavaScript Document
;(function($){
	$.fn.extend({
		myslide:function(options){
		 	var setting=$.extend({
		 		speed:3000,
		 		titleBg:'#000'	
		 	},options);
		 	return $(this).each(function() {
		 		var t=this;
		 		var imgWidth=$('#myslide').width();//$('img',t).width();
		 		var imgCount=$('img',t).size();
		 		var currentIndex=imgCount-1;
		 		var timerId;
		 		
		 		$(this).wrapInner('<div class="myslide-frame" style="z-index:100; position:absolute; left:0; width:'+(imgWidth*imgCount)+100+'px;"></div>');
		 		
		 		var html='<ul class="myslide-button">';
		 		for(var i=1;i<=imgCount;i++){
		 			html+='<li>'+i+'</li>';
		 		}
		 		html+='</ul><div class="myslide-titleBg" style="z-index:103; background:'+setting.titleBg+'; position:absolute; bottom:0; width:330px; height:30px;filter:alpha(opacity=50);-moz-opacity:0.5;opacity: 0.5;"></div><div class="myslide-title" style="z-index:104; position:absolute; bottom:0; width:325px; height:30px; overflow:hidden; line-height:30px;"><a style=" color:#fff; padding-left:10px;" href="#"></a></div>';
		 		
		 		$(html).appendTo(t);
		 		
		 		$('li',this).click(function(){
		 			stopPlay();
		 			currentIndex=$(this).index();
		 			$('.myslide-frame',t).stop().animate({
		 				'left':-imgWidth*currentIndex	
		 			},'slow');
		 			
		 			$(this).addClass('current').siblings().removeClass('current');
		 			
		 			var a=$('.myslide-frame a',t).eq(currentIndex);
		 			$('.myslide-title a',t).attr('href',a.attr('href')).html(a.attr('title'));
		 			timerId=window.setTimeout(autoPlay,setting.speed);
		 		});
		 		
		 		$(this).hover(function(){
		 			stopPlay();
		 		},function(){
		 			timerId=window.setTimeout(autoPlay,setting.speed);
		 		})
		 		function stopPlay(){
		 			window.clearTimeout(timerId);	
		 		}
		 		function autoPlay(){
		 			$('li:eq('+(currentIndex+1)%imgCount+')',t).click();	
		 		}
		 		autoPlay();
		 	});
		}	
	});
})(jQuery);