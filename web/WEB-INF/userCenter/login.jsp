<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/main_area.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        function checkForm(){
            var id=document.getElementById("id").value;
            var password=document.getElementById("password").value;
            if(id==null||id==""){
                alert("学号不能为空！");
                return false;
            }
            if(password==null||password==""){
                alert("密码不能为空！");
                return false;
            }
            $('#password').value="";
            $('#id').value="";
            return true;
        }

        function resetValue(){
            document.getElementById("id").value="";
            document.getElementById("password").value="";
        }
    </script>
</head>
<body style="background: url('${pageContext.request.contextPath}/image/background.png')">

<div id="main_area"style="width: 1000px;height: 100vmin;">
    <jsp:include page="../common/head.jsp"/>
    <div align="center" style="height:100vmin ;background: url('${pageContext.request.contextPath}/image/head.jpg')">
        <form action="userCenter?action=login" method="post" onsubmit="return checkForm()">
            <table  width="100%" height="100%"  >
                <tr height="200">
                    <td colspan="4"></td>
                </tr>
                <tr height="10">
                    <td width="68%"></td>
                    <td width="10%"><label>学号：</label></td>
                    <td><input type="text" id="id" name="userId" value="201714"/></td>
                    <td width="30%"></td>
                </tr>
                <tr height="10">
                    <td width="40%"></td>
                    <td width="10%"><label>密码：</label></td>
                    <td><input type="password" id="password" name="password" value="password"/></td>
                    <td width="30%"></td>
                </tr>

                <tr height="10">
                    <td width="40%" ></td>

                    <td width="10%"><button class="btn btn-primary" type="submit">登录</button></td>
                    <td><button class="btn btn-primary" type="button"  onclick="resetValue()">重置</button></td>
                    <td width="10%" ><input id="identity" name="identityFlag" value="teacher" type="checkbox">教师登录</td>
                    <td width="20%" ><div class="alert alert-error" id="state" >${state}</div></td>

                </tr>
                <tr >
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
</html>
<script type="text/javascript">
	document.getElementById("id").focus();
    document.getElementById("id").select();
</script>