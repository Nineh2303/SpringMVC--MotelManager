<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Thêm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login/css/style.css">
    <%@include file="../../commons/tag/header.jsp"%>
    <style>
        .form {
            margin: auto;
            border: 2px solid green;
            padding: 45px;
            margin-bottom: 25px;
            width: 600px;
        }

        .title {
            padding-bottom: 30px;
            text-align: center;
            font-family: "JetBrains Mono", 'Bold';
        }
        .text{
            border-radius: 25px;
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
<%@include file="../../commons/header.jsp"%>
    <div class="container">
       <h3 class="title"> Cập nhật thông tin khách thuê trọ </h3>
        <form class="form" method="post" action="${pageContext.request.contextPath}/tenant/update/${tenant.CMND}.htm">
            <label  class="success-message">${message}</label>
            <label  class="fail-message">${fmessage}</label>
            <div class="form-wrapper">
                <label >Số CMND</label>
                <input type="text" class="form-control" name="CMND" value="${tenant.CMND}" readonly>
            </div>
            <div class="form-wrapper">
                <label >Họ và tên</label>
                <input type="text" class="form-control" maxlength="100" name="name" value ="${tenant.name}" required>
            </div>
            <div class="form-wrapper">
                <label >Ngày sinh</label>
                <input type="date" class="form-control" name="birthDay" value="${tenant.birthDay}" required>
            </div>
            <div class="form-wrapper">
                <label>Giới tinh </label>
                <select name="gender" value="${tenant.gender}" class="form-control" required>
                    <option value="${tenant.gender}" selected disabled hidden>${tenant.gender}</option>
                    <option value="Nam">Nam</option>
                    <option value="Nữ">Nữ</option>
                </select>
            </div>
            <div class="form-wrapper">
                <label>Số điện thoại</label>
                <input type="text" class="form-control" name="numberPhone" value ="${tenant.numberPhone}" required pattern="[0-9]{10}"
                       title="Số điện thoại chỉ gồm 10 chữ số, không chứa chữ cái và ký tự đặc biệt">
            </div>
            <div class="form-wrapper">
                <label>Địa chỉ</label>
                <input type="text" class="form-control" name="address" value="${tenant.address}" required>
            </div>
            <button>Cập nhật</button>
        </form>
    </div>
    <%@include file="../../commons/footer.jsp"%>
    <%@include file="../../commons/tag/footer.jsp"%>
</section>

<script src="${pageContext.request.contextPath}/resources/login/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/main.js"></script>

</body>
</html>

<form  method="post" action="${pageContext.request.contextPath}/tenant/update/${tenant.CMND}.htm">
    <div class="form-group">
        CMND
        <input type="text" class="form-control rounded-left" name="CMND" value="${tenant.CMND}" readonly/>
    </div>
    <div class="form-group">
        Họ tên
        <input type="text" class="form-control rounded-left" maxlength="100" name="name" value ="${tenant.name}"/>
    </div>
    <div class="form-group">
        Ngày sinh

        <input type="date" class="form-control rounded-left" name="birthDay" value="${tenant.birthDay}"/>
    </div>
    Giới tính
    <div class="form-group">
        <select name="gender" value="${tenant.gender}">
            <option value="Nam">Nam</option>
            <option value="Nữ">Nữ</option>
        </select>
    </div>

    <div class="form-group">
        SDT
        <input type="text" class="form-control rounded-left" name="numberPhone" value="${tenant.numberPhone}"/>
    </div>
    <div class="form-group">
        Địa chỉ
        <input type="text" class="form-control rounded-left" name="address" value="${tenant.address}"/>
    </div>
    <!--<div class="form-group">
    <label>Hình ảnh</label>
    <input type="file" placeholder="..." name="photo"/>
    </div> -->
    <div class="form-group">
        <input type="submit" class="form-control btn btn-primary rounded submit px-3" value="Thêm"/>
    </div>
    <div class="form-group d-md-flex">
    </div>
</form>