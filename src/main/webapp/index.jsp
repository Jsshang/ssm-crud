<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
        <%
            pageContext.setAttribute("APP_PATH", request.getContextPath());
        %>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <%--    引用JQuery--%>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
            crossorigin="anonymous"></script>

    <title>CRUD</title>
</head>
<body>

<%------------------------------ 员工修改的模态框 ------------------------------%>

<div class="modal fade" id="empUpdateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="empUpdateModalLabel">修改员工</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form>
                    <%-- empName --%>
                    <div class="row g-3 align-items-center">
                            <label for="staticEmpName" class="col-sm-2 col-form-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext"
                                       id="staticEmpName">
                            </div>
                    </div>
                    <%-- email --%>
                    <div class="row g-3 align-items-center">
                        <div class="col-sm-2">
                            <label for="email_update_input" class="col-form-label">email</label>
                        </div>
                        <div class="col-auto">
                            <input type="text" name="email" id="email_update_input" class="form-control" placeholder="email@gamil.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <%-- gender --%>
                    <div class="row g-3 align-items-center">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <%-- 内联单选 --%>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <%-- department --%>
                    <div class="row g-3 align-items-center">
                        <div class="col-sm-2">
                            <label for="dept_add_select" class="col-form-label">deptName</label>
                        </div>
                        <div class="col-sm-4">
                            <%-- 下拉列表，部门选项只要提交部门id即可 --%>
                            <select class="form-control" name="dId" id="dept_add_select"></select>
                        </div>
                    </div>

                </form>
                <%----------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-bs-dismiss="modal" id="emp_update_close_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>
<%----------------------------------------------------------------------------%>

<%------------------------------ 员工添加的模态框 ------------------------------%>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="staticBackdropLabel">新增员工</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form>
                    <%-- empName --%>
                    <div class="row g-3 align-items-center">
                        <div class="col-2">
                            <label for="empName_add_input" class="col-form-label">empName</label>
                        </div>
                        <div class="col-auto">
                            <input type="text" name="empName" id="empName_add_input" class="form-control" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- email --%>
                    <div class="row g-3 align-items-center">
                        <div class="col-sm-2">
                            <label for="email_add_input" class="col-form-label">email</label>
                        </div>
                        <div class="col-auto">
                            <input type="text" name="email" id="email_add_input" class="form-control" placeholder="email@gamil.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <%-- gender --%>
                    <div class="row g-3 align-items-center">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <%-- 内联单选 --%>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <%-- department --%>
                    <div class="row g-3 align-items-center">
                        <div class="col-sm-2">
                            <label for="dept_add_select" class="col-form-label">deptName</label>
                        </div>
                        <div class="col-sm-4">
                            <%-- 下拉列表，部门选项只要提交部门id即可 --%>
                            <select class="form-control" name="dId" id="dept_add_select"></select>
                        </div>
                    </div>

                </form>
                <%----------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-bs-dismiss="modal" id="emp_close_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<%----------------------------------------------------------------------------%>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2 justify-content-end">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table table-striped table-hover" id="emps_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"/></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">
        </div>
    </div>
</div>

