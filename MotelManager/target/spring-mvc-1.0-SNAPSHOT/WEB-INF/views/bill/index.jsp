<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../../commons/tag/header.jsp" %>
    <meta charset="UTF-8">
    <style>
        .button-small{
            margin-top:0;
            height:30px;
            width:100px;
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
        <%@include file="../../commons/header.jsp" %>
        <h3 class="title">Hoá đơn </h3>
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <form class="woocommerce-ordering" action="${pageContext.request.contextPath}/bill/index.htm">

                    <div style="display: flex; margin-left:-100px;" class="form-group">
                        <div class="form-wrapper">
                            <label>Từ ngày :</label>
                            <input type="date" name="fromDate" class="form-control" style="width: 200px ; ">
                        </div>
                        <div class="form-wrapper">
                            <label>Đến ngày :</label>
                            <input type="date" name="toDate" class="form-control" style="width: 200px;">
                        </div>
                        <button style="margin-right: 10px;">Tìm kiếm</button>
                    </div>

                </form>
                <main id="main" class="site-main" role="main">
                    <table>
                        <tr>
                            <th>Mã Hoá đơn</th>
                            <th>Phòng</th>
                            <th> Ngày thu</th>
                            <th> Tổng tiền</th>
                            <th> Chi tiết</th>
                        </tr>
                        <c:forEach var="m" items="${bill}">
                            <tr>
                                <th> ${m.billId}</th>
                                <th> ${m.contract.roomId}</th>
                                <th>  <fmt:formatDate pattern="dd-MM-yyyy" value="${m.date}"/></th>
                                <th><fmt:formatNumber pattern="#,###,###,###" value="${m.money}"/> VNĐ</th>
                                <th><a href="${pageContext.request.contextPath}/bill/bill-detail/${m.billId}.htm">
                                    <button class="button-small"> Chi tiết</button>
                                </a></th>
                            </tr>
                        </c:forEach>
                    </table>
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
        <%@include file="../../commons/footer.jsp" %>
        <%@include file="../../commons/tag/footer.jsp" %>

    </div>
</div>
</body>
</html>
