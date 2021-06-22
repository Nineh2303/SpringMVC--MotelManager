<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Thêm</title>
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
            width: 1000px;
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
<%@include file="../../commons/header.jsp" %>
<div class="container">

    <h3 class="title">Thêm người thuê trọ </h3>

    <form class="form" method="post" action="${pageContext.request.contextPath}/room/addTenant/${room.roomId}.htm">
        <label class="success-message">${message}</label>
        <label class="fail-message">${fmessage}</label>
        <div class="form-group">
            <div class="form-wrapper">
                <label>Mã phòng trọ</label>
                <input type="text" class="form-control text" name="roomId" value="${roomId}" readonly/>
            </div>
            <div class="form-wrapper">
                <label>Họ Và Tên</label>
                <input type="text" class="form-control text" name="name" required>
            </div>
        </div>
        <div class="form-group">
            <div class="form-wrapper">
                <label>Ngày sinh</label>
                <input type="date" class="form-control" name="birthDay" value="${dateString}" required />
            </div>
            <div class="form-wrapper">
                <label>CMND</label>
                <input type="text" class="form-control" name="CMND" value="${tenant.CMND}"
                       required maxlength="12" pattern="[0-9]{9,12}" title="*CMND là chuỗi gồm 9 -12 chữ số, không chứa chữ cái và ký tự đặc biệt ">
            </div>
        </div>
        <div class="form-group">
            <div class="form-wrapper">
                <label>Giới tính</label>
                <select name="gender" class="form-control">
                    <option value="Nam">Nam</option>
                    <option value="Nữ">Nữ</option>
                </select>
            </div>
            <div class="form-wrapper">
                <label>Số Điện thoại </label>
                <input type="text" class="form-control text" name="numberPhone" required pattern="[0-9]{10}"
                       title="Số điện thoại chỉ gồm 10 chữ số, không chứa chữ cái và ký tự đặc biệt"/>
            </div>
        </div>
        <div class="form-group">
            <div class="form-wrapper">
                <label>Địa chỉ</label>
                <input type="text" class="form-control text" name="address" required>
            </div>
            <div class="form-wrapper">
                <label>Ngày nhận phòng</label>
                <input type="date" class="form-control" name="checkIn"
                value="${dateString}" required />
            </div>
        </div>
        <div class="form-wrapper">
            <label>Tiền đặt cọc</label>
            <input type="text" class="form-control text"  name="price" value=" ${price}" readonly required/>
        </div>
        <button>Thêm</button>
    </form>
</div>
<%@include file="../../commons/footer.jsp" %>
<%@include file="../../commons/tag/footer.jsp" %>
</section>

<script src="${pageContext.request.contextPath}/resources/login/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/main.js"></script>

</body>
</html>
