<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    // Send returning user to their current game
	String token = (String) session.getAttribute("token");
    if (token!=null){
    	%><jsp:forward page="play.jsp"/><%
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <title>Rock Wall Bomb</title>
    <link rel="stylesheet" href="styles/styles.css" type="text/css" media="screen">
</head>
<body>
    <div class="container">
	<h1>Rock Wall Bomb</h1>
	<h2>A Simple Game of War</h2>
		<FORM METHOD="POST" ACTION="start.jsp">
		Name: <input type="text" name="username">
		<button type="submit" class="input">Play?</button>
		</FORM>
    </div>
</body>
</html>