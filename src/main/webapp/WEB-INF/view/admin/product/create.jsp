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
                <title>Create Product</title>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#productFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#productPreview").attr("src", imgURL);
                            $("#productPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

            </head>
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Create Product</h1>
                            <a href="/admin">Dashboard</a>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-md-6 mx-auto">
                                        <h1>Create Product</h1>
                                        <hr />
                                        <form:form action="/admin/product/create" method="POST"
                                            modelAttribute="newProduct" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="ErrorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <form:label path="name" class="form-label">Name</form:label>
                                                    <form:input type="text" path="name"
                                                        class="form-control ${not empty ErrorName ?'is-invalid':'' }" />
                                                    ${ErrorName}
                                                </div>
                                                <div class="col-12 col-md-6" mb-3>
                                                    <c:set var="ErrorPrice">
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <form:label path="price" class="form-label">Price
                                                    </form:label>
                                                    <form:input type="number" path="price"
                                                        class="form-control ${not empty ErrorPrice ? 'is-invalid':''}" />
                                                    ${ErrorPrice}
                                                </div>
                                            </div>
                                            <div class="mb-3 col-12">
                                                <c:set var="ErrorDetail">
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <form:label path="detailDesc" class="form-label">Detail
                                                    description</form:label>
                                                <form:input type="text" path="detailDesc"
                                                    class="form-control ${not empty ErrorDetail?'is-invalid':''}" />
                                                ${ErrorDetail}
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="ErrorShortDesc">
                                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <form:label path="shortDesc" class="form-label">Short
                                                        description
                                                    </form:label>
                                                    <form:input type="text" path="shortDesc"
                                                        class="form-control ${not empty ErrorShortDesc?'is-invalid':''}" />
                                                    ${ErrorShortDesc}
                                                </div>
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="ErrorQuantity">
                                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <form:label path="quantity" class="form-label">Quantity
                                                    </form:label>
                                                    <form:input type="number" path="quantity"
                                                        class="form-control ${not empty ErrorQuantity?'is-invalid':''}" />
                                                    ${ErrorQuantity}
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-md-6">
                                                    <div class="mb-3">
                                                        <label for="factory">Factory</label>
                                                        <form:select path="factory" class="form-select mb-3"
                                                            id="factory" aria-label="Default select example">
                                                            <form:option value="Apple">Apple(Macbook)</form:option>
                                                            <form:option value="Dell">Dell</form:option>
                                                            <form:option value="Lenovo">Lenovo</form:option>
                                                            <form:option value="Asus">Asus</form:option>
                                                            <form:option value="Hp">Hp</form:option>
                                                            <form:option value="LG">LG</form:option>
                                                            <form:option value="Acer">Acer</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <div class="mb-3">
                                                        <label for="target">Target</label>
                                                        <form:select path="target" class="form-select mb-3" id="target"
                                                            aria-label="Default select example">
                                                            <form:option value="FOOD">Thực phẩm</form:option>
                                                            <form:option value="DRINK">Đồ uống
                                                            </form:option>
                                                            <form:option value="TREE">Thảo dược</form:option>
                                                            <form:option value="CUSTOM">Vải may mặc</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-3 col-md-6">
                                                <label for="productFile" class="form-label">Image sản phẩm</label>
                                                <input class="form-control" type="file" id="productFile"
                                                    name="productFile" accept=".png, .jpg, .jpeg">
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="max-height:250px; display: none;" alt="product preview"
                                                    id="productPreview">
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <button type="submit" class="btn btn-primary">Create</button>
                                            </div>
                                        </form:form>
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