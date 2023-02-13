<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="seat.SeatDTO"%>
<%@page import="seat.SeatDAO"%>
<%@page import="reservation.*"%>
<%@page import="java.sql.Date"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/movieReservation.css" rel="stylesheet" >
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
</head>
<body>
<% 
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
%>
<form action="seatAction.jsp"  method="get" >
	<div class="seat_box">
    <h2 class="seat_choise">자리 선택</h2>
    <div class="hr"></div>
    <div class="seat-wrapper">
        <div class="left_sec">
            <div class="movie_screen">screen</div>
            <div class="seat-min">
            <div style="position: absolute; width: 20px; line-height: 25.4px;">
	            <div class="seat_ar">A</div>
	            <div class="seat_ar">B</div>
	            <div class="seat_ar">C</div>
	            <div class="seat_ar">D</div>
	            <div class="seat_ar">E</div>
	            <div class="seat_ar">F</div>
	            <div class="seat_ar">G</div>
	            <div class="seat_ar">H</div>
	            <div class="seat_ar">I</div>
	            <div class="seat_ar">J</div>
	            <div class="seat_ar">K</div>
	            <div class="seat_ar">L</div>
	            <div class="seat_ar">M</div>
            </div>
        <div style="position: relative; left: 30px; width: 540px;">
<%
        SeatDAO deatDao=new SeatDAO();
        List seatList=deatDao.seatList();
        for(int i=0; i<seatList.size(); i++) {
        	SeatDTO dto=(SeatDTO)seatList.get(i);
        	String seat=dto.getSeat();

        %>
        <input type="radio" class="seat_btn" name="seat_name" onclick="seat(this)"  value="<%=dto.getSeat() %>">
        <%
        }
        %>
        		</div>
            </div>
        </div>
        <script>

		function seat(my) {
		    let selected_seat = my.value;
		    document.getElementById('selected_seat').innerText
		    = selected_seat;
		}
		</script>
        <%
        ReservationDAO dao=new ReservationDAO();
        List mylist=dao.myReservtion(userID);
        for(int i=0; i<mylist.size(); i++) {
        	ReservationDTO dto=(ReservationDTO)mylist.get(i);
        	String seatDay=dto.getDay_re();
        	String seatName=dto.getMovieName();
        	String seatTime=dto.getTime_re();
        	String seatTheater=dto.getMovieTheater();

        %>
        <div class="right_sec">
            <div id="right_movie_name"><input name="seatName" type="hidden" value="<%=dto.getMovieName()%>"><%=dto.getMovieName() %></div>
            <div class="movie_info">
                <div id="right_movie_theater"><input name="seatTheater" type="hidden" value="<%=dto.getMovieTheater()%>"><%=dto.getMovieTheater() %></div>
                <div id="movie_date"><input name="seatDay" type="hidden" value="<%=dto.getDay_re()%>"><%=dto.getDay_re() %></div>
                <div id="movie_time"><input name="seatTime" type="hidden" value="<%=dto.getTime_re()%>"><%=dto.getTime_re() %></div>
            </div>
        <%
        }
        %>
            <h3>좌석</h3>
            <div id="selected_seat" style="color: #fff">
         	
            </div>
            <button type="submit" class="right_next">예매하기</button> 
        </div>

    </div>
</div>
</form>

    <script src="js/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->

    
</body>
</html>