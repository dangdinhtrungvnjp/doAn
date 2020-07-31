<%@page import="common.StringProcess"%>
<!DOCTYPE html">
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/validate.js"></script>

</head>
<body>
	<div class="head">
        <div class="head1">
            <p></p>
        </div>
        <div class="head2">
            <!-- <img src="C:\Users\PC\Desktop\linh tinh\logo.pnj"> -->
            <img src="img/logo.png" alt="" sizes="auto">
        </div>
        <div class="head3">
            <p></p>
        </div>
        <div class="clean1"></div>
    </div>

    <div class="container">
        <div class="left">
            <p></p>
        </div>
        <div class="form">
            <form name="myform" method="post" action="ThemNguoiDungServlet" onsubmit="return validateform()">
                user: <input id="email" type="text" name="tenDangNhapDK" placeholder="nhap use">
                <br>         
                <span id="choInEmail"></span>
                <br>
                pass: <input id="password" type="password" name="matKhauDK" placeholder="nhap pass">
                <br>
                <span id="choInPassword"></span>
                <br>
                <button  type="submit" value="submit" name="submit">dang ki</button> 
                <br>
                <br>
                
                <br>
                <br>
                
                <br>
                <br>
                
				<div>
					<p style="color: red;"><%=StringProcess.getVaildString((String)request.getAttribute("thongBao")) %></p>
				</div>
			</div>
              	
            </form>
        </div>
        <div class="right">
            <p></p>
        </div>
        
        <div class="clean2"></div>
    </div>
    <div class="footer">
        <p></p>
    </div>
    <div class="clean">

    </div>
</body>
</html>