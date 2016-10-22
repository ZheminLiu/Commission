$(function () {
    $("#form").Validform({
        tiptype: function (msg, o, cssctl) {
            $("#info").html("");
            if (!o.obj.is("form")) {
                var form_group = o.obj.closest('.form-group');
                var infoObj = form_group.find("label.error");
                if (infoObj.size() == 0) {
                    infoObj = $('<label class="error"></label >');
                    form_group.append(infoObj);
                }
                if (o.type == 2) {
                    form_group.addClass('has-success').removeClass('has-error');

                    infoObj.fadeOut(200);
                } else {
                    form_group.removeClass('has-success').addClass('has-error');

                    infoObj.html(msg);
                    if (infoObj.is(":visible")) {
                        return;
                    }
                    infoObj.show().animate({
                        top: top - 35
                    }, 200);
                }
            }
        },
        beforeSubmit: function () {
            change();
            return false;
        }
    });
});

/* 需要校验旧密码的接口 更新密码请求一直失败 状态为false*/
function change() {
    var oldpassword = $("#oldpassword").val();
    var newpassword = $("#newpassword").val();
    var newpassword2 = $("#newpassword2").val();
    if (oldpassword.length == 0 || newpassword.length == 0 || newpassword2.length == 0) {
        hint("D", "Password can not be null!");
    } else if (newpassword != newpassword2) {
        hint("D", "The new password and confirm password do not match!");
    } else {
        //校验旧密码
        $.ajax({
            url: "",
            data: {
                oldpassword: oldpassword
            },
            async: true,
            cache: false,
            success: function (data) {
                if (data.status == "true") {
                    //更新密码
                    $.ajax({
                        url: "updateUserPwd",
                        data: {
                            newpassword: newpassword
                        },
                        async: true,
                        cache: false,
                        success: function (data) {
                            if (data.status == "true") {
                                hint("S", "Password has been updated~");
                                $("#oldpassword").val(null);
                                $("#newpassword").val(null);
                                $("#newpassword2").val(null);
                            } else {
                                hint("D", "Update failed!");
                            }
                        },
                        error: function () {
                            hint("D", "Request failed!");
                        }
                    });
                    //end 更新密码
                } else {
                    hint("D", "Password not changed, no match for old password.");
                }
            },
            error: function () {
                hint("D", "Request failed!");
            }
        });

    }
}

function cancel() {
    windows.location.reload();
}