// JavaScript Document
$(function() {

    $('#quickMenu .sub').hover(function() {
        $('.submenu', this).show();
    }, function() {
        $('.submenu', this).hide();
    })


    $('.ipt input').inputHint();
//  $( "#datepicker" ).datepicker({
//      inline: true
//  });
    $('.tabs').tabs({
        active: 0,
        event: "mouseover",
        activate: function(event, ui) {
            $('.more', this).attr('href', $('a', ui.newTab).attr('rel'));
        }
    });
    $('.more').click(function(){
        $(this).prop('href',$(this).siblings('ul').find('li.ui-tabs-active>a').attr('rel'));
    });
    var automove = true;
    function autotab(){
        var index =  0;
        var length = $(".tab1 .tabTitle li").length;
        $(".tab1 .tabTitle li").each(function(i, el) {
            if($(this).attr("tabindex") == 0){
                index = i+1;
            }
        });
        if(index >= length)
        {
            index = 0;
        }
        automove && !$(".tab1").hasClass("stopMove") && $(".tab1").tabs({active:index});
    }

    var tab_handler = setInterval(autotab, 8000);
    $(".tab1 .ui-tabs-active").mouseover(function(event) {
        automove = false;
        clearInterval(tab_handler);
    }).mouseout(function(event) {
        automove = true;
        tab_handler = setInterval(autotab, 48000);
    });

    $('#myslide').myslide();
    if ($('#mn').length > 0 && $('#sd').length > 0) {
        var defaultHeight = 400;
        var obj = $('#mCon').length > 0 ? $('#mCon') : $('#mn');

        var mnHeight = obj.outerHeight(true);


        if (mnHeight < defaultHeight) {
            mnHeight = defaultHeight;
            obj.height(mnHeight);
        }

        var sdHeight = $('#sd').outerHeight(true);

        if (sdHeight > mnHeight) {
            obj.height(sdHeight);
        } else {
            $('#sd').height($('#mn').outerHeight(true));
        }
    }


    $('.schTab li,.schSortTab li').click(function() {
        $(this).addClass('curr').siblings().removeClass('curr');
    })

    $('.loginTab li').click(function(e) {
        var index = $(this).index();
        var usernameField = $("#username");
        $('#login_error').html('');
        usernameField.next(".placeholder").html(index ? "单位名称" : "学生账号");

        $('#mobile div').eq(index).show().siblings().hide();
        ;
        $(this).addClass('curr').siblings().removeClass('curr');

        var href = $('a', this).attr('href');
        $('#loginForm').attr('action', href);

        var pwdUrl = index ? '/vip/user/findpwd' : '/user/findpwd';
        $('#loginForm .loginPanel >a').attr('href', pwdUrl);
        e.preventDefault();
    });

    $('.loginTab2 li').click(function(e) {
        var index = $(this).index();

        $(this).parents(".it").next(".ic").children('form:eq('+index+')').show().siblings().hide();

        $('#mobile div').eq(index).show().siblings().hide();
        $(this).addClass('curr').siblings().removeClass('curr');

        e.preventDefault();
    });

    $('.jobSd .jobSdItem').each(function(index, element) {
        if (!$(this).hasClass('hauto') && $(this).height() >= 130) {
            $(this).addClass('cover').append('<a class="more" href="#">更多</a>');
        }
    });

    $('.jobSd .cover .more').click(function(e) {
        $(this).parent().removeClass('cover').addClass('hauto');
        $(this).remove();
        e.preventDefault();
        return false;
    });
})
function showQRcode(t, src) {
    if ($(t).hasClass('isShow')) {
        return false;
    } else {
        $(t).addClass('isShow');
        $('#qrimg').html('<img src="' + src + '" />');
        $('#qrwp').show();
    }
}
function hideQRcode() {
    $('#qricon').removeClass('isShow');
    $('#qrwp').hide();
}

function delRecords(name) {
    $.post('/user/delete_scan', {name: name}, function(data, s) {
        $('#sd .kItem').html('');
    });
}
function getuserpm() {

}
function addFollow(type, id) {
    ajax('/user/follow',
            {ajax: true, type: type, id: id}
    );
}
function ajax(url, data, callback) {

    var jsonpCallback = jsonpCallback || 'showDialog';
    $.ajax({
        type: 'post',
        url: url,
        data: data,
        dataType: "jsonp",
        jsonpCallback: jsonpCallback,
        success: function(data, status) {
        }
    });
}
function showDialog(json) {
    if (json.option.type >= 3) {
        var newDialog = $.dialog(json.dialog);
    } else if (json.option.type < 3) {
        dialog = $.dialog(json.dialog);
    }
}
/*extends*/
function initUI(box) {
    var $p;
    if (typeof box == 'undefined')
        $p = $(document);
    else
        $p = box;
    $('.hitherto', $p).click(function() {
        var endtime = $(this).parents('td').find('input[name="endtime"]');
        if (this.checked) {
            endtime.val('');
            endtime.attr({'disabled': true, 'datatype': null});
        } else {
            endtime.attr({'disabled': false, 'datatype': '*'});
            endtime.focus();
        }
    });
}
//地区联动
function arr2sel(arr, val, flag, is_en) {

    if (is_en) {
        var sel = '<option value="">--' + (flag ? 'Please choose' : 'All') + '--</option>';
    } else {
        var sel = '<option value="">--' + (flag ? '请选择' : '全部') + '--</option>';
    }

    if (flag == 2 && !val) {
        return sel;
    }
    for (var i in arr) {
        var selected = (val == arr[i][0]) ? ' selected="selected"' : '';
        sel += '<option value="' + arr[i][0] + '"' + selected + '>' + arr[i][1] + '</option>';
    }
    return sel;
}

