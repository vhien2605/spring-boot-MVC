<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Manager Orders</h1>
                            <a href="/admin">Dashboard</a>
                            <a href=""></a>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="d-flex justify-content-between">
                                        <h3>Table orders</h3>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col mx-auto">
                                        <table class="table table-hover table-bordered">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Id</th>
                                                    <th scope="col">User Id</th>
                                                    <th scope="col">Receiver Name</th>
                                                    <th scope="col">Receiver Address</th>
                                                    <th scope="col">Receiver Phone</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${orders}" var="order">
                                                    <tr>
                                                        <th scope="row">${order.getId()}</th>
                                                        <td>${order.getUser().getId()}</td>
                                                        <td>${order.getReceiverName()}</td>
                                                        <td>${order.getReceiverAddress()}</td>
                                                        <td>${order.getReceiverPhone()}</td>
                                                        <td>${order.getStatus()}</td>
                                                        <td>
                                                            <a href="/admin/order/${order.getId()}"
                                                                class="btn btn-success">View</a>
                                                            <a href="/admin/order/${order.getId()}/update"
                                                                class="btn btn-warning">Update</a>
                                                            <a href="/admin/order/${order.getId()}/delete"
                                                                class="btn btn-danger">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                               
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