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

        .success-message {
            font-family: "JetBrains Mono", 'Bold';
            font-size: 20px;
            color: blue;
        }

        .fail-message {
            font-family: "JetBrains Mono", 'Bold';
            font-size: 20px;
            color: red;
        }

        .label-title {
            font-size: 20px;
        }
    </style>
</head>
<body>
<%@include file="../../commons/header.jsp" %>
<div class="container">

        <h2 class="title">Sửa thông tin phòng trọ</h2>

        <form method="post" class="form" action="${pageContext.request.contextPath}/motel/update/${home.homeId}.htm"
              modelAttribute="updateHome">
            <div class="form-wrapper">
                <label class="label-title">Mã nhà trọ</label>
                <input type="text" class="form-control" name="homeId" value="${home.homeId}" readonly/>
            </div>
            <div class="form-wrapper">
                <label class="label-title"> Tên chủ trọ </label>
                <input type="text" class="form-control" name="motelBossName" value="${home.motelBossName}" required/>
            </div>
            <div class="form-wrapper">
                <label class="label-title">Số điện thoại</label>
                <input type="text" class="form-control" name="numberPhone" value="${home.numberPhone}"
                       required="text" pattern="[0-9]{10}"
                       title="Số điện thoại chỉ gồm 10 chữ số, không chứa chữ cái và ký tự đặc biệt"
                />
            </div>
            <div class="form-wrapper">
                <label class="label-title">Địa chỉ</label>
                <input type="text" class="form-control" name="address" value="${home.address}" required/>
            </div>
            <button>Cập nhật</button>
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

