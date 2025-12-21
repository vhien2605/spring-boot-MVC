<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Laptop Shop</title>
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
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
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


                <!-- header  -->
                <jsp:include page="../layout/header.jsp" />
                <!-- header -->

                <!-- Hero start -->
                <jsp:include page="../layout/banner.jsp" />
                <!-- Hero end -->



                <!-- Modal Search Start -->
                <!-- <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-fullscreen">
                        <div class="modal-content rounded-0">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Tìm kiếm</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body d-flex align-items-center">
                                <form action="/shop" method="get" class="input-group w-75 mx-auto d-flex">
                                    <input type="search" name="keyword" class="form-control p-3"
                                        placeholder="Nhập tên sản phẩm..." value="${param.keyword}">
                                    <button type="submit" class="input-group-text p-3">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </form>
                            </div>

                        </div>
                    </div>
                </div> -->
                <!-- Modal Search End -->


                <!-- Single Page Header start -->
                <div class="container-fluid page-header py-5">
                    <h1 class="text-center text-white display-6">Shop</h1>
                    <ol class="breadcrumb justify-content-center mb-0">
                        <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item active text-white">Shop</li>
                    </ol>
                </div>
                <!-- Single Page Header End -->


                <!-- Fruits Shop Start-->
                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <h1 class="mb-4">Shop sản phẩm OCOP</h1>
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <div class="col-xl-3">
                                        <form action="/shop" method="get" class="input-group w-100 mx-auto d-flex">
                                            <!-- search theo tên -->
                                            <input type="search" name="keyword" class="form-control p-3"
                                                placeholder="Tìm theo tên sản phẩm..." value="${param.keyword}">

                                            <!-- giữ lại filter hiện tại -->
                                            <input type="hidden" name="target" value="${param.target}" />
                                            <input type="hidden" name="maxPrice" value="${param.maxPrice}" />

                                            <button type="submit" class="input-group-text p-3">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </form>
                                    </div>

                                    <div class="col-6"></div>
                                </div>

                                <div class="row g-4">
                                    <div class="col-lg-3">
                                        <div class="row g-4">
                                            <form action="/shop" method="get">

                                                <!-- CATEGORY SELECT -->
                                                <div class="mb-4">
                                                    <h4>Phân loại</h4>
                                                    <select name="target" class="form-select">
                                                        <option value="">-- Tất cả --</option>
                                                        <option value="THIET-KE-DO-HOA"
                                                            ${param.target=='THIET-KE-DO-HOA' ? 'selected' : '' }>
                                                            THIẾT KẾ ĐỒ HỌA
                                                        </option>
                                                        <option value="SINHVIEN-VANPHONG"
                                                            ${param.target=='SINHVIEN-VANPHONG' ? 'selected' : '' }>
                                                            SINH VIÊN - VĂN PHÒNG
                                                        </option>
                                                        <option value="MONG-NHE" ${param.target=='MONG-NHE' ? 'selected'
                                                            : '' }>
                                                            MỎNG NHẸ
                                                        </option>
                                                        <option value="GAMING" ${param.target=='GAMING' ? 'selected'
                                                            : '' }>
                                                            GAMING
                                                        </option>
                                                        <option value="DOANH-NHAN" ${param.target=='DOANH-NHAN'
                                                            ? 'selected' : '' }>
                                                            DOANH NHÂN
                                                        </option>
                                                    </select>
                                                </div>

                                                <!-- PRICE SELECT -->
                                                <div class="mb-4">
                                                    <h4>Giá tiền</h4>
                                                    <select name="maxPrice" class="form-select">
                                                        <option value="">-- Không giới hạn --</option>
                                                        <option value="10000000" ${param.maxPrice=='10000000'
                                                            ? 'selected' : '' }>
                                                            Dưới 10 triệu
                                                        </option>
                                                        <option value="20000000" ${param.maxPrice=='20000000'
                                                            ? 'selected' : '' }>
                                                            Dưới 20 triệu
                                                        </option>
                                                        <option value="50000000" ${param.maxPrice=='50000000'
                                                            ? 'selected' : '' }>
                                                            Dưới 50 triệu
                                                        </option>
                                                        <option value="70000000" ${param.maxPrice=='70000000'
                                                            ? 'selected' : '' }>
                                                            Dưới 70 triệu
                                                        </option>
                                                        <option value="100000000" ${param.maxPrice=='100000000'
                                                            ? 'selected' : '' }>
                                                            Dưới 100 triệu
                                                        </option>
                                                    </select>
                                                </div>

                                                <button type="submit" class="btn btn-primary w-100">
                                                    Lọc sản phẩm
                                                </button>
                                            </form>

                                            <!-- <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <h4>Phân loại</h4>
                                                    <ul class="list-unstyled fruite-categorie">
                                                        <li>
                                                            <div class="d-flex justify-content-between fruite-name">
                                                                <a href="/shop?target=THIET-KE-DO-HOA">
                                                                    <i class="fas fa-apple-alt me-2"></i>THIẾT KẾ ĐỒ HỌA
                                                                </a>
                                                                <span>(3)</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="d-flex justify-content-between fruite-name">
                                                                <a href="/shop?target=SINHVIEN-VANPHONG">
                                                                    <i class="fas fa-apple-alt me-2"></i>SINH VIÊN - VĂN
                                                                    PHÒNG
                                                                </a>
                                                                <span>(5)</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="d-flex justify-content-between fruite-name">
                                                                <a href="/shop?target=MONG-NHE">
                                                                    <i class="fas fa-apple-alt me-2"></i>MỎNG NHẸ
                                                                </a>
                                                                <span>(2)</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="d-flex justify-content-between fruite-name">
                                                                <a href="/shop?target=GAMING">
                                                                    <i class="fas fa-apple-alt me-2"></i>GAMING
                                                                </a>
                                                                <span>(8)</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="d-flex justify-content-between fruite-name">
                                                                <a href="/shop?target=DOANH-NHAN">
                                                                    <i class="fas fa-apple-alt me-2"></i>DOANH NHÂN
                                                                </a>
                                                                <span>(5)</span>
                                                            </div>
                                                        </li>
                                                    </ul>

                                                </div>
                                            </div>
                                            <form action="/shop" method="get">
                                                <input type="hidden" name="target" value="${target}" />

                                                <h4 class="mb-2">Giá tiền</h4>

                                                <input type="range" class="form-range w-100" id="price" name="maxPrice"
                                                    min="0" max="100000000"
                                                    value="${param.maxPrice != null ? param.maxPrice : 100000000}"
                                                    oninput="amount.value=this.value">

                                                <output id="amount">${param.maxPrice != null ? param.maxPrice :
                                                    100000000}</output>

                                                <button type="submit" class="btn btn-sm btn-primary mt-2">
                                                    Lọc
                                                </button>
                                            </form> -->

                                            <!-- <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <h4>Thông tin bổ sung</h4>
                                                    <div class="mb-2">
                                                        <input type="radio" class="me-2" id="Categories-1"
                                                            name="Categories-1" value="Beverages">
                                                        <label for="Categories-1"> Đồ hữu cơ</label>
                                                    </div>
                                                    <div class="mb-2">
                                                        <input type="radio" class="me-2" id="Categories-2"
                                                            name="Categories-1" value="Beverages">
                                                        <label for="Categories-2"> Đồ tươi</label>
                                                    </div>
                                                    <div class="mb-2">
                                                        <input type="radio" class="me-2" id="Categories-3"
                                                            name="Categories-1" value="Beverages">
                                                        <label for="Categories-3"> Đang giảm giá</label>
                                                    </div>
                                                    <div class="mb-2">
                                                        <input type="radio" class="me-2" id="Categories-3"
                                                            name="Categories-1" value="Beverages">
                                                        <label for="Categories-3"> Bán chạy</label>
                                                    </div>

                                                </div>
                                            </div> -->
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <div class="row g-4 justify-content-center">
                                            <c:choose>
                                                <c:when test="${not empty productList}">
                                                    <c:forEach items="${productList}" var="product">
                                                        <div class="col-md-6 col-lg-6 col-xl-4">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <a href="/product/${product.id}">
                                                                        <img src="/image/product/${product.image}"
                                                                            class="img-fluid w-100 rounded-top" alt="">
                                                                    </a>
                                                                </div>

                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Laptop</div>

                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <a href="/product/${product.id}">
                                                                        <h4 style="font-size: 15px;">${product.name}
                                                                        </h4>
                                                                    </a>

                                                                    <p style="font-size: 13px;">${product.shortDesc}</p>

                                                                    <p class="text-dark fs-5 fw-bold mb-3 text-center">
                                                                        <fmt:formatNumber value="${product.price}" />
                                                                        VNĐ
                                                                    </p>

                                                                    <form action="/add-to-cart/${product.id}"
                                                                        method="POST">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" />
                                                                        <input type="hidden" name="quantity"
                                                                            value="1" />
                                                                        <button type="submit"
                                                                            class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
                                                                            <i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart
                                                                        </button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:when>

                                                <c:otherwise>
                                                    <div class="col-12 text-center">
                                                        <h4 class="text-muted">Không có sản phẩm nào</h4>
                                                    </div>
                                                </c:otherwise>

                                            </c:choose>
                                            <!-- <div class="col-md-6 col-lg-6 col-xl-4">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="img/item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>BÒ NẮNG</h4>
                                                        <p>Thanh lọc cơ thể, cải thiện tiêu hóa , ngăn ngừa táo bón, cung cấp dinh dưỡng, năng lượng cho cơ thể</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> -->

                                            <div class="col-12">
                                                <div class="pagination d-flex justify-content-center mt-5">
                                                    <a href="#" class="rounded">&laquo;</a>
                                                    <a href="#" class="active rounded">1</a>
                                                    <a href="#" class="rounded">2</a>
                                                    <a href="#" class="rounded">3</a>
                                                    <a href="#" class="rounded">4</a>
                                                    <a href="#" class="rounded">5</a>
                                                    <a href="#" class="rounded">6</a>
                                                    <a href="#" class="rounded">&raquo;</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->


                <!-- footer start -->
                <jsp:include page="../layout/footer.jsp" />
                <!-- footer end -->


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