<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>互动式教学系统主界面</title>
<%--<link href="${pageContext.request.contextPath}/style/exam.css" rel="stylesheet">--%>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/style/main_area.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>

</head>

<body style="background: url('${pageContext.request.contextPath}/image/background.png')">
<div id="main_area">
    <jsp:include page="../common/head.jsp"/>
    <jsp:include page="../common/menu.jsp"/>
    <table align="center" style="height:100vmin;">

    </table>
</div>

</body>
</html>