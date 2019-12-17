<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Form</title>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css">
        <style>
            body {font-family: monospace;} 
        </style>
    </head>
    <body style="padding: 15px">
        <form:form modelAttribute="exam" class="pure-form" method="post" action="${pageContext.request.contextPath}/mvc/exam/${action}">
            <fieldset>
                <legend>Exam Form Post（考試註冊）</legend>
                <form:input path="id" placeholder="請輸入學員編號" readonly="${readonly}" />
                <form:select path="exam" >
                    <form:option value="">考試代號</form:option>
                    <form:option value="808">OCP I 808</form:option>
                    <form:option value="809">OCP II 809</form:option>
                    <form:option value="900">OCAD 900</form:option>
                </form:select><p/>
                可考試時段（可複選）
                <form:checkbox path="slot" value="A" />上午(A) 
                <form:checkbox path="slot" value="B" />下午(B) 
                <form:checkbox path="slot" value="C" />晚上(C)<p/>
                繳費狀況：
                已繳 <form:radiobutton path="pay" value="true" />
                未繳 <form:radiobutton path="pay" value="false" /><p/>
                備註：
                <form:textarea path="note" /><p/>
                <button type="submit" class="pure-button pure-button-primary">${action}</button><p/>
                <form:errors path="*" />
            </fieldset>
        </form:form>
        ${stat}
        <table class="pure-table pure-table-bordered">
            <thead>
                <tr style="cursor: pointer" >
                    <th colspan="2">delete / update</th>
                    <th>id</th>
                    <th>exam</th>
                    <th>slot</th>
                    <th>pay</th>
                    <th>note</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="e" items="${exams}">
                    <tr onmouseover="this.style.background = '#CCCCCC'" onmouseout="this.style.background = 'white'">
                        <td>
                            <button type="button" class="pure-button pure-button-primary" onclick="location.href = '${pageContext.request.contextPath}/mvc/exam/delete/${e.id}'">
                                Delete
                            </button>
                        </td>
                        <td>
                            <button type="button" class="pure-button pure-button-primary" onclick="location.href = '${pageContext.request.contextPath}/mvc/exam/get/${e.id}'">
                                Update
                            </button>
                        </td>
                        <td>${e.id}</td>
                        <td>${e.exam}</td>
                        <td>${e.slotToString}</td>
                        <td>${e.pay}</td>
                        <td>${e.note}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>