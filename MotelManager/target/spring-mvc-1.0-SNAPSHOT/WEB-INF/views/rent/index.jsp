<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../../commons/tag/header.jsp" %>
    <meta charset="UTF-8">
    <style>
        .button-small {
            margin-top:0; height:30px; width:100px;
            padding: -10px;
        }
        .button-group{
            display: flex;
        }
        .form   {
            margin-left: 650px;
        }
        .select-box {
            width: 120px;
            height: 30px;
        }
        .button-search {
            margin-top: -10px;
        }
    </style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <%@include file="../../commons/header.jsp" %>
        <form class="form" method="get">
            <span>Tìm kiếm theo trạng thái :</span>
            <br/>
            <div style="display: flex; margin-top: 8px;">
                <select name="status" class="select-box">
                    <option value="-1" selected="selected">Tất cả</option>
                    <option value="0"> Đã hết hạn </option>
                    <option value="1"> Đang thuê</option>
                </select>
                <button class="button-search"> Tìm kiếm</button>
            </div>
        </form>
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <main id="main" class="site-main" role="main">
                    <table>
                        <tr>
                            <th>Mã phiếu thuê</th>
                            <th>Tên người thuê</th>
                            <th>Thuộc phòng</th>
                            <th></th>
                        </tr>
                        <c:forEach var="m" items="${rent}">
                            <tr>
                                <th>${m.rentID}</th>
                                <th><a href="${pageContext.request.contextPath}/tenant/show_tenant/${m.tenant.CMND}.htm">
                                        ${m.tenant.name}
                                </th>
                                <th>${m.contract.roomId}</th>
                                <th><div class="button-group">
                                    <a href="${pageContext.request.contextPath}/rent_detail/show/rent-id=${m.rentID}.htm"><button class="button-small">Chi tiết</button></a>
                                    <c:choose>
                                        <c:when test="${m.checkOutDate == null}">
                                        <a href="${pageContext.request.contextPath}/rent_detail/check-out/rent-id=${m.rentID}.htm"><button class="button-small">Trả phòng</button></a>
                                        </c:when>
                                        <c:otherwise> Đã hết hạn</c:otherwise>
                                    </c:choose>
                                </div>
                                </th>
                                </div>
                            </tr>
                        </c:forEach>
                    </table>
                    <nav class="woocommerce-pagination">
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
