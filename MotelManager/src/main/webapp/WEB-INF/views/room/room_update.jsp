<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login/css/style.css">
    <%@include file="../../commons/tag/header.jsp" %>
    <style>
        .form {
            margin: auto;
            border: 2px solid green;
            padding: 45px;
            margin-bottom: 25px;
        }

        .title {
            padding-bottom: 30px;
            text-align: center;
            font-family: "JetBrains Mono", 'Bold';
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

        .label-title {
            font-size: 20px;
        }
    </style>
</head>
<body>
<%@include file="../../commons/header.jsp" %>
<section class="ftco-section">
    <div class="container">
        ${message}
        <h2 class="title">Sửa thông tin phòng trọ </h2>
        <form:form class ="form" action="${pageContext.request.contextPath}/room/update/${room.roomId}.htm"
                   modelAttribute="updateRoom" >
            <h4>${message}</h4>
            <div class="form-group">
                <div class="form-wrapper">
                    <label>Mã phòng trọ</label>
                    <input type="text" class="form-control" name="roomId" value="${room.roomId}" readonly/>
                </div>
                <div class="form-wrapper">
                    <label>Thuộc nhà trọ</label>
                    <input type="text" class="form-control" name="homeId" value="${room.home.homeId}"
                           readonly/>
                </div>
            </div>
            <div class="form-wrapper">
                <label>Tên phòng</label>
                <input type="text" class="form-control" name="name" value="${room.name}"/>
            </div>
            <div class="form-wrapper">
                <label>Giá phòng</label>
                <input type="text" class="form-control" name="price" value="${room.price}"/>
            </div>
            <div class="form-wrapper">
                <label>Số lượng tối đa</label>
                <input type="text" class="form-control" name="max" value="${room.max}"/>
            </div>
            <div class="form-wrapper">
                Trạng thái
                <select name="status" class="form-control">
                    <option value="${room.status}" selected="selected">
                        <c:choose>
                            <c:when test="${room.status==0}"> Còn trống </c:when>
                            <c:when test="${room.status==-1}"> Đang sửa chữa </c:when>
                            <c:otherwise> Đã có người thuê</c:otherwise>
                        </c:choose>
                    </option>
                    <option value="1">Đã có người thuê</option>
                    <option value="0">Còn trống</option>
                    <option value="-1">Đang sửa chữa</option>
                </select>
            </div>
            <button>Cập nhật </button>
        </form:form>

    </div>
    <%@include file="../../commons/footer.jsp" %>
    <%@include file="../../commons/tag/footer.jsp" %>
</section>

<script src="${pageContext.request.contextPath}/resources/login/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/main.js"></script>

</body>
</html>

