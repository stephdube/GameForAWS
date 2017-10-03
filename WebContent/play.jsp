<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="styles/styles.css" type="text/css" media="screen">
<title>Rock Wall Bomb</title>
</head>
<% 
	com.game.Game game = com.game.GameMaster.getInstance().getGame(session.getId());
	Boolean end = game.isGameOver();
	if (end){
		%><jsp:forward page="endgame.jsp"/><% 
	}
	com.game.Player user = game.getUser(); 
	com.game.Player computer = game.getComputer(); 
	String userLast = user.getAction(); 
%>
<body>
<div class="container">

<h1>Rock Wall Bomb</h1>

<div class="stats">
<table>
<tr>
	<th></th>
	<th>Health</th>
	<th>Wall Size</th>
	<th>Bomb Completion</th>
</tr>
<tr>
	<th><%=user.getName() %></th>
	<td><%=user.getHealth() %></td>
	<td><%=user.getWall() %></td>
	<td><%=user.getResources()*20 %>%</td>
</tr>
<tr>
	<th><b><%=computer.getName() %></b></th>
	<td><%=computer.getHealth() %></td>
	<td><%=computer.getWall() %></td>
	<td><%=computer.getResources()*20 %>%</td>
</tr>
</table>
</div>

<%	if (userLast != null){ %>
		<div class="results">
			<jsp:include page="results.jsp"/>
		</div>
<%	} %>


<h3>What will you decide <%	if (userLast != null){%>next<%}%>?</h3>

<FORM METHOD="POST" ACTION="process.jsp">
	<div class="actions">
    <table class="table table-hover">
    <thead></thead>
		<tbody>
     <tr><td><input type="radio" name="action" value="throw"> throw a rock<br></td></tr>
        <tr><td><input type="radio" name="action" value="barricade"> build a wall<br></td></tr>
        <% if (user.getResources() < 5){ %>
        <tr><td><input type="radio" name="action" value="develop"> develop a bomb<br></td></tr>
        <%} if (user.getResources() >= 5){ %>
        <tr><td><input type="radio" name="action" value="detonate"> detonate a bomb<br></td></tr>
        <%} %>
        <tr><td><input type="radio" name="action" value="peace"> offer a truce</td></tr>
        </tbody>
	</table>
	</div>
        <button type="submit" class="input">I've made my choice</button>
</FORM>

</div>

</body>
</html>

