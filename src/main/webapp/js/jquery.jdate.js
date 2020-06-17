// JavaScript Document
var dDialog = null;
var ajaxUrl = '/default/date';
var json = null;
var temp=new Date().getTime();
var weekday= new Array(7);

function initDatePicker(){
	var dat = new Date();
	$.ajax({
		type: "post",
		url: ajaxUrl,
		data:{
			'year':dat.getFullYear(),
			'month':(dat.getMonth()+1)
		},
		success: function(data, textStatus){
			json = data;
			if(json.language=='en'){
			    weekday[0]="Sun";
			    weekday[1]="Mon";
			    weekday[2]="Tue";
			    weekday[3]="Wed";
			 	weekday[4]="Thu";
			    weekday[5]="Fri";
			    weekday[6]="Sat";						
			}else{
			    weekday[0]="周天";
			    weekday[1]="周一";
			    weekday[2]="周二";
			    weekday[3]="周三";
			    weekday[4]="周四";
			    weekday[5]="周五";
			    weekday[6]="周六";
			}
			$("#datepicker").datepicker({
				inline: true,
				onSelect:onSelect,
				onChangeMonthYear:onChangeMonthYear,
				beforeShowDay:beforeShowDay,
				showMonthAfterYear:true,
				dateFormat:"yy-mm-dd"
			});
			initDayHover();
		},
		dataType: "json"
	});
}
function onSelect(){
	return false;
}
function initContent(date){
	html = '<div class="datePickerLayout"> \
		<ul>'+json[date]+'</ul> \
	</div>';
	return  html;
}
function initDayHover(){
	var hoverTimer, outTimer;

	$('#datepicker').on('mouseover','.dayTip',function(){
			var t = this;
			var title = $(this).data('year')+'-'+($(this).data('month')+1)+'-'+$(this).text();
			hoverTimer = setTimeout(function(){
				if(json[title]){
					var week=weekday[new Date(title).getDay()];
					if(dDialog){
						dDialog.follow(t).content(initContent(title)).title(title+'('+week+')');
					}else{
						dDialog = $.dialog({
							title:title+'('+week+')',
							id:'date',
							resize:false,
							drag :false,
							content:initContent(title),
							close: function () {
								dDialog = null;
							}
						}).follow(t);
					}
				}
			},300);
	}).on('mouseout','.dayTip',function(){
		clearTimeout(hoverTimer);
	});

	$('#datepicker').on('mouseover','.dayTip_last',function(){
		var t = this;
		var title = $(this).data('year')+'-'+($(this).data('month')+1)+'-'+$(this).text();
		hoverTimer = setTimeout(function(){
			if(json[title]){
				var week=weekday[new Date(title).getDay()];
				if(dDialog){
					dDialog.follow(t).content(initContent(title)).title(title+'('+week+')');
				}else{
					dDialog = $.dialog({
						title:title+'('+week+')',
						id:'date',
						resize:false,
						drag :false,
						content:initContent(title),
						close: function () {
							dDialog = null;
						}
					}).follow(t);
				}
			}
		},300);
	}).on('mouseout','.dayTip_last',function(){
		clearTimeout(hoverTimer);
	});
}

function onChangeMonthYear(year,month,inst){
	$.ajax({
		type: "post",
		url: ajaxUrl,
		data:{
			'year':year,
			'month':month
		},
		success: function(data, textStatus){
			json = data;
			if(json.language=='en'){
			    weekday[0]="Sun";
			    weekday[1]="Mon";
			    weekday[2]="Tue";
			    weekday[3]="Wed";
			 	weekday[4]="Thu";
			    weekday[5]="Fri";
			    weekday[6]="Sat";						
			}else{
			    weekday[0]="周天";
			    weekday[1]="周一";
			    weekday[2]="周二";
			    weekday[3]="周三";
			    weekday[4]="周四";
			    weekday[5]="周五";
			    weekday[6]="周六";
			}
			$("#datepicker").datepicker("refresh");
			if(dDialog){
				dDialog.close();
				dDialog = null;
			}
		},
		dataType: "json"
	});
}

function strtotime(date){
	return date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
}

function beforeShowDay(date) {
    var d = strtotime(date);
    var d_temp=new Date(d).getTime();
    var d_temp = new Date(date.getFullYear(), date.getMonth(), date.getDate()).getTime();
	if(json && json[d]){
		if(d_temp>temp){
			return [true, 'dayTip',''];
		}else{
			return [true, 'dayTip_last',''];
		}
	}else{
		return [false, '', ''];
	}
}

$(function(){
	initDatePicker();
})
