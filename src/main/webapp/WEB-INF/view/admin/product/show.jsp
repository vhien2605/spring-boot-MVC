<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                    <meta name="author" content="Hỏi Dân IT" />
                    <title>Order show</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manager Products</h1>
                                <a href="/admin">Dashboard</a>
                                <a href=""></a>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="d-flex justify-content-between">
                                            <h3>Table products</h3>
                                            <a href="/admin/product/create" class="btn btn-primary">Create a product</a>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col mx-auto">
                                            <table class="table table-hover table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Id</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Target</th>
                                                        <th scope="col">Factory</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${products}" var="product">
                                                        <tr>
                                                            <th scope="row">${product.getId()}</th>
                                                            <td>${product.getName()}</td>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.getPrice()}" />
                                                                VNĐ
                                                            </td>
                                                            <td>${product.getTarget()}</td>
                                                            <td>${product.getFactory()}</td>
                                                            <td>
                                                                <a href="/admin/product/${product.getId()}"
                                                                    class="btn btn-success">View</a>
                                                                <a href="/admin/product/${product.getId()}/update"
                                                                    class="btn btn-warning">Update</a>
                                                                <a href="/admin/product/${product.getId()}/delete"
                                                                    class="btn btn-danger">Delete</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                            <li class="page-item"><a class="page-link"
                                                    href="/admin/product?page=1">1</a></li>
                                            <li class="page-item"><a class="page-link"
                                                    href="/admin/product?page=2">2</a></li>
                                            <li class="page-item"><a class="page-link"
                                                    href="/admin/product?page=3">3</a></li>
                                            <li class="page-item"><a class="page-link"
                                                    href="/admin/product?page=4">4</a></li>
                                            <li class="page-item"><a class="page-link"
                                                    href="/admin/product?page=5">5</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                </body>

                </html>