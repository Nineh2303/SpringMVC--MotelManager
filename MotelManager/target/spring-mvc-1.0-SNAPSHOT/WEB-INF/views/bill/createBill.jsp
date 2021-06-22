<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
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
            font-size:  20px;
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
    <h3 class="title">Lập hoá đơn</h3>
</div>
</div>
<div class="row justify-content-center">
    <div class="col-md-7 col-lg-7">
        <form action="${pageContext.request.contextPath}/bill/create-bill/${roomId}.htm" class="form" method="post">
            <label  class="success-message">${message}</label>
            <label  class="fail-message">${fmessage}</label>
            <div class="form-wrapper">
                <label class="label-title" >Mã phòng trọ </label>
                <input type="text" class="form-control" value="${roomId}" readonly>
            </div>
            <div class="form-wrapper">
                <label  class="label-title" >Hoá đơn tháng</label>
                <input type="date" class="form-control" id="start" name="date" min="2018-12" value="2021-07" required>
            </div>
            <c:forEach var="service" items="${service}">
                <div class="form-group">
                    <div class="form-wrapper">
                        <label class="label-title"  >${service.name} (${service.countIndex})</label>
                        <input type="number" class="form-control" name="${service.serviceId}" required min="0"/>
                    </div>
                    <div class="form-wrapper">
                        <label class="label-title" >Đơn giá</label>
                        <input type="text" class="form-control"  name="service_${service.serviceId}"
                               value="<fmt:formatNumber pattern ="#,###,###,###" value = "${service.price}"/>" readonly >
                    </div>
                </div>
            </c:forEach>
            <button> Tạo hoá đơn </button>
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
