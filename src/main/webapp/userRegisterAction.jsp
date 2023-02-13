<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%> 
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPW = null;
	String userName = null;
	if(request.getParameter("userID") != null) {
		userID = (String)request.getParameter("userID");
	}
	if(request.getParameter("userPW") != null) {
		userPW = (String)request.getParameter("userPW");
	}
	if(request.getParameter("userName") != null) {
		userName = (String) request.getParameter("userName");
	}
	if (userID == null || userPW == null || userName == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(new UserDTO(userID, userPW, userName));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입이 완료되었습니다.');");
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
			script.close();
		}
	}
%>