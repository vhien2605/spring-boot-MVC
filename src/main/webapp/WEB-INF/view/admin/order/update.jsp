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
                <title>Update order</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            </head>
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Update User</h1>
                            <a href="/admin">Dashboard</a>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-md-6 mx-auto">
                                        <h1>Update Order : ${newUser.getId()}</h1>
                                        <hr />
                                        <form:form action="/admin/order/${newOrder.getId()}/update" method="POST"
                                            modelAttribute="newOrder">
                                            <div class="mb-3">
                                                <form:label path="id" class="form-label">Order id </form:label>
                                                <form:input type="text" path="id" class="form-control"
                                                    value="${newOrder.getId()}" disabled="true" />
                                            </div>
                                            <div class="mb-3">
                                                <form:label path="status" class="form-label">Status</form:label>
                                                <form:select class="form-select" path="status"
                                                    aria-label="${newOrder.getStatus()}">
                                                    <form:option value="Pending">PENDING
                                                    </form:option>
                                                    <form:option value="Shipping">SHIPPING
                                                    </form:option>
                                                    <form:option value="Cancel">CANCEL
                                                    </form:option>
                                                    <form:option value="Complete">COMPLETE
                                                    </form:option>
                                                </form:select>
                                            </div>
                                            <hr />
                                            <a href="/admin/order" class="btn btn-success">Back</a>
                                            <button type="submit" class="btn btn-primary">Update</button>
                                        </form:form>
                                        <hr />
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