<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Charm:wght@700&display=swap');
    .title-button-group {
    padding : 25px;
    display: flex;
    margin-left: 600px;
}
.home-button {
    width: 160px;
    height: 30px;
}
.big-title {
    font-family: 'Charm', cursive;;
    font-size: 60px;
    color: black;

}
.small-title {
    font-family: 'Charm', cursive;;
    font-size: 30px;
    color: black;

}
.title-group{
    text-align: center;
    margin-top: -10px;
}

</style>
<header>
   <div style="margin-bottom: 40px;">
       <span style="margin-left: 600px;"> Xin chào, ${sessionScope.loginSession.displayName}</span><br/>
       <div class="title-button-group">
           <a href="#"> <button class="home-button">Thông tin</button></a>
           <a href="${pageContext.request.contextPath}/logout.htm"> <button class="home-button">Đăng xuất</button></a>
       </div>
       <div class="title-group">
           <span class="big-title"> Motel manager </span> <br/>
           <span class="small-title"> Quản lý nhà trọ </span>
       </div>
       <nav id="site-navigation" class="main-navigation">
           <div class="menu-menu-1-container">
               <ul id="menu-menu-1" class="menu">
                   <li><a href="${pageContext.request.contextPath}/home/index.htm">Home</a></li>
                   <li><a href="${pageContext.request.contextPath}/motel/index.htm">Thông tin nhà <trọ></trọ></a></li>
                   <li><a href="${pageContext.request.contextPath}/room/index.htm ">Thông tin phòng trọ</a></li>
                   <li><a href="${pageContext.request.contextPath}/tenant/index.htm">Người thuê trọ</a></li>
                   <li><a href="${pageContext.request.contextPath}/service/index.htm">Tiền dịch vụ</a></li>
                   <li><a href="${pageContext.request.contextPath}/bill/index.htm">Hóa đơn</a></li>
                   <li><a href="${pageContext.request.contextPath}/contract/index.htm">Hợp đồng</a></li>
               </ul>
           </div>
    </nav>
   </div>
</header>
