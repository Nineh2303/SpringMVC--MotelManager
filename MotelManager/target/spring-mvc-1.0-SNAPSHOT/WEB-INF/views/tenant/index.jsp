<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../../commons/tag/header.jsp" %>
    <meta charset="UTF-8">
    <style>
        .button-big {
            width: 200px;
            margin: 25px;
        }

        .title {
            padding-bottom: 30px;
            text-align: center;
            margin: auto;
            font-family: "JetBrains Mono", 'Bold';
            font-size: 30px;
        }
        .button-small {
            margin-top:0; height:30px; width:100px;
        }
    </style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <%@include file="../../commons/header.jsp" %>

                    <h3 class="title"> Người thuê trọ </h3>

                    <a href="${pageContext.request.contextPath}/tenant/all.htm">
                        <button class="button-big">Xem tất cả</button>
                    </a>
                    <div style="margin-top: 25px;">
                        <ul class="products">
                            <c:forEach var="t" items="${tenant}">
                                <li class="product">
                                    <a href="${pageContext.request.contextPath}/tenant/show_tenant/${t.CMND}.htm">
                                        <img src='${pageContext.request.contextPath}/resources/image/tenant.png' alt="">
                                        <h3> ${t.name}</h3>
                                        <span class="price"><span class="amount">SĐT :${t.numberPhone}</span></span>
                                    </a><a href="${pageContext.request.contextPath}/tenant/show_tenant/${t.CMND}.htm">
                                    <button class="button-small">Chi tiết</button>
                                </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
    </div>
    <%@include file="../../commons/footer.jsp" %>
</div>


<script src='${pageContext.request.contextPath}/resources/js/jquery.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/plugins.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/scripts.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/masonry.pkgd.min.js'></script>
</body>
</html>
