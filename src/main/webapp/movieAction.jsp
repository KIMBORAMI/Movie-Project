<%@page import="java.sql.Date"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="reservation.ReservationDTO"%>
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
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	String movieName = null;
	String movieTheater=null;
	String time_re=null;
	String day_re=null;
	
	if(request.getParameter("movieName") != null) {
		movieName = (String) request.getParameter("movieName");
	}
	if(request.getParameter("time_re") != null) {
		time_re = (String) request.getParameter("time_re");
	}
	if(request.getParameter("movieTheater") != null) {
		movieTheater = (String) request.getParameter("movieTheater");
	}
	if(request.getParameter("day_re") != null) {
		day_re = (String) request.getParameter("day_re");
	}
	
	if (movieName == null || time_re == null || movieTheater == null  ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('선택이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		ReservationDAO reservationDAO = new ReservationDAO();
		int result = reservationDAO.reset(new ReservationDTO(userID, movieName, movieTheater, day_re, time_re));      
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('동일예약이 있습니다');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = './ticketing.jsp';");
			script.println("</script>");
			script.close();
			return ;
		}
	}
%>