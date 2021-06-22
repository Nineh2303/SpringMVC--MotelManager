<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Theem </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login/css/style.css">
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
            font-family: "JetBrains Mono", 'Bold';
        }

        .label-title {
            font-size: 20px;
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

<div class="container">
    <h3 class="title">Cập nhật dịch vụ </h3>

    <form method="post" class="form" action="${pageContext.request.contextPath}/service/update/${service.serviceId}.htm" modelAttribute="updateService">
        <label class="success-message">${message}</label>
        <label class="fail-message">${fmessage}</label>
        <div class="form-wrapper">
            <label class="label-title">Mã dịch vụ</label>
            <input type="text" class="form-control" name= "serviceId" value="${service.serviceId}" readonly>
        </div>
        <div class="form-wrapper">
            <label class="label-title">Tên dịch vụ</label>
            <input type="text" class="form-control"name= "name" value="${service.name}" readonlyname= "name" value="${service.name}" readonly/>
        </div>
        <div class="form-wrapper">
            <label class="label-title">Giá</label>
            <input type="text" class="form-control" path="price" name = "price" value="${service.price}"/>
        </div>
        <div class="form-wrapper">
            <label class="label-title">Đơn vị tinh</label>
            <input type="text" class="form-control" path="countIndex" name="countIndex" value="${service.countIndex}"/>
        </div>
        <button>Thêm</button>
    </form>

</div>
<%@include file="../../commons/footer.jsp" %>
<%@include file="../../commons/tag/footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/login/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/main.js"></script>

</body>
</html>
