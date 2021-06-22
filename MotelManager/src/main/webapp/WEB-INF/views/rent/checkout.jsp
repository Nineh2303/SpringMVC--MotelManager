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
        .warning{
            color : red ;
        }
        .form-control {
            width: 300px;
        }
        .title {
            padding-bottom: 30px;
            text-align: center;
            font-family: "JetBrains Mono", 'Bold';
            font-size:  25px;
        }
        .message {
            padding-bottom: 30px;
            font-size: 20px;
            text-align: center;
            margin: auto;
            font-family: "JetBrains Mono", 'Bold';
        }
        .form{
            margin: auto;
            padding: 45px;
        }
    </style>
</head>
<body>
<%@include file="../../commons/header.jsp" %>
    <div class="container">
               <span class="title">Thanh toán phiếu thuê</span>

                <h3 style="color :red;"> ${message}</h3>
                <span class="message">Thông tin trả phòng của phiếu thuê </span>
                <span> <h3>${rent.rentID}</h3></span>
                <form  class="form" method="post" action="${pageContext.request.contextPath}/rent_detail/check-out/rent-id=${rent.rentID}.htm">
                    <div class="form-wrapper">
                        Nhập ngày trả phòng
                        <input type="date" class="form-control" name="checkOutDate"
                               value="${dateString}"/>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="form-control btn btn-primary rounded submit px-3" value="Xác nhận"/>
                    </div>
                    <div class="form-group d-md-flex">
                    </div>
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
