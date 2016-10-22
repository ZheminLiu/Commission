function showEditModal() {
    $('#addUser').modal('show');
}

var list;
$(function () {
    list = $("tbody").html();
    //$("tbody").html("");
    validateEditUser();
    validateAddUser();
    initUserList();
});

function initUserList() {
    $.ajax({
        url: "",
        type: "POST",
        dataType: "json",
        cache: false,
        async: true,
        success: function (data) {
            if (data.status) {
                $("tbody").html("");
                var Num = 1;
                $.each(data.result, function (index, item) {
                    var userlist = list;
                    userlist = userlist.replace("{userID}", item.userID);
                    userlist = userlist.replace("{Num}", ++Num);
                    userlist = userlist.replace("{Name}", item.Name);
                    userlist = userlist.replace("{Linkman}", item.Linkman);
                    userlist = userlist.replace("{Email}", item.Email);
                    userlist = userlist.replace("{Mobile}", item.Mobile);
                    userlist = userlist.replace("{Address}", item.Address);
                    $("tbody").append(userlist);
                });
            } else {
                hint("D", "The data.status return false!");
            }
            //loading(1);
        },
        error: function () {
            //loading(1);
            hint("D", "Request failed!");
        }
    });
}

//edit 填充信息
function showmodel(element) {
    var row = $(element).parent().parent();
    $("#uid").val($(row).attr("id"));
    $("#name").val($(row).children("td[data='Name']").text());
    $("#password").val("");
    $("#mobile").val($(row).children("td[data='Mobile']").text());
    $("#email").val($(row).children("td[data='Email']").text());
    $("#linkman").val($(row).children("td[data='Linkman']").text());
    $("#address").val($(row).children("td[data='Address']").text());
    $("#editUser").modal("show");
}

function hidemodel() {
    $("#form-user")[0].reset();
    $("#editUser").modal("hide");
}

function validateEditUser() {
    $("#edituserform").Validform(
        {
            tiptype: function (msg, o, cssctl) {
                $("#info").html("");
                if (!o.obj.is("form")) {
                    ;
                    var form_group = o.obj.closest('.form-group');
                    var infoObj = form_group.find("label.error");
                    if (infoObj.size() == 0) {
                        infoObj = $('<label class="error"></label >');
                        form_group.append(infoObj);
                    }
                    if (o.type == 2) {
                        form_group.removeClass(
                            'has-error');

                        infoObj.fadeOut(200);
                    } else {
                        form_group.addClass(
                            'has-error');

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
                updateUser();
                return false;
            }
        });
}

function validateAddUser() {
    $("#adduserfrom").Validform(
        {
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
                        form_group.removeClass(
                            'has-error');

                        infoObj.fadeOut(200);
                    } else {
                        form_group.addClass(
                            'has-error');

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
                addUser();
                return false;
            }
        });
}

function hideaddmodel() {
    $("#adduserfrom")[0].reset();
    $("#addUser").modal("hide");
}

function updateUser() {
    var user = checkUser();
    if (user == null) {
        return;
    }
    user = JSON.stringify(user);
    $.ajax({
        type: "POST",
        url: "",
        dataType: "json",
        contentType: "application/json",
        data: user,
        async: false,
        cache: false,
        success: function (data) {
            if (data.status) {
                hint("D", "Update successfully!");
                hidemodel();
                initUserList();
            } else {
                hint("D", "The data.status return false!");
            }
        },
        error: function () {
            hint("D", "Request failed!");
        }
    });
}

function checkUser() {
    var user = {};
    user.userID = $("#uid").val();
    user.password = $("#password").val();
    user.name = $("#name").val();
    user.mobile = $("#mobile").val();
    user.email = $("#email").val();
    user.linkman = $("#linkman").val();
    user.address = $("#address").val();
    return user;
}

function addUser() {
    var user = {};
    user.password = $("#adpassword").val();
    user.name = $("#adname").val();
    user.mobile = $("#admobile").val();
    user.email = $("#ademail").val();
    user.address = $("#adaddress").val();
    user.linkman = $("#adlinkman").val();
    user = JSON.stringify(user);
    $.ajax({
        type: "POST",
        url: "",
        dataType: "json",
        contentType: "application/json",
        data: user,
        async: false,
        cache: false,
        success: function (data) {
            if (data.status) {
                hint("S", "Add salesman successfully!");
                hideaddmodel();
                initUserList();
            } else {
                hint("D", "The data.status return false!");
            }
        },
        error: function () {
            hint("D", "Request failed!");
        }
    });
}

//uid设为全局
var uid = "";
function deleteuser(el) {
    uid = $(el).parent().parent().attr("id");
    $('#confirm-delete').modal('show');
}

function deleteSalesman() {
    if (uid == "" || uid == undefined) {
        hint("D", "Failed to get salesman ID!");
    } else {
        $.ajax({
            url: "",
            type: "POST",
            data: {
                userID: uid
            },
            dataType: "json",
            cache: false,
            async: true,
            success: function (data) {
                if (data.status) {
                    hint("S", "Delete successfully!");
                    initUserList();
                } else {
                    hint("D", "The data.status return false!");
                }
            },
            error: function () {
                hint("D", "Request failed!");
            }
        });
    }

}