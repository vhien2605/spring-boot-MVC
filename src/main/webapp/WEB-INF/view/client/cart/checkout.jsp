<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Fruitables - Vegetable Website Template</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <!-- Navbar start -->
                    <jsp:include page="../layout/header.jsp" />
                    <!-- Navbar End -->


                    <!-- Single Page Header start -->
                    <div class="container-fluid page-header py-5">
                        <h1 class="text-center text-white display-6">Cart</h1>
                        <ol class="breadcrumb justify-content-center mb-0">
                            <li class="breadcrumb-item"><a href="/home">Home</a></li>
                            <li class="breadcrumb-item"><a href="/page">Pages</a></li>
                            <li class="breadcrumb-item active text-white">Cart</li>
                        </ol>
                    </div>
                    <!-- Single Page Header End -->


                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Products</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Handle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${cartDetails}" var="cartDetail">
                                            <tr>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <a href="/product/${cartDetail.getProduct().getId()}"><img
                                                                src="/image/product/${cartDetail.getProduct().getImage()}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt=""></a>
                                                    </div>
                                                </th>
                                                <td>
                                                    <p class="mb-0 mt-4">${cartDetail.getProduct().getName()}</p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number"
                                                            value=" ${cartDetail.getProduct().getPrice()}" />
                                                        VNĐ
                                                    </p>
                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                                        <input type="text" class="form-control form-control-sm border-0"
                                                            value="${cartDetail.getQuantity()}" ?>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                            value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <form action="/delete-from-cart/${cartDetail.getId()}"
                                                        method="POST">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button type="submit"
                                                            class="btn btn-md rounded-circle bg-light border mt-4">
                                                            <i class="fa fa-times text-danger"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <form:form action="/place-order" method="POST" modelAttribute="receiverUser">
                                <div class="mt-5 row g-4 justify-content-between">
                                    <!-- Khối mới ở bên trái -->
                                    <div class="col-12 col-md-5">
                                        <div class="bg-light rounded p-4">
                                            <h1 class="display-6 mb-4">Thông tin người nhận</h1>
                                            <div class="mb-3">
                                                <label for="name">Tên người nhận</label>
                                                <input name="name" id="name" class="form-control" required="true" />
                                                <label for="address">Địa chỉ</label>
                                                <input name="address" id="address" class="form-control"
                                                    required="true" />
                                                <label for="phone">Số điện thoại</label>
                                                <input name="phone" id="phone" class="form-control" required="true" />
                                            </div>
                                            <a href="/cart" class="btn btn-primary">Quay lại giỏ hàng</a>
                                        </div>
                                    </div>
                                    <!-- Khối đã có ở bên phải -->
                                    <div class="col-12 col-md-7">
                                        <div class="bg-light rounded">
                                            <div class="p-4">
                                                <h1 class="display-6 mb-4">Thông tin đơn hàng</h1>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="mb-0 me-4">Giá trị đơn hàng:</h5>
                                                    <p class="mb-0">
                                                        <fmt:formatNumber type="number" value="${totalCartPrice}" /> đ
                                                    </p>
                                                </div>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="mb-0 me-4">Phí vận chuyển: 5%</h5>
                                                    <div class="">
                                                        <p class="mb-0">
                                                            <fmt:formatNumber type="number"
                                                                value="${totalCartPrice*5/100}" />
                                                            VNĐ
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <h5 class="mb-0 me-4">Hình thức thanh toán : </h5>
                                                    <div class="">
                                                        <p class="mb-0">
                                                            Thanh toán khi nhận hàng
                                                        </p>
                                                    </div>
                                                </div>
                                                <p class="mb-0 text-end">Shipping to Hà Nội.</p>
                                            </div>
                                            <div
                                                class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                <h5 class="mb-0 ps-4 me-4">Tổng thu:</h5>
                                                <p class="mb-0">
                                                    <fmt:formatNumber type="number" value="${totalCartPrice*105/100}" />
                                                    VNĐ
                                                </p>
                                            </div>
                                            <button
                                                class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                                type="submit">Xác nhận thanh toán và đặt hàng</button>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                        </div>

                    </div>
                    <!-- Cart Page End -->
                    <!-- Footer Start -->
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- Footer End -->

                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>