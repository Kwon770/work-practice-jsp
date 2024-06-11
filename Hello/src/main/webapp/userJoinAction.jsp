<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hello.user.UserDAO" %>
<%@ page import="com.hello.user.UserDTO" %>
<%@ page import="java.io.PrintWriter"%>

<%
request.setCharacterEncoding("UTF-8");
String userID = null;
String userPassword = null;
if (request.getParameter("userID") != null) {
	userID = request.getParameter("userID");
}
if (request.getParameter("userPassword") != null) {
	userPassword = request.getParameter("userPassword");
}

if (userID == null || userPassword == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('아이디 또는 비밀번호가 입력되지 않았습니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}

UserDAO userDAO = new UserDAO();
int result = userDAO.join(userID, userPassword);
if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원가입에 성공했습니다.');");
	script.println("location.href = 'index.jsp';");
	script.println("</script>");
	script.close();

} else if (result == 0) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 존재하는 아이디입니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();

} else if (result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('데이터베이스 오류가 발생했습니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
}

%>
