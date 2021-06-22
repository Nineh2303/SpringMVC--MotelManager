<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login/css/style.css">

</head>
<body>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">Đăng nhập</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div class="login-wrap p-4 p-md-5">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa fa-user-o"></span>
                    </div>
                    <h4 class="text-center mb-4">Xin chào, hãy đăng nhập để tiếp tục</h4>
                    ${message}
                    <form:form method="post" class="login-form" action="login.htm" modelAttribute="loginRequest">
                        <div class="form-group">
                            <form:input type="text" class="form-control rounded-left" placeholder="Username" path="username"/>
                        </div>
                        <div class="form-group d-flex">
                            <form:input type="password" class="form-control rounded-left" placeholder="Password" path="password"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="form-control btn btn-primary rounded submit px-3" value="Login"/>
                        </div>
                        <div class="form-group d-md-flex">


                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="${pageContext.request.contextPath}/resources/login/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/main.js"></script>

</body>
</html>

