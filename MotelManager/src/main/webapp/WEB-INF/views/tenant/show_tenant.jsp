<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../../commons/tag/header.jsp" %>
    <meta charset="UTF-8">
    <style>
        .description {
            font-family: "JetBrains Mono", 'Bold';
            font-size: 20px;
            color: black;
        }
        .button-big {
            width: 200px;
        }
        .button-group {
            display: flex;
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
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <main id="main" class="site-main" role="main">
                    <div id="container">
                        <div id="content" role="main">
                            <h3 class="title">Thông tin cá nhân</h3>
                            <div itemscope itemtype="http://schema.org/Product" class="product">
                                <div class="images">
                                    <a href="" itemprop="image" class="woocommerce-main-image zoom" title=""
                                       data-rel="prettyPhoto">
                                        <img src="${pageContext.request.contextPath}/resources/image/tenant.png"
                                             style="width : 75%;" alt=""></img></a>
                                </div>
                                <div class="summary entry-summary" style="margin-left: -100px;">
                                    <h1 itemprop="name" class="product_title entry-title">Thông tin cá nhân</h1>
                                    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                        <h3><span class="description">Họ và tên: ${tenant.name}</span></h3>
                                        <span class="description">Ngày sinh: ${tenant.birthDay}</span> <br/>
                                        <span class="description">Số điện thoại: ${tenant.numberPhone}</span><br/>
                                        <span class="description">Số chứng minh nhân dân : ${tenant.CMND}</span><br/>
                                        <span class="description">Địa chỉ : ${tenant.address}</span><br/>
                                        <span class="description"> Số phiếu thuê : ${count}</span> <br/>
                                    </div>
                                    <div class="button-group">
                                        <a href="${pageContext.request.contextPath}/tenant/update/${tenant.CMND}.htm">
                                            <button class="button-big">Chỉnh sửa thông tin</button>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/tenant/index.htm">
                                            <button class="button-big">Quay về trang chủ</button>
                                        </a>
                                    </div>
                                </div>
                                <!-- .summary -->

                                <div class="panel entry-content wc-tab" id="tab-reviews">
                                    <div id="reviews">
                                        <div id="comments">
                                            <!-- #comment-## -->

                                        </div>
                                    </div>
                                    <div class="clear">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
            </div>
        </div>
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
