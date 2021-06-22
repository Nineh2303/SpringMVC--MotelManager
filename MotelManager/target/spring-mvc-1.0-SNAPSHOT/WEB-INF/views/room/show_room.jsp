<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<html>
<head>
    <title>Title</title>
    <%@include file="../../commons/tag/header.jsp" %>
    <meta charset="UTF-8">
    <style>
        .description {
            font-family: "JetBrains Mono", 'Bold';
            font-size:  20px;
            color: black;
        }
        .title {
            padding-bottom: 30px;
            text-align: center;
            font-family: "JetBrains Mono", 'Bold';
        }
    </style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <%@include file="../../commons/header.jsp" %>
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <div id="content" role="main">
                    <h3 >${full_message}</h3>
                    <h4>${message}</h4>
                    <h2>${delete_message}</h2>
                    <h2 >${update_message}</h2>
                    <div itemscope itemtype="http://schema.org/Product" class="product">
                        <div class="images">
                            <a href="" itemprop="image" class="woocommerce-main-image zoom" title=""
                               data-rel="prettyPhoto">
                                <img src="${pageContext.request.contextPath}/resources/image/room.png"
                                     alt=""/></a>
                        </div>
                        <div class="summary entry-summary">
                            <h1 itemprop="name" class="title">Phòng trọ ${room.name}</h1>
                            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                <p class="price">
                                    <span class="description">Số lượng tối đa :${room.max}</span> <br/>
                                    <span class="description">Số người đang ở :${currentQuantity}</span> <br/>
                                    <span class="description">Giá phòng :<fmt:formatNumber pattern="#,###,###,###" value="${room.price}"/></span>
                                    <br/><span class="description">
                                    Trạng thái:
                                     <c:choose>
                                         <c:when test="${room.status==0}"> Còn trống </c:when>
                                         <c:when test="${room.status==-1}"> Đang sửa chữa </c:when>
                                         <c:otherwise> Đã có người thuê</c:otherwise>
                                     </c:choose>
                                </span>
                                </p>
                            </div>
                            <div style="display: flex;">
                                <a href="${pageContext.request.contextPath}/room/addTenant/${room.roomId}.htm">
                                    <button style="width: 200px;">Thêm người thuê</button>
                                </a>
                                <a href="${pageContext.request.contextPath}/room/update/${room.roomId}.htm">
                                    <button style="width: 200px;">Sửa thông tin phòng</button>
                                </a>
                            </div>
                            <div style="display: flex;">
                                <a href="${pageContext.request.contextPath}/bill/create-bill/${room.roomId}.htm">
                                    <button style="width: 200px;">Tạo hoá đơn</button>
                                </a>
                            </div>
                        </div>

                        <table>
                            <tr>
                                <th>Tên người thuê</th>
                                <th>Số CMND</th>
                                <th>Ngày vào phòng</th>
                                <th></th>
                            </tr>
                            <c:forEach var="m" items="${list}">

                                <tr>
                                    <th>
                                        <a href="${pageContext.request.contextPath}/tenant/show_tenant/${m.tenant.CMND}.htm">${m.tenant.name} </a>
                                    </th>
                                    <th>
                                        <a href="${pageContext.request.contextPath}/tenant/show_tenant/${m.tenant.CMND}.htm">${m.tenant.CMND} </a>
                                    </th>
                                    <th>${m.checkInDate}</th>
                                </tr>
                            </c:forEach>
                        </table>

                        <!-- .summary -->
                        <div class="woocommerce-tabs wc-tabs-wrapper">
                            <div class="panel entry-content wc-tab" id="tab-description">
                                <h2>Thông tin</h2>
                                <p>
                                    Phòng trọ 1 : mát mẻ, thuận hướng gió, ít nắng
                                </p>
                            </div>
                            <div class="panel entry-content wc-tab" id="tab-reviews">
                                <div id="reviews">
                                    <div id="comments">
                                        <!-- #comment-## -->
                                        </ol>
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
        <!-- #primary -->
    </div>
    <%@include file="../../commons/footer.jsp" %>
    <%@include file="../../commons/tag/footer.jsp" %>

</div>
</div>
</body>
</html>
