<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <%@include file="../../commons/tag/header.jsp" %>
    <style>
        .form {
            margin: auto;
            border: 2px solid green;
            padding: 45px;
            margin-bottom: 25px;
        }

        .title {
            padding-bottom: 30px;
            text-align: center;
            margin: auto;
            font-family: "JetBrains Mono", 'Bold';
            font-size: 30px;
        }
        .success-message{
            font-family: "JetBrains Mono", 'Bold';
            font-size: 20px;
            color : blue;
        }
        .fail-message{
            font-family: "JetBrains Mono", 'Bold';
            font-size: 20px;
            color: red;
        }
    </style>
</head>
<body>
<%@include file="../../commons/header.jsp" %>
<div class="container" style="margin-bottom: 50px;">
    <h2 class="title">Thêm phòng trọ</h2>
    <form:form style="margin: auto" action="${pageContext.request.contextPath}/room/insert.htm"
               modelAttribute="insertRoom" class="form">
        <label  class="success-message">${message}</label>
        <label  class="fail-message">${fmessage}</label>
        <div class="form-group">
            <div class="form-wrapper">
                <label>Mã phòng trọ</label>
                <form:input type="text" class="form-control" path="roomId" required="text"/>
            </div>
            <div class="form-wrapper">
                <label>Thuộc nhà trọ</label>
                <form:select path="homeId" class="form-control">
                    <c:forEach var="home" items="${listHome}">
                        <form:option value="${home.homeId}">${home.homeId}</form:option>
                    </c:forEach>
                </form:select>
            </div>
        </div>
        <div class="form-wrapper">
            <label>Tên phòng</label>
            <form:input type="text" class="form-control" path="name" required="text"/>
        </div>
        <div class="form-wrapper">
            <label>Giá phòng</label>
            <form:input type="number" class="form-control" path="price" required="number" min ="0"/>
        </div>
        <div class="form-wrapper">
            <label>Số lượng tối đa</label>
            <form:input type="number" class="form-control" path="max"  required="number" min ="0"/>
        </div>
        <div class="form-wrapper">
            <label>Trạng thái</label>
            <form:select path="status" class="form-control">
                <form:option value="0">Còn trống</form:option>
            </form:select>
        </div>
        <button>Thêm</button>
    </form:form>
</div>
<%@include file="../../commons/footer.jsp" %>
<%@include file="../../commons/tag/footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/login/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/main.js"></script>

</body>
</html>

