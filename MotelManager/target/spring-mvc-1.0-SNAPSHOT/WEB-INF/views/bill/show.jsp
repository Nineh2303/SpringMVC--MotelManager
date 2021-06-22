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
        .button{
            height : 50px;
            width: 150px;
            margin-top: 15px;
            margin-bottom: 20px;
        }
        .header-6 {
            font-family: "JetBrains Mono";
            font-size: 20px;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<%@include file="../../commons/header.jsp" %>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h3>Chi tiết hoá đơn :${bill.billId}</h3>
                <h4> ${message}</h4>
            </div>

        </div>
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-7">
                <div class="form-wrapper">
                    <label class="label-title">Giá phòng </label>
                    <input type="text" class="form-control" value="<fmt:formatNumber pattern ="#,###,###,###" value = "${price}"/>" readonly/>
                </div>
                <c:forEach var="l" items="${list}">
                    <div class="row">
                        <div class="col-sm">
                            <h4>${l.service.name} (${l.service.countIndex})</h4>
                            <input type="number" class="form-control rounded-left" value="${l.count}" required/>
                        </div>
                        <div class="col-sm">
                            <h4>Đơn giá</h4>
                            <input type="text" class="form-control rounded-left" name="service_${l.service.serviceId}"
                                   value="<fmt:formatNumber pattern ="#,###,###,###" value = "${l.price}"/>" readonly/>
                        </div>
                        <div class="col-sm">
                            <h4>Tổng tiền</h4>
                            <input type="text" class="form-control rounded-left" name="service_${l.service.serviceId}"
                                   value="<fmt:formatNumber pattern ="#,###,###,###" value = "${l.total}"/>" readonly/>
                        </div>
                    </div>
                </c:forEach>
                <h6 class="header-6">Tổng tiền : <th> <fmt:formatNumber pattern ="#,###,###,###" value = "${bill.money}"/> VNĐ</th> </h6>
                <h6 class="header-6">
                    Trạng thái :
                    <c:choose>
                        <c:when test="${bill.status == 0}"> Chưa thanh toán </c:when>
                        <c:otherwise> Đã thanh toán </c:otherwise>
                    </c:choose>
                </h6>
                <a href="${pageContext.request.contextPath}/bill/payment/${bill.billId}.htm"><button class="button"> Thanh toán </button>
                </a>
                <a href="${pageContext.request.contextPath}/bill/index.htm"><button class="button"> Quay lại </button>
                </a>
            </div>
            <div class="form-group d-md-flex">
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
