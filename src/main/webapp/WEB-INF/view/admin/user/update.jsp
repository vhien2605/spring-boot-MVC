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
                <title>Create User</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const userFile = $("#userFile")
                        const orgImage = "${newUser.getAvatar()}"
                        console.log(orgImage)
                        if (orgImage) {
                            const urlImage = "/image/avatar/" + orgImage
                            console.log(urlImage)
                            $("#userPreview").attr("src", urlImage)
                            $("#userPreview").css("display", "block")
                        }
                        userFile.change(function (e) {
                            const imageUrl = URL.createObjectURL(e.target.files[0])
                            $("#userPreview").attr("src", imageUrl)
                            $("#userPreview").css("display", "block")
                        })
                    })
                </script>
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
                                        <h1>Update User : ${newUser.getId()}</h1>
                                        <hr />
                                        <form:form action="/admin/user/${Id}/update" method="POST"
                                            modelAttribute="newUser" enctype="multipart/form-data">
                                            <div class="mb-3">
                                                <form:label path="id" class="form-label">Id : </form:label>
                                                <form:input type="text" path="id" value="${newUser.getId()}"
                                                    disabled="true" class="form-control" />
                                            </div>

                                            <div class="mb-3">
                                                <form:label path="email" class="form-label">Email : </form:label>
                                                <form:input type="email" path="email" value="${newUser.getEmail()}"
                                                    disabled="true" class="form-control" />
                                            </div>

                                            <div class="mb-3">
                                                <form:label path="name" class="form-label">Name : </form:label>
                                                <form:input type="text" path="name" value="${newUser.getName()}"
                                                    class="form-control" />
                                            </div>

                                            <div class="mb-3">
                                                <form:label path="address" class="form-label">Address :
                                                </form:label>
                                                <form:input type="text" path="address" value="${newUser.getAddress()}"
                                                    class="form-control" />
                                            </div>
                                            <div class="mb-3">
                                                <form:label path="phone" class="form-label">Phone : </form:label>
                                                <form:input type="text" path="phone" value="${newUser.getPhone()}"
                                                    class="form-control" />
                                            </div>
                                            <div class="col-12 mb-3 col-md-6">
                                                <div class="mb-3">
                                                    <label for="userFile" class="form-label">User avatar</label>
                                                    <input class="form-control" type="file" id="userFile"
                                                        name="userFile" accept=".png, .jpg, .jpeg">
                                                </div>
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="max-height:250px; display: none;" alt="avatar preview"
                                                    id="userPreview">
                                            </div>
                                            <hr />
                                            <button type="submit" class="btn btn-primary">Update</button>
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