<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <%@include file="../../commons/tag/header.jsp"%>
    <meta charset="UTF-8">
    <style>
        .button-small {
            margin-top:0; height:30px; width:100px;
        }
        .button-big {
            width: 200px;
        }
        .title {
            padding-bottom: 30px;
            text-align: center;
            margin:  auto;
            font-family: "JetBrains Mono", 'Bold';
            font-size: 30px;
        }
    </style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <%@include file="../../commons/header.jsp"%>
        <h3 class="title">Hợp đồng thuê trọ </h3>
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <main id="main" class="site-main" role="main">
                    <table>
                        <tr>
                            <th>Mã hợp đồng</th>
                            <th>Mã phòng</th>
                            <th>Tiền đặt cọc</th>
                            <th>Các hợp đồng cá nhân</th>
                        </tr>
                        <c:forEach var= "m" items="${contract}">
                            <tr>
                                <th> ${m.contractId}</th>
                                <th> ${m.room.roomId}</th>
                                <th> ${m.depositMoney}</th>
                                <th><a href="${pageContext.request.contextPath}/contract/contractId=${m.contractId}.htm"> <button class="button-small">Xem thêm</button></a></th>
                            </tr>
                        </c:forEach>
                    </table>
                   <div style="display:flex;">
                       <a href="${pageContext.request.contextPath}/contract/all.htm" > <button class="button-big">Xem toàn bộ hợp đồng</button></a>
                       <a href="${pageContext.request.contextPath}/rent_detail/index.htm"> <button class="button-big">Xem toàn bộ phiếu thuê</button></a>
                   </div>
                    <nav class="woocommerce-pagination">
                        <!-- <ul class="page-numbers">
                            <li><span class="page-numbers current">1</span></li>
                            <li><a class="page-numbers" href="#">2</a></li>
                            <li><a class="next page-numbers" href="#">→</a></li>
                        </ul> -->

                    </nav>
                </main>
                <!-- #main -->
            </div>
            <!-- #primary -->
        </div>
        <%@include file="../../commons/footer.jsp"%>
        <%@include file="../../commons/tag/footer.jsp"%>

    </div>
</div>
</body>
</html>
