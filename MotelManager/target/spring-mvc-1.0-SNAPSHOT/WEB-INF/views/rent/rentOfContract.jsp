<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../../commons/tag/header.jsp" %>
    <meta charset="UTF-8">
    <style>
        .button-small {
            margin-top: 0;
            height: 30px;
            width: 100px;
            padding: -10px;
        }

        .button-group {
            display: flex;
        }

    </style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <%@include file="../../commons/header.jsp" %>
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <main id="main" class="site-main" role="main">
                    <table>
                        <tr>
                            <th>Mã phiếu thuê</th>
                            <th>Số CMND</th>
                            <th>Tên khách trọ</th>>
                            <th></th>
                        </tr>
                        <c:forEach var="m" items="${rent}">
                            <tr>
                                <th>${m.rentID}</th>
                                <th>
                                    <a href="${pageContext.request.contextPath}/tenant/show_tenant/${m.tenant.CMND}.htm">
                                            ${m.tenant.CMND}
                                </th>
                                <th>
                                    <a href="${pageContext.request.contextPath}/tenant/show_tenant/${m.tenant.CMND}.htm">
                                            ${m.tenant.name}
                                </th>
                                <th>
                                    <div class="button-group"><a
                                            href="${pageContext.request.contextPath}/rent_detail/show/rent-id=${m.rentID}.htm">
                                        <button class="button-small">Chi tiết</button>
                                    </a>
                                        <a href="${pageContext.request.contextPath}/rent_detail/check-out/rent-id=${m.rentID}.htm">
                                            <button class="button-small">Trả phòng</button>
                                        </a></div>
                                </th>
                            </tr>
                        </c:forEach>
                    </table>
                    <nav class="woocommerce-pagination">
                    </nav>
                </main>

            </div>
        </div>
        <%@include file="../../commons/footer.jsp" %>
        <%@include file="../../commons/tag/footer.jsp" %>

    </div>
</div>
</body>
</html>
