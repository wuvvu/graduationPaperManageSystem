<%@ page contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="utf-8">
    <title>毕业论文数字化管理平台--管理员端</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="../css/admin_login.css">
</head>
<body>

<div id="particles-js" style="display: flex;align-items: center;justify-content: center">
</div>
<form action="${pageContext.request.contextPath}/newAdmin/loginCheck" method="post" id="login-form">
    <div class="login-page">
        <div class="login-content">
            <div class="login-tit">登录</div>
            <div class="login-input">
                <label>
                    <input type="text" name="username" placeholder="用户名">
                </label>
            </div>
            <div class="login-input">
                <label>
                    <input type="password" name="password" placeholder="密码">
                </label>
            </div>
            <div class="login-btn">
                <div class="login-btn-left">
                    <span onclick="document.getElementById('login-form').submit()">登录</span>
                </div>
                <!--<div class="login-btn-right" onClick="changeImg()">
                  <img src="img/check.png" alt="" id="picture"> 记住密码
                </div>-->
            </div>
        </div>
    </div>
</form>

<script src="../js/particles.js"></script>
<script src="../js/app.js"></script>
<!--<script>
    function changeImg() {
        let pic = document.getElementById('picture');
        console.log(pic.src)
        if (pic.getAttribute("src", 2) == "img/check.png") {
            pic.src = "img/checked.png"
        } else {
            pic.src = "img/check.png"
        }
    }
</script>-->
</body>
</html>
