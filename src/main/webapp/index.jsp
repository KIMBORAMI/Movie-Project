<%@page import="reservation.ReservationDTO"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="movie.MovieDTO"%>
<%@page import="java.util.List"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

</head>
<body class="d-flex flex-column h-100">
  <% 
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
  %>

<%
if(userID != null) {
ReservationDAO Mydao=new ReservationDAO();
List mylist=Mydao.myReservtion(userID);
for(int i=0; i<mylist.size(); i++) {
	  ReservationDTO dto=(ReservationDTO)mylist.get(i);
	  String movieName=dto.getMovieName();
	  String movieTheater=dto.getMovieTheater();
	  String day_re=dto.getDay_re();
	  String time_re=dto.getTime_re();
%>
<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-xl modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><%=dto.getMovieName() %></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<p class="modal-title"><%=dto.getMovieTheater() %></p>
        	<p class="modal-title"><%=dto.getDay_re() %></p>
        	<p class="modal-title"><%=dto.getTime_re() %></p>
        </div>
      </div>
    </div>
</div>
<%
}
}else {
%>
<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-xl modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">로그인/회원가입을 해주세요</h4>
          <a class="nav-link" href="userLogin.jsp">로그인</a>
          <a class="nav-link" href="userRegister.jsp">회원가입</a>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
      </div>
    </div>
</div>
<%
}
%>
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.jsp">Start Bootstrap</a>
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
            <div id="ctl00_PlaceHolderContent_divMovieSelection_wrap" class="movieSelection_wrap">
                <div class="contents">
                    <div class="video_wrap">
                    <video autoplay="" muted="">
                        <source src="https://adimg.cgv.co.kr/images/202301/antman/antman_PC_1080x608.mp4" type="video/mp4">
                        이 브라우저는 Video 태그를 지원하지 않습니다. (Your browser does not support the video tag.)
                    </video>
                        <strong class="movieSelection_title">앤트맨과 와스프-퀀텀매니아</strong>
                        <span class="movieSelection_txt">2023년 첫 번째 마블 블록버스터 2월,<br>무한한 우주의 정복자가 깨어난다!</span>
                        <div class="movieSelection_video_controller_wrap">
                            <button class="btn_movieSelection_detailView"><a>예매하기</a></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">무비차트</h2>
                                <div class="movieSelection_video_controller_wrap">
                            		<button class="btn_movieList"><a href="movieList.jsp">전체보기</a></button>
                        		</div>
                            </div>
                        </div>
                    </div>
                    <div style="display: flex;">
                    <%
MovieDAO dao=new MovieDAO();
List list=dao.movieList();
for(int i=0; i<3; i++) {
	  MovieDTO dto=(MovieDTO)list.get(i);
	  String movieName=dto.getMovieName();
	  String movieImage=dto.getMovieImage();
	  String movieState=dto.getMovieState();
	  String ageImage=dto.getAgeImage();
	  Date movieDate=dto.getMovieDate();
	  Integer movieNum=dto.getMovieNum();
%>
					
                        <div class="movie_warp col-lg-4 mb-5" style="padding: 10px;">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="<%=dto.getMovieImage() %>" alt="..." />
                                <div style="font-size: 4em;
									    position: absolute;
									    bottom: 152px;
									    left: 20px;
									    color: #fff;"><%=dto.getMovieNum() %></div>
                                <div class="card-body" style="margin: 0 auto;">
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title"><%=dto.getMovieName() %></h5></a>
                                </div>
                                <div class="card-footer pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div style="display: inline-block;" class="fw-bold"><%=dto.getMovieState() %></div>
                                                <div style="display: inline-block;" class="text-muted"><%=dto.getMovieDate() %></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     
                        <%
						}
                        %>
                        </div>
                    <!-- Call to action-->
                    
                </div>
            </section>
            <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
                        <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                            <div class="mb-4 mb-xl-0">
                                <div class="fs-3 fw-bold text-white">New products, delivered to you.</div>
                                <div class="text-white-50">Sign up for our newsletter for the latest updates.</div>
                            </div>
                            <div class="ms-xl-4">
                                <div class="input-group mb-2">
                                    <input class="form-control" type="text" placeholder="Email address..." aria-label="Email address..." aria-describedby="button-newsletter" />
                                    <button class="btn btn-outline-light" id="button-newsletter" type="button">Sign up</button>
                                </div>
                                <div class="small text-white-50">We care about privacy, and will never share your data.</div>
                            </div>
                        </div>
                    </aside>
        </main>
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>