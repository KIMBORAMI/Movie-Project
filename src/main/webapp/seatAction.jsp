<%@page import="reservation.ReservationDTO"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	String movieName = request.getParameter("movieName");
	String movieTheater=request.getParameter("movieTheater");
	String time_re=request.getParameter("time_re");
	String seat=request.getParameter("seat_name");
	String day_re=request.getParameter("day_re");
	
	
	
		ReservationDAO seatDAO = new ReservationDAO();
		int result = ReservationDAO.seatReset(new ReservationDTO(userID, movieName,movieTheater, day_re, time_re, seat));               
		if (result == -1) { 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('영화선택 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('영화신청 완료되었습니다.');");
			script.println("location.href = './index.jsp';");
			script.println("</script>");
			script.close();
			return ;
	
	}
%>