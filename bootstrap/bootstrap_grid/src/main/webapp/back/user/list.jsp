<%@page isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    th {
        text-align: center;
    }
</style>
<%--页面中心--%>
<div class="col-sm-10">


    <%--巨幕--%>
    <div class="jumbotron">
        <h2>用户管理模块!</h2>
        <p class="text-info">描述:This is a simple hero unit, a simple jumbotron-style component for calling extra
            attention to featured content or information.</p>
    </div>

    <%--jgrid表格--%>
    <table id="userList"></table>

    <%--分页工具栏--%>
    <div id="pager"></div>

</div>

<script>
    $(function () {
        //初始化表格
        $("#userList").jqGrid({
            styleUI: "Bootstrap",
            url: "${pageContext.request.contextPath}/user/findAll",
            datatype: "JSON",
            autowidth: true,
            caption: "用户列表",
            hidegrid: false,
            height: 500,
            colNames: ["编号", "姓名", "年龄", "性别", "生日", "所属部门"],
            colModel: [
                {name: "id", align: "center", editable: false, width: 200},
                {name: "name", align: "center", editable: true},
                {name: "age", align: "center", editable: true},
                {
                    name: "sex", align: "center", editable: true,
                    edittype: "select", editoptions: {
                        value: "1:男;2:女"
                    }
                },
                {name: "bir", align: "center", editable: true},
                {
                    name: "dept.id", align: "center", editable: true,
                    edittype: "select", editoptions: {
                        dataUrl: "${pageContext.request.contextPath}/dept/findAll"
                    },
                    // formatter:function(){
                    //     return  ""
                    // }
                },
            ],
            pager: "#pager",
            rowNum: 2,
            rowList: [5, 10, 15, 20],
            viewrecords: true,
            editurl: "${pageContext.request.contextPath}/user/edit"
        }).navGrid("#pager", {}, //options
            {
                closeAfterEdit: true,//关闭面板
                reloadAfterSubmit: true,
            },//编辑面板的配置
            {
                closeAfterAdd: true,
                reloadAfterSubmit: true,
            },//添加面板的配置
            {
                closeAfterDelete: true,
                reloadAfterSubmit: true
            },
            {}  //search
        );
    })
</script>