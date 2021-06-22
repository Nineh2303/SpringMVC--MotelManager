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
        }
        .button-group{
            display: flex;
        }
        .title {
            padding-bottom: 30px;
            text-align: center;
            margin:  auto;
            font-family: "JetBrains Mono", 'Bold';
            font-size: 30px;
        }
        .success-message {
            font-family: "JetBrains Mono", 'Bold';
            font-size: 20px;
            color: blue;
        }

        .fail-message {
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
                   <h2 class="title"> Thông tin nhà trọ </h2>
                   <h3 class="success-message">${message}</h3>
                   <h3 class="fail-message">${fmessage}</h3>
                    <a href="${pageContext.request.contextPath}/motel/insert.htm"><button class="button-big">Thêm </button></a><br/>
                    <table>
                        <tr>
                            <th>Mã nhà trọ</th>
                            <th>Tên chủ trọ</th>
                            <th> Số điện thoại </th>
                            <th> Đơn địa chỉ</th>
                            <th></th>
                        </tr>
                        <c:forEach var="m" items="${home}">

                            <tr>
                                <th> ${m.homeId}</th>
                                <a href=""><th> ${m.motelBossName}</th></a>
                                <th> ${m.numberPhone}</th>
                                <th> ${m.address}</th>
                                <th>
                                  <div class="button-group">
                                      <a href="${pageContext.request.contextPath}/motel/update/${m.homeId}.htm"><button class="button-small">Sửa </button></a>
                                  </div></th>
                            </tr>

                        </c:forEach>
                    </table>


                    <nav class="woocommerce-pagination">

                    </nav>
        <%@include file="../../commons/footer.jsp" %>
        <%@include file="../../commons/tag/footer.jsp" %>

    </div>
</div>
</body>
</html>
