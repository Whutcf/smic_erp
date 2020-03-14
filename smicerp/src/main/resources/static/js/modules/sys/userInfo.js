//判断是否存在session，如果不存在就跳到登录界面
$.ajax({
    type: "get",
    url: "/user/getUserSession",
    dataType: "json",
    async: false,
    success: function (res) {
        if(res && res.code === 200) {
            if(res.data) {
                var user = res.data;
                sessionStorage.setItem("userId", user.id);
                if (user.userName) {
                    $(".main-header .user-menu .hidden-xs,.main-sidebar .info p").text(user.userName);
                } else {
                    top.location.href = '/login';
                }
            } else {
                top.location.href = '/login';
            }
        }
    }
});