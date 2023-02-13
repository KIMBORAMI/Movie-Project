<%@page import="java.util.List"%>
<%@page import="reservation.ReservationDTO"%>
<%@page import="reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
</head>
  <%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();	
	}
%>	
<body class="d-flex flex-column h-100">
           <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.html">Start Bootstrap</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
<%
	if(userID == null) {
%>
                            <li class="nav-item"><a class="nav-link" href="userLogin.jsp">로그인</a></li>
                            <li class="nav-item"><a class="nav-link" href="userRegister.jsp">회원가입</a></li>
                            <li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#myModal" href="">mypage</a></li>
<%
	} else {
%>
							<li class="nav-item"><a class="nav-link" href="userLogout.jsp">로그아웃</a></li>
                            <li class="nav-item"><a class="nav-link"data-toggle="modal" data-target="#myModal" href="">mypage</a></li>
<%
	}
%>
                        </ul>
                    </div>
                    
                </div>
            </nav>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="justify-content: space-around;">
                        <ul class="navbar-nav mb-2 mb-lg-0" >
                            <li class="nav-item"><a class="nav-link" href="movieList.jsp">영화차트</a></li>
                            <li class="nav-item"><a class="nav-link" href="reservation.jsp">영화예매</a></li>
                            <li class="nav-item"><a class="nav-link" href="faq.html">FAQ</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
	<div class="container mt-3" style="max-width: 560px;">
      <form method="post" action="./userLoginAction.jsp">
        <div class="form-group">
          <label>아이디</label>
          <input type="text" name="userID" class="form-control">
        </div>
        <div class="form-group">
          <label>비밀번호</label>
          <input type="password" name="userPW" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">로그인</button>
      </form>
    </div>
    <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2022</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="./js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>