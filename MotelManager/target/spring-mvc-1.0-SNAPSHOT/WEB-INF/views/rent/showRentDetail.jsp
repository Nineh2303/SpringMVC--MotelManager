<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../../commons/tag/header.jsp" %>
    <meta charset="UTF-8">
    <style>
        .amount {
            font-family: "JetBrains Mono", 'Bold';
            font-size: 20px;
            color: black;
        }

        .message {
            font-family: "JetBrains Mono", 'Bold';
            font-size: 25px;
            color: red;
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

        .title {
            padding-bottom: 30px;
            text-align: center;
            margin: auto;
            font-family: "JetBrains Mono", 'Bold';
            font-size: 30px;
        }

        .info-group {
            margin-left: 50px;
        }
    </style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <%@include file="../../commons/header.jsp" %>
        <h2 class="title"> Chi tiết phiếu thuê </h2>
        <label class="success-message">${message}</label>
        <label class="fail-message">${fmessage}</label>

        <div class="info-group">
            <span class="amount"><h3>Mã phiếu thuê : ${rent.rentID}</h3> </span>
            <span class="amount">Người thuê : ${rent.tenant.name}</span> <br/>
            <span class="amount">Số Chứng Minh Nhân Dân :${rent.tenant.CMND}</span> <br/>
            <span class="amount"> Ngày thuê phòng :  <fmt:formatDate pattern="dd-MM-yyyy" value="${rent.checkInDate}"/></span><br/>
            <span class="amount"> Ngày trả phòng : <c:choose>
                        <c:when test="${rent.checkOutDate == null}"> Đang thuê</c:when>
                        <c:otherwise>
                            <fmt:formatDate pattern="dd-MM-yyyy" value="${rent.checkOutDate}"/>
                        </c:otherwise>
            </c:choose>
            </span><br/>
        </div>
        <span class="message">
                                <c:if test="${rent.checkOutDate != null}">
                                    PHIẾU THUÊ ĐÃ HẾT HẠN
                                </c:if>
                            </span>
        <a href="${pageContext.request.contextPath}/rent_detail/index.htm"><button>Quay lại </button></a>

        <%@include file="../../commons/footer.jsp" %>
        <%@include file="../../commons/tag/footer.jsp" %>

    </div>
</div>
</body>
</html>
