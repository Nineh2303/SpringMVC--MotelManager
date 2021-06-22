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
        .fail-message {
            font-family: "JetBrains Mono", 'Bold';
            font-size: 20px;
            color: red;
        }

        .button-big {
            width: 200px;
            margin: 25px;
        }
    </style>
</head>
<body>
<%@include file="../../commons/header.jsp" %>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">Thanh toán phiếu thuê</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div>
                    <h4>${tenant_message}</h4>
                    <h3 style="color :blue;">${insert_message}</h3>
                </div>
                <span class="fail-message">${message}</span>
                <a href="${pageContext.request.contextPath}/rent_detail/index.htm">
                    <button class="button-big">Quay lại</button>
                </a></th>
            </div>
        </div>
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