//首页反馈
function sendMessage() {
    art.dialog({
        id: 'feedBack',
        title: '咨询反馈',
        width: '600px',
        height: '220px',
        button: {
            name: '提交',
            callback: function() {
                var feedBack, email, emailRg;
                feedBack = $("#feedBack").val().trim();
                email = $("#feedEmail").val();
                emailRg = new RegExp(/^[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$/);
                if (feedBack == "") {
                    art.dialog({
                        time: 2,
                        id: 'error',
                        title: '错误提示',
                        icon: 'error',
                        content: "反馈内容不能为空！"
                    });
                    return false;
                } else if (emailRg.test(email) == false) {
                    art.dialog({
                        time: 2,
                        id: 'error',
                        title: '错误提示',
                        icon: 'error',
                        content: "邮箱填写有误！"
                    });
                    return false;
                } else {
                    $.ajax({
                        type: 'POST',
                        url: '/default/feedBack',
                        data: {'feedBack': feedBack, 'email': email},
                        error: function() {
                            art.dialog({
                                time: 2,
                                id: 'error',
                                title: '错误提示',
                                icon: 'error',
                                content: "出错啦！"
                            });
                        },
                        success: function(data) {
                            if (data) {
                                art.dialog({
                                    time: 2,
                                    id: 'success',
                                    title: '提交成功',
                                    icon: 'succeed',
                                    content: "反馈提交成功！"
                                });
                                return true;
                            }
                            else {
                                art.dialog({
                                    time: 2,
                                    id: 'error',
                                    title: '错误提示',
                                    icon: 'error',
                                    content: "保存失败，请重试！"
                                });
                                return false;
                            }
                        }
                    })
                }
            },
            focus: true
        },
        content: '<div style="width:600px;height:240px;">' +
                '吐槽内容：<textarea cols="96" style="width:600px;" rows="10" id="feedBack" name="feedback"></textarea>' +
                '联系邮箱：<input type="text" name="email" id="feedEmail" onfocus="javascript:this.value=\'\'" style="margin-top:4px;width:200px;" value="可在此填写您的邮箱方便我们回复!"/>' +
                '</div>'
    });
}

$.fn.Slinkage = function() {
    return $(this).each(function() {
        var self = this,
                js = [],
                $hidden = $(':hidden', self),
                val = $hidden.val();
        var vlength = val.length;
        var val1 = val2 = flag = 0;
        switch (val.length) {
            case 0:
                flag = 2;
                break;
            case 3:
                val1 = val;
                break;
            case 6:
                val1 = val.substr(0, 3);
                val2 = val;
                break;
        }
        eval("js=" + $(self).attr('data-source'));
        var is_en = $(self).attr('is_en');
        $('select:eq(1)', self).html(arr2sel(str2arr(js, 2, val1), val2, flag, is_en)).change(function() {
            if ($(this).val() == '') {
                var val = $('select:eq(0) :selected', self).val();
                $hidden.val(val);
            } else {
                $hidden.val($(this).val());
            }
        });
        $('select:eq(0)', self).html(arr2sel(str2arr(js, 1), val1, 1, is_en)).change(function(i) {
            var val = $(this).val();
            $hidden.val(val);
            flag = val == '' ? 2 : 0;
            $('select:eq(1)', self).html(arr2sel(str2arr(js, 2, val), '', flag, is_en));
        });
    })
}
$.fn.SlinkageCity = function() {
    return $(this).each(function() {
        var self = this,
                js = [],
                $hidden = $(':hidden', self),
                val = $hidden.val();
        var vlength = val.length;
        var val1 = val2 = flag = 0;
        switch (val.length) {
            case 0:
                flag = 2;
                break;
            case 3:
                val1 = val;
                break;
            case 6:
                val1 = val.substr(0, 2) + "0000";
                val2 = val;
                break;
        }
        eval("js=" + $(self).attr('data-source'));
        var is_en = $(self).attr('is_en');
        $('select:eq(1)', self).html(arr2sel(str2arr(js, 2, val1), val2, flag, is_en)).change(function() {
            if ($(this).val() == '') {
                var val = $('select:eq(0) :selected', self).val();
                $hidden.val(val);
            } else {
                $hidden.val($(this).val());
            }
        });
        $('select:eq(0)', self).html(arr2sel(str2arr(js, 1), val1, 1, is_en)).change(function(i) {
            var val = $(this).val();
            $hidden.val(val);
            flag = val == '' ? 2 : 0;
            $('select:eq(1)', self).html(arr2sel(str2arr(js, 2, val), '', flag, is_en));
        });
    })
}
