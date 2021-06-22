<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <%@include file="../../commons/tag/header.jsp"%>
    <meta charset="UTF-8">
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
            <%@include file="../../commons/header.jsp" %>
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <main id="main" class="site-main" role="main">
                    <p class="woocommerce-result-count">
                       <h3> Người thuê trọ </h3>
                    </p>

                    <form class="woocommerce-ordering" action="${pageContext.request.contextPath}/tenant/all.htm">
                        Trạng thái :
                        <select name="status" class="orderby">
                            <option value="${status}" selected="selected">
                                <c:choose>
                                    <c:when test="${status==0}">Đã trả phòng</c:when>
                                    <c:when test="${status==1}">Đang thuê</c:when>
                                    <c:otherwise>Tất cả</c:otherwise>
                                </c:choose>
                            </option>
                            <option value="-1">Tất cả </option>
                            <option value="1">Đang thuê</option>
                            <option value="0">Đã trả phòng</option>
                        </select>
                        <button> Lọc </button>
                    </form>
                    <ul class="products">
                        <c:forEach var ="t" items="${tenant}">
                        <li class="product">
                            <a href="${pageContext.request.contextPath}/tenant/show_tenant/${t.CMND}.htm">
                                <img src='${pageContext.request.contextPath}/resources/image/tenant.png' alt="">
                                <h3> ${t.name}</h3>
                                <span class="price"><span class="amount">SĐT :${t.numberPhone}</span></span>
                                <span class="price"><span class="amount">
                                    <c:choose>
                                        <c:when test="${t.status==1}">
                                            Đang thuê
                                        </c:when>
                                        <c:otherwise>
                                            Đã trả phòng
                                        </c:otherwise>
                                    </c:choose>
                                </span></span>
                            </a><a href="${pageContext.request.contextPath}/tenant/show_tenant/${t.CMND}.htm" class="button">Chi tiết</a>
                        </li>
                        </c:forEach>
                    </ul>
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
