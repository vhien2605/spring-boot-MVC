<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#"
                                class="text-white">Ngõ 155,đường Cầu Giấy,phường Quan Hoa,Hà Nội</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#"
                                class="text-white">hvu6582@gmail.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                        <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/home" class="navbar-brand">
                        <h1 class="text-primary display-6">LaptopShop</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white justify-content-between mx-5" id="navbarCollapse">
                        <div class="navbar-nav">
                            <a href="/home" class="nav-item nav-link active">Trang chủ</a>
                            <a href="/shop" class="nav-item nav-link">Sản phẩm</a>
                        </div>
                        <c:if test="${not empty pageContext.request.userPrincipal.name}">
                            <div class=" d-flex m-3 me-0">
                                <a href="/cart" class="position-relative me-4 my-auto">
                                    <i class="fa fa-shopping-bag fa-2x"></i>
                                    <span
                                        class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                        style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${sessionScope.cartSum}</span>
                                </a>
                                <div class="dropdown my-auto">
                                    <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                        data-bs-toggle="dropdown" aria-expanded="false" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <i class="fas fa-user fa-2x"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end p-4" arialabelledby="dropdownMenuLink">
                                        <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                            <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                src="/image/avatar/${sessionScope.image}" />
                                            <div class="text-center my-3">
                                                ${sessionScope.name}
                                            </div>
                                        </li>
                                        <li><a class="dropdown-item" href="/account-setting">Quản lý tài khoản</a></li>
                                        <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li>
                                            <form action="/logout" method="POST">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button class="dropdown-item" href="/logout">Đăng xuất</button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${empty pageContext.request.userPrincipal.name}">
                            <a href="/login" class="position-relative me-4 my-auto">
                                Đăng nhập
                            </a>
                        </c:if>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->