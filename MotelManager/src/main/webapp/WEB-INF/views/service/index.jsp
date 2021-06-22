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
        }
        .button-big {
            width: 200px;
            margin:  25px;
        }
        .button-group{
            display: flex;
        }
        .title {
            padding-bottom: 30px;
            text-align: center;
            margin: auto;
            font-family: "JetBrains Mono", 'Bold';
            font-size: 30px;
        }
        .success-message{
            font-family: "JetBrains Mono", 'Bold';
            font-size: 20px;
            color : blue;
        }
        .fail-message{
            font-family: "JetBrains Mono", 'Bold';
            font-size: 20px;
            color: red;
        }
    </style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <%@include file="../../commons/header.jsp" %>
        <label  class="success-message">${message}</label>
        <label  class="fail-message">${fmessage}</label>
        <h2 class="title">Danh sách dịch vụ</h2>
                    <a href="${pageContext.request.contextPath}/service/insert.htm"> <button class="button-big">Thêm</button></a>
                    <table>
                        <tr>
                            <th>Mã dịch vụ</th>
                            <th>Tên</th>
                            <th> Đơn giá</th>
                            <th> Đơn vị tính</th>
                            <th> Trạng thái</th>
                            <th></th>
                        </tr>
                        <c:forEach var="m" items="${service}">

                            <tr>
                                <th> ${m.serviceId}</th>
                                <a href=""><th> ${m.name}</th></a>
                                <th> ${m.price}</th>
                                <th> ${m.countIndex}</th>
                                <th>
                                    <c:choose>
                                        <c:when test="${m.status ==1}"> Đang sử dụng</c:when>
                                        <c:otherwise> Không sử dụng</c:otherwise>
                                    </c:choose>
                                </th>
                                <th style="display: flex;">
                                    <div class="button-group">
                                        <a href="${pageContext.request.contextPath}/service/update/${m.serviceId}.htm"><button class="button-small"> Sửa </button></a>
                                        <c:choose>
                                            <c:when test="${m.status ==1}">
                                            <a href="${pageContext.request.contextPath}/service/changeStatus/${m.serviceId}.htm"><button class="button-small">Tắt</button></a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/service/changeStatus/${m.serviceId}.htm"><button class="button-small">Kích hoạt</button></a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </th>
                            </tr>

                        </c:forEach>
                    </table>



        <%@include file="../../commons/footer.jsp" %>
        <%@include file="../../commons/tag/footer.jsp" %>

    </div>
</div>
</body>
</html>
