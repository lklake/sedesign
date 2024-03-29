<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/main_area.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        var examTime=20*60;
        var useTime=0,remainTime=examTime;

        // 显示使用时间和剩余时间
        function showCount(){
            if(remainTime==0){
                document.getElementById("myForm").submit();
            }
            useTime+=1;
            remainTime-=1;
            var hourU=Math.floor(useTime/3600);
            var minuteU=Math.floor((useTime-hourU*3600)/60);
            var secondU=Math.floor(useTime-hourU*3600-minuteU*60);
            document.getElementById("useTime").innerHTML=format(hourU)+":"+format(minuteU)+":"+format(secondU);

            var hourR=Math.floor(remainTime/3600);
            var minuteR=Math.floor((remainTime-hourR*3600)/60);
            var secondR=Math.floor(remainTime-hourR*3600-minuteR*60);
            document.getElementById("remainTime").innerHTML=format(hourR)+":"+format(minuteR)+":"+format(secondR);
        }

        // 格式化日期数字
        function format(timeNumber){
            if(timeNumber==0){
                return "00";
            }else if(timeNumber<10){
                return "0"+timeNumber;
            }else{
                return timeNumber;
            }
        }

        window.setInterval("showCount()",1000);
    </script>

</head>
<body style="background: url('${pageContext.request.contextPath}/image/background.png')">
<div id="main_area">
    <jsp:include page="../common/head.jsp"/>
    <jsp:include page="../common/menu.jsp"/>
    <div class="data_list">
        <div class="data_info">
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考试时间：<strong>20分钟</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                计时：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="useTime" style="font-weight: bold;"></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                剩余时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="remainTime" style="font-weight: bold;"></font></p>
            <hr/>
            <p class="examTitle">${paper.paperName}&nbsp;&nbsp;考试卷</p>
            <p class="examScoreInfo">(&nbsp;满分120&nbsp;&nbsp;单选题60分&nbsp;&nbsp;多选题60分&nbsp;)</p>
        </div>
        <div class="data_content">
            <strong><big>一，单选题</big></strong>（每题20分，答错不得分）<br/><br/>
            <form id="myForm" action="doExam?action=submit" method="post">
                <%--            <input type="hidden" name="submit_exam">--%>
                <%--            <input type="hidden" name="lessonInfo.paper.id" value="${paper.id }"/>--%>
                <c:forEach var="s" items="${paper.singleQuestionList }" varStatus="status">
                    <strong>[&nbsp;${status.index+1}&nbsp;]&nbsp;${s.content }</strong><br/><br/>
                    <input type="hidden" name="questionId" value=${s.id}>
                    <label class="radio" >
                        <input type="checkbox" name="singleAnswer"  value="A">
                            ${s.optionA }
                    </label>
                    <label class="radio">
                        <input type="checkbox" name="singleAnswer"  value="B">
                            ${s.optionB }
                    </label>
                    <label class="radio">
                        <input type="checkbox" name="singleAnswer"  value="C">
                            ${s.optionC }
                    </label>
                    <label class="radio">
                        <input type="checkbox" name="singleAnswer"  value="D">
                            ${s.optionD }
                    </label>
                    <br/>
                </c:forEach>
                <strong><big>二，多选题</big></strong>（每题30分，答错不得分）<br/><br/>
                <c:forEach var="m" items="${paper.multiQuestionList }" varStatus="status">
                    <input type="hidden" name="questionId" value=${m.id}>
                    <strong>[&nbsp;${status.index+1}&nbsp;]&nbsp;${m.content }</strong><br/><br/>
                    <label class="checkbox">
                        <input type="checkbox" name="multiAnswer" value="A">
                            ${m.optionA }
                    </label>
                    <label class="checkbox">
                        <input type="checkbox" name="multiAnswer" value="B">
                            ${m.optionB }
                    </label>
                    <label class="checkbox">
                        <input type="checkbox" name="multiAnswer" value="C">
                            ${m.optionC }
                    </label>
                    <label class="checkbox">
                        <input type="checkbox" name="multiAnswer" value="D">
                            ${m.optionD }
                        <input type="hidden" name="multiAnswer" value="|">
                    </label>
                    <br/>
                </c:forEach>
                <button class="btn btn-primary" type="submit">提交作业</button>
            </form>
        </div>
    </div>
</div>

</body>
