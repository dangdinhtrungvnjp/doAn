<%@page import="java.util.ArrayList" %>
<%@page import="model.bean.NhanVien" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <title>Dach sach nhan vien</title>
    <link rel="stylesheet" href="css/paging.css">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"> -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    
</head>

<body>
    
    <!-- test1111 -->
    
    <div class="overlay"></div>
    <div class="content">
        <div class="container">
            <div class="search">
                <span></span>
                <!-- <input type="search" name="search1" id="search1" placeholder="search......">
				<button id="search2" value = "search" onclick="window.location.href='DanhSachNhanVienServlet'">search</button> -->
                <form action="${pageContext.request.contextPath}/DanhSachNhanVienServlet" method="post">
                    <input type="text" name="gioiTinh" />
                    <input type="submit" name="search" value="search" />
                </form>
    		</div>
            <div class="content_product" id="product">
                <!-- <div class="content__product__item">
                    <a href="">
                        <img src="" alt="">
                    </a>
                    <h3></h3>
                </div> -->
            </div>

            <div class="content__paging">
                <div class="page">
                    <ul>
                        <li class="btn-prev1">&laquo;</li>
                        <li class="btn-prev">&lsaquo;</li>
                        <div class="number-page" id="number-page">
                            <!-- <li class="active">
                                <a>1</a>
                            </li>
                            <li>
                                <a>2</a>
                            </li>
                            <li>
                                <a>3</a>
                            </li> -->
                        </div>
                        <li class="btn-next">&rsaquo;</li>
                        <li class="btn-next1">&raquo;</li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <script src="js/paging.js"></script>
    
</body>

</html>