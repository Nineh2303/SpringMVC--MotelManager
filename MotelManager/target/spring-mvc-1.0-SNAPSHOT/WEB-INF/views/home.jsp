<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <%@include file="../commons/tag/header.jsp" %>
    <meta charset="UTF-8">
    <style>
        .name  {
            margin-left:40px;
        }
    </style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <%@include file="../commons/header.jsp" %>
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <main id="main" class="site-main">
                    <div class="grid portfoliogrid">

                        <article class="hentry">
                            <header class="entry-header">
                                <div class="entry-thumbnail">
                                    <a href="${pageContext.request.contextPath}/home/index.htm "><img
                                            src="${pageContext.request.contextPath}/resources/image/room.png"
                                            style="width : 50%;"
                                            class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                            alt="p1"/></a>
                                </div>
                                <h2 class="entry-title"><a href="${pageContext.request.contextPath}/home/index.htm"
                                                           rel="bookmark"><span class="name">&nbsp;Nhà trọ</span>
                                    </a></h2>
                            </header>
                        </article>

                        <article class="hentry">
                            <header class="entry-header">
                                <div class="entry-thumbnail">
                                    <a href="${pageContext.request.contextPath}/room/index.htm "><img
                                            src="${pageContext.request.contextPath}/resources/image/room.png"
                                            style="width : 50%;"
                                            class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                            alt="p1"/></a>
                                </div>
                                <h2 class="entry-title"><a href="${pageContext.request.contextPath}/room/index.htm"
                                                           rel="bookmark">Thông Tin Phòng
                                    Trọ</a></h2>
                            </header>
                        </article>
                        <article class="hentry">
                            <header class="entry-header">
                                <div class="entry-thumbnail">
                                    <a href="${pageContext.request.contextPath}/tenant/index.htm "><img
                                            src="${pageContext.request.contextPath}/resources/image/room.png"
                                            style="width : 50%;"
                                            class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                            alt="p1"/></a>
                                </div>
                                <h2 class="entry-title"><a href="${pageContext.request.contextPath}/tenant/index.htm"
                                                           rel="bookmark">Quản lí người
                                    thuê trọ</a></h2>
                            </header>
                        </article>

                        <article class="hentry">
                            <header class="entry-header">
                                <div class="entry-thumbnail">
                                    <a href="${pageContext.request.contextPath}/service/index.htm"><img
                                            src="${pageContext.request.contextPath}/resources/image/room.png"
                                            style="width : 50%;"
                                            class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                            alt="p1"/></a>
                                </div>
                                <h2 class="entry-title"><a href="${pageContext.request.contextPath}/service/index.htm"
                                                           rel="bookmark">Giá Tiền Dịch
                                    Vụ</a></h2>
                            </header>
                        </article>

                        <article class="hentry">
                            <header class="entry-header">
                                <div class="entry-thumbnail">
                                    <a href="${pageContext.request.contextPath}/contract/index.htm"><img
                                            src="${pageContext.request.contextPath}/resources/image/room.png"
                                            style="width : 50%;"
                                            class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                            alt="p1"/></a>
                                </div>
                                <h2 class="entry-title"><a href="${pageContext.request.contextPath}/contract/index.htm"
                                                           rel="bookmark">Giấy Tờ- Hợp
                                    Đồng</a></h2>
                            </header>
                        </article>

                        <article class="hentry">
                            <header class="entry-header">
                                <div class="entry-thumbnail">
                                    <a href="${pageContext.request.contextPath}/bill/index.htm"><img
                                            src="${pageContext.request.contextPath}/resources/image/room.png"
                                            style="width : 50%;"
                                            class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                            alt="p1"/></a>
                                </div>
                                <h2 class="entry-title"><a href="${pageContext.request.contextPath}/bill/index.htm"
                                                           rel="bookmark">Hóa Đơn
                                    Tháng</a></h2>
                            </header>
                        </article>

                    </div>

                </main>
                <!-- #main -->
            </div>
            <!-- #primary -->
        </div>
    </div>
</div>

<%@include file="../commons/footer.jsp" %>


<script src='${pageContext.request.contextPath}/resources/js/jquery.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/plugins.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/scripts.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/masonry.pkgd.min.js'></script>
</body>
</html>
