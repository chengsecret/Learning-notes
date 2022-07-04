<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--页面中心内容-->
        <div class="col-sm-10">
            <!--页头-->
            <div class="page-header" style="margin-top: -20px;margin-bottom: 5px;">
                <h1>用户管理</h1>
            </div>
            <!--标签页组件-->
            <div>
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">用户列表</a></li>
                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">添加用户</a></li>
                </ul>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <!--处理用户列表的面板-->
                        <div class="panel panel-default">

                            <div class="panel-body text-center">

                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="exampleInputName2">Name</label>
                                        <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail2">Email</label>
                                        <input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">
                                    </div>
                                    <button type="submit" class="btn btn-default">Send invitation</button>
                                </form>
                            </div>
                            <div class="row">
                                <div class="col-sm-10 col-sm-offset-1">
                                    <!--添加按钮-->
                                    <!--<ul class="list-unstyled">-->
                                        <!--<li><button class="btn btn-success btn-sm">添加用户信息</button></li>-->
                                    <!--</ul>-->
                                    <!--表格-->
                                    <table class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>姓名</th>
                                            <th>年龄</th>
                                            <th>生日</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody id="userLists">

                                        </tbody>
                                    </table>
                                    <!--分页组件-->
                                    <div class="pull-right">
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination">
                                                <li class="disabled">
                                                    <a href="#" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <li class="active"><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#">5</a></li>
                                                <li>
                                                    <a href="#" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <!--处理消息提示-->
                        <div id="succMsg" class="alert alert-success alert-dismissible" style="display: none;" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>删除成功:</strong>当前数据以被删除!
                        </div>
                        <div id="errorMsg" class="alert alert-danger alert-dismissible" style="display: none;" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>删除失败:</strong> java.lang.RuntimeException 删除数据无效!
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="profile">
                        <!--添加表单-->
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <form id="userSaveForm">
                                            <div class="form-group">
                                                <label for="aa">用户名</label>
                                                <input type="text" class="form-control" name="name" id="aa" placeholder="请输入姓名">
                                            </div>
                                            <div class="form-group">
                                                <label for="bb">年龄</label>
                                                <input type="text" class="form-control" name="age" id="bb" placeholder="请输入年龄">
                                            </div>
                                            <div class="form-group">
                                                <label for="cc">生日</label>
                                                <input type="text" class="form-control" name="bir" id="cc" placeholder="请输入生日">
                                            </div>
                                            <button type="button" id="saveUserBtn" class="btn btn-info btn-block">添加用户信息</button>
                                            <script>
                                                $(function(){
                                                    $("#saveUserBtn").click(function(){
                                                        //表单序列化
                                                        console.log($("#userSaveForm").serialize());
                                                        //发送异步请求传递用户输入数据
                                                        $.post("${pageContext.request.contextPath}/user/save",$("#userSaveForm").serialize(),function(res){
                                                            console.log(res);
                                                            if(res.status){
                                                                alert(res.msg);
                                                                location.reload();//刷新页面
                                                            }else{
                                                                alert(res.msg);
                                                            }
                                                        },"JSON");
                                                    });
                                                })
                                            </script>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--修改模态框-->
        <div class="modal fade" id="editUserModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"> <span class="glyphicon glyphicon-user"></span> 编辑用户信息</h4>
                    </div>
                    <div class="modal-body">

                        <form id="userEditForm">
                            <div class="form-group">
                                <label for="name">Id</label>
                                <p class="form-control-static" id="idstatic"></p>
                                <input type="hidden" class="form-control" name="id" id="id">
                            </div>
                            <div class="form-group">
                                <label for="name">用户名</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="请输入姓名">
                            </div>
                            <div class="form-group">
                                <label for="age">年龄</label>
                                <input type="text" class="form-control" name="age" id="age" placeholder="请输入年龄">
                            </div>
                            <div class="form-group">
                                <label for="bir">生日</label>
                                <input type="text" class="form-control" name="bir" id="bir" placeholder="请输入生日">
                            </div>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button onclick="editUserInfo()" type="button" class="btn btn-primary">确认修改</button>
                        <script>
                            function editUserInfo(){
                                //获取表单数据
                                console.log($("#userEditForm").serialize());
                                //发送请求修改
                                $.post("${pageContext.request.contextPath}/user/update",$("#userEditForm").serialize(),function(res){
                                    if(res.status){
                                        alert(res.msg+",点击确定关闭当前对话框!");
                                        $("#editUserModal").modal('hide');
                                        findAll();//刷新数据
                                    }else{
                                        alert(res.msg);
                                    }
                                },"JSON");
                            }
                        </script>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消修改</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(function(){

                //页面加载之后
                findAll();

            });
            //更新列表数据
            function findAll(){
                //页面加载完成之后查询数据
                $.get("${pageContext.request.contextPath}/user/findAll",function(res){
                    $("#userLists").empty();//清空上一次数据
                    //遍历数据
                    $.each(res,function(i,user){
                        var tr = $("<tr/>");
                        var idTd = $("<td/>").text(user.id);
                        var nameTd = $("<td/>").text(user.name);
                        var ageTd = $("<td/>").text(user.age);
                        var birTd = $("<td/>").text(user.bir);
                        var optionTd = $("<td/>");
                        var delBtn = $("<a href=\"javascript:;\" onclick=\"delUserRow('"+user.id+"');\" class=\"btn btn-danger btn-sm\" style='margin-right: 5px;'>删除</a>");
                        var editBtn = $("<a onclick=\"editUserRow('"+user.id+"')\" class=\"btn btn-info btn-sm\" data-toggle=\"modal\" data-target=\"#editUserModal\">修改</a>\n");
                        //删除按钮放入optionTd
                        optionTd.append(delBtn).append(editBtn);
                        tr.append(idTd).append(nameTd).append(ageTd).append(birTd).append(optionTd);
                        $("#userLists").append(tr);
                    });
                },"JSON");
            }

            //删除
            function delUserRow(id){
                console.log(id);
                //发送异步请求
                $.get("${pageContext.request.contextPath}/user/delete",{id:id},function(res){
                    console.log(res);
                    if(res.status){
                        $("#succMsg").show(3000);
                        setTimeout(function () {
                            $("#succMsg").hide(2000);
                            findAll();
                        },6000);
                    }else{
                        $("#errorMsg").show(3000);
                    }
                });
            }

            //修改
            function editUserRow(id){
                console.log(id);
                //根据id查询一个人信息
                $.get("${pageContext.request.contextPath}/user/findOne",{id:id},function(res){
                    console.log(res);
                    //数据渲染到模态框
                    $("#idstatic").text(res.id);
                    $("#id").val(res.id);
                    $("#name").val(res.name);
                    $("#age").val(res.age);
                    $("#bir").val(res.bir);
                },"JSON");
            }

        </script>


