<%@page import="reservation.ReservationDTO"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="day.DayDTO"%>
<%@page import="day.DayDAO"%>
<%@page import="seat.SeatDTO"%>
<%@page import="seat.SeatDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="time.TimeDTO"%>
<%@page import="time.TimeDAO"%>
<%@page import="theater.TheaterDTO"%>
<%@page import="theater.TheaterDAO"%>
<%@page import="movie.MovieDTO"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie</title>
<link rel="stylesheet" href="css/movieReservation.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
  <% 
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
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
<form action="movieAction.jsp" method="get" >
	<div class="reservation_form" >
		<ul>
		<div class="movieName">
			<%
			request.setCharacterEncoding("UTF-8");
						String movieName = null;
						if(session.getAttribute("movieName") != null) {
							movieName = (String) session.getAttribute("movieName");
						}
							MovieDAO dao=new MovieDAO();
							List list=dao.movieList();
							for(int i=0; i<list.size(); i++) {
								  MovieDTO dto=(MovieDTO)list.get(i);
								  movieName=dto.getMovieName();
			%>
			<li class="movieNameli">
				<input type="radio" style="display: block ; " name="movieName" checked="checked" value="<%=dto.getMovieName()%>" <%=dto.getMovieName()%>><%=dto.getMovieName()%>
			</li>
			<%
			}
			%>
		</div>

		<div class="movieTheater">
		<%
		TheaterDAO tdao=new TheaterDAO();
			List tlist=tdao.theaterList();
			for(int i=0; i<tlist.size(); i++) {
				  TheaterDTO tdto=(TheaterDTO)tlist.get(i);
				  String movieTheater=tdto.getMovieTheater();
		%>
				<li>
					<input type="radio" name="movieTheater" value=<%=tdto.getMovieTheater()%>><%=tdto.getMovieTheater()%>
				</li>
		<%
		}
		%>
		</div>

		<div class="movieTime">
		<%
		DayDAO daydao=new DayDAO();
			List daylist=daydao.dayList(); 
			for(int i=0; i<daylist.size(); i++) {
				DayDTO daydto=(DayDTO)daylist.get(i);
				String day=daydto.getDay_re(); 
		%>
				<li>
					<input type="radio" name="day_re" value="<%=daydto.getDay_re()%>"><%=daydto.getDay_re()%>
				</li>

		<%
		}
		%>
		</div>
		<div class="movieTime">
		<%
		TimeDAO tidao=new TimeDAO();
			List tilist=tidao.timeList(); 
			for(int i=0; i<tilist.size(); i++) {
				  TimeDTO tidto=(TimeDTO)tilist.get(i);
				  String time=tidto.getTime_re();
		%>
				<li>
					<input type="radio" name="time_re" value="<%=tidto.getTime_re()%>"> <%=tidto.getTime_re()%>
				</li>
		<%
		}
		%>
		</div>
		<div>
			<button type="submit" class="seatbtn">좌석선택</button>
		</div>
	</ul>


	</div>


</form>
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
    <script src="js/seat.js"></script> 
    <script src="js/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>