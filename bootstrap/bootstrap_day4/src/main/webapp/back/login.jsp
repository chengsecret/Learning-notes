<%@page isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <!--bootstrap 核心css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot/css/bootstrap.min.css">
    <!--jquery核心js-->
    <script src="${pageContext.request.contextPath}/boot/js/jquery-3.5.1.min.js"></script>
    <!--bootstrap 核心js-->
    <script src="${pageContext.request.contextPath}/boot/js/bootstrap.min.js"></script>
    <style>
        .form-control{
            height: 45px;
        }
    </style>
</head>
<body>
<div class="container-fluid">

    <!--标题用户登录-->
    <div class="row" style="margin-top: 70px;">
        <div class="col-sm-6 col-sm-offset-3">
            <h1 class="text-center">用户登录</h1>
        </div>
    </div>
    <!--登录表单-->
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <!--表单-->
            <form>

                <div class="form-group">
                    <label for="name">用户名:</label>
                    <input type="text" class="form-control" id="name" placeholder="请输入用户名">
                </div>
                <div class="form-group">
                    <label for="password">密码:</label>
                    <input type="password" class="form-control" id="password" placeholder="请输入密码">
                </div>
                <div class="form-group">
                    <label for="code">验证码:</label>
                    <div>
                        <input type="text" class="form-control" style="width: 70%;float: left;height: 55px;" id="code" placeholder="请输入验证码">
                        <img src="../boot/imgs/2.jpg" style="float: right;width: 220px;height: 55px;" alt="">
                    </div>
                </div>

                <div class="clearfix"></div>
                <a href="${pageContext.request.contextPath}/back/index.jsp" type="submit"  class="btn btn-danger" style="margin-top: 10px;float: left;width: 65%">登录</a>
                <button type="submit" class="btn btn-info " style="margin-top: 10px;float: right; width: 30%">注册</button>
            </form>
        </div>
    </div>

</div>
</body>
</html>