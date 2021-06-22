<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../../commons/tag/header.jsp" %>
    <meta charset="UTF-8">
    <style>
        .title {
            padding-bottom: 30px;
            text-align: center;
            margin: auto;
            font-family: "JetBrains Mono", 'Bold';
            font-size: 30px;
        }

        .button-small {
            margin-top: 0;
            height: 30px;
            width: 100px;
        }

        .form {
            margin-top: -90px;
            float: right;
        }

        .button-search {
            margin-top: 0;
        }

        .show {
            margin-top: 25px;
        }

        .select-box {
            width: 100px;
        }
        .price {
            font-size:  15px;
        }
    </style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <%@include file="../../commons/header.jsp" %>

        <h2 style="color:red ; ">${delete_message}</h2>
        <h2 style="color:deepskyblue ; ">${update_message}</h2>
        <h2 style="color:deepskyblue ; ">${message}</h2>

        ${delete_message}
        <h3 class="title">Danh sách phòng trọ</h3>
        <div>
            <a href="${pageContext.request.contextPath}/room/insert.htm">
                <button class="button-add">Thêm phòng trọ</button>
            </a>
            <form class="form" method="get">
                <span>Tìm kiếm theo nhà trọ :</span>
                <br/>
                <div style="display: flex; margin-top: 8px;">
                    <select name="homeId" class="select-box">
                        <option value="null" selected="selected">Tất cả</option>
                        <c:forEach var="h" items="${home}">
                            <option value="${h.homeId}"> ${h.homeId}</option>
                        </c:forEach>
                    </select>
                    <button class="button-search"> Tìm kiếm</button>
                </div>
            </form>
        </div>

        <div class="show">
            <ul class="products">
                <c:forEach var="r" items="${room}">
                    <li class="product" style="width: 270px;">
                        <a href="${pageContext.request.contextPath}/room/showroom/${r.roomId}.htm">
                            <img src='${pageContext.request.contextPath}/resources/image/room.png' alt="">
                            <h3>${r.name}</h3>
                            <span class="price">Địa chỉ :${r.home.homeId}</span>
                            <span class="price">Trạng thái:
                                <c:choose>
                                    <c:when test="${r.status==0}"> Còn trống </c:when>
                                    <c:when test="${r.status==-1}"> Đang sửa chữa </c:when>
                                    <c:otherwise> Đã có người thuê</c:otherwise>
                                </c:choose></span>
                        </a><a href="${pageContext.request.contextPath}/room/showroom/${r.roomId}.htm">
                        <button class="button-small">Chi tiết</button>
                    </a>
                    </li>
                </c:forEach>
            </ul>
            <!-- #primary -->
        </div>
        <%@include file="../../commons/footer.jsp" %>
        <%@include file="../../commons/tag/footer.jsp" %>
    </div>
</div>
</body>
</html>