<script type="text/javascript">

    var totalRecord,currentPage;
    // 1.页面加载完成之后，发送ajax请求，要到分页数据
    $(function(){
        // 去首页
        to_page(1);
    });

    function to_page(pn){

        $("#check_all").prop("checked", false);

        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result){
                // console.log(result);
                // 请求成功以后需要做的事情
                // 1.解析json，在表格中显示员工信息
                build_emps_table(result);
                // 2.显示分页信息
                build_page_info(result);
                // 3.显示分页条
                build_page_nav(result);
            }
        })
    }

    function build_emps_table(result){
        // 清空table表格
        $("#emps_table tbody").empty();

        var emps = result.extend.pageInfo.list;

        $.each(emps, function (index, item) {
            var checkboxTd = $("<td><input type='checkbox' class='check_item'></td>")
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

            // 为编辑按钮添加一个自定义的属性 来表示员工id
            editBtn.attr("edit-id",item.empId);

            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");

            // 给delete按钮增加自定义属性，用于记录员工id
            delBtn.attr("edit-id",item.empId);

            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            // append方法执行完成会返回原来的元素，所以可以链式使用
            $("<tr></tr>").append(checkboxTd).append(empIdTd).append(empNameTd).
            append(genderTd).append(emailTd).append(deptNameTd)
                .append(btnTd).appendTo("#emps_table tbody");
        });

    }

    // 解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum +"页,总"+
            result.extend.pageInfo.pages+"页,总共有"+result.extend.pageInfo.total+"条记录")
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    // 解析显示分页条,点击分页条，去往下一页
    function build_page_nav(result){
        // page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination justify-content-end");
        var firstPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("首页").attr("href","#"));
        var prePageLi =   $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("&laquo;"));

        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            // 为元素添加点击翻页的事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("&raquo;"));
        var lastPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("末页").attr("href","#"));

        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }


        ul.append(firstPageLi).append(prePageLi);
        // 遍历页面号
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
            var numLi = $("<li></li>").append($("<a></a>").addClass("page-link").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("page-item active");
            }else{
                numLi.addClass("page-item");
            }
            numLi.click(function (){
               to_page(item);
            });
            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);

        // 把url加入到nav中
        var navEle = $("<nav></nav>").attr("aria-label","Page navigation example").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    // 清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        // 清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    // 点击新增按钮 弹出模态框
    $("#emp_add_modal_btn").click(function (){
        //清楚表单数据（表单完整重置:表单数据和样式）
        // $modal = $("#staticBackdrop");
        // $modal.find("form")[0].reset();
        reset_form("#staticBackdrop form")
        // $("#staticBackdrop")[0].reset();
        //发送ajax请求 弹出部门信息，显示在下拉列表中
        getDepts("#staticBackdrop select");
        //弹出模态框
        var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'),{backdrop:"static"});
        myModal.toggle();
    });

    function getDepts(ele){
        // 清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function(result){
                // console.log(result);
                // ${"#staticBackdrop select"}.append("")
                $.each(result.extend.depts,function (){
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        });
    }

    //校验表单数据
    function validate_add_form(){
        // 1.拿到校验的数据，使用正则表达式进行校验
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u4e00-\u9fa5]{2,5}$)/;
        if(!regName.test(empName)){
            show_validate_msg("#empName_add_input","error","用户名需要由2-5位中文汉字或6-16位英文字母组成")
            return false;
        }else{
            show_validate_msg("#empName_add_input","success","")
        };

        // 校验邮箱
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_add_input","error","邮箱格式不正确")
            return false;
        }else{
            show_validate_msg("#email_add_input","success","")
        }
        return true;
    }

    // 显示校验结果的提示信息
    function show_validate_msg(ele,status,msg){
        // 清除当前元素状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }else{
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }
    }

    $("#empName_add_input").change(function(){
        // 发送ajax请求，校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser",
            data:"empName="+empName,
            type:"POST",
            success:function (result) {
                if(result.code == 100){
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax-va","success");
                }else{
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            }
        })

    });

    // 点击保存，保存员工
    $("#emp_save_btn").click(function(){
        // 1.模态框中填写的表单数据提交给服务器进行保存
        // 1.5: 对将要提交的数据进行校验
        if(!validate_add_form()){
            return false;
        }
        //1.75:判断之前的用户名校验是否成功，如果成功则可以保存
        if($(this).attr("ajax-va")=="error"){
            return false;
        }
        // 2.发送ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data:$("#staticBackdrop form").serialize(),
            success:function (result){
                if(result.code==100) {
                    //alert(result.msg);
                    //员工保存成功：需要关闭模态框并跳转到最后一页
                    $("#emp_close_btn").trigger("click");
                    // 发送ajax请求，显示最后一页数据
                    to_page(totalRecord);
                }else{
                    // console.log(result);
                    // 有哪个错误信息就显示那个字段的错误信息
                    if(undefined != result.extend.errorField.empName){
                        show_validate_msg("#empName_add_input","error",result.extend.errorField.empName);
                    }
                    if(undefined != result.extend.errorField.email){
                        show_validate_msg("#email_add_input","error",result.extend.errorField.email);
                    }
                }
            }
        })
    });

    // 单个删除，给删除按钮绑事件
    $(document).on("click",".del_btn",function(){
        // 1.是否删除的确认对话框
        var empName = $(this).parents("tr").children().eq(2).text();
        var empId = $(this).attr("edit-id");

        if(confirm("确认删除【"+empName+"】吗？")){
            // 确认，发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    // 1.我们是按钮创建之前绑定的事件，所以无法生效
    //解决方法：1.在创建按钮的时候绑定事件
    //        2.绑定单击事件，使用jquery的live()事件(新版本没有此方法，使用on方法进行替代)
    $(document).on("click",".edit_btn",function(){
        // 0.查出部门信息并显示部门列表
        getDepts("#empUpdateModal select");
        // 1.查出员工信息并显示员工信息
        getEmp($(this).attr("edit-id"));
        // 2.把员工的id信息传递给更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        //3.弹出模态框
        var myModal = new bootstrap.Modal(document.getElementById('empUpdateModal'),{backdrop:"static"});
        myModal.toggle();
    });

    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            method:"GET",
            success:function(result){
                // console.log(result);
                var empData = result.extend.emp;
                $("#staticEmpName").attr("value",empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        });
    }

    //点击更新，更新员工信息
    $("#emp_update_btn").click(function(){
       // 验证邮箱是否合法
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_update_input","error","邮箱格式不正确")
            return false;
        }else{
            show_validate_msg("#email_update_input","success","")
        }

        //2.发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function(result){
                // 1.关闭模态框，回到当前页面
                $("#emp_update_close_btn").trigger("click");
                // 2.跳转到当前页面
                to_page(currentPage);

            }
        });
    });

    // 完成全选，全不选的功能
    $("#check_all").click(function (){
        // 使用prop获取dom中原生属性的值，attr获取自定义属性的值
        // $(this).prop("checked");
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    // check_item绑定事件
    $(document).on("click",".check_item",function(){
        // 判断当前选择中的五个是不是全被选了
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    //点击全部删除，则执行批量删除
    $("#emp_delete_all_btn").click(function(){
       //$(".check_item:checked")
        var empNames = "";
        var del_idstr = ""
       $.each($(".check_item:checked"),function(){
          empNames += $(this).parents("tr").children().eq(2).text()+",";
          del_idstr += $(this).parents("tr").children().eq(1).text()+'-';
       });
        del_idstr = del_idstr.substring(0,del_idstr.length-1);
        if(empNames.length==0){
            alert("请至少选择一个人进行删除");
            return false;
        }
       if(confirm("确认删除【"+empNames.substring(0,empNames.length-1)+"】嘛")){
           // 发送ajax完成删除请求
           $.ajax({
               url:"${APP_PATH}/emp/" + del_idstr,
               type:"DELETE",
               success:function(result){
                   alert(result.msg);
                   to_page(currentPage);
               }
           });
       }
    });

</script>
</body>
</html>