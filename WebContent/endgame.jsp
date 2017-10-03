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
	com.game.GameMaster master = com.game.GameMaster.getInstance();
	com.game.Game game = master.getGame(session.getId());
	
	String name = game.getUser().getName();
	int userHealth = game.getUser().getHealth();
	String userAction = game.getUser().getAction();
	
	int compHealth = game.getComputer().getHealth();
	String compAction = game.getComputer().getAction();
	
	%>
	
<body>
<div class="container">

	<h1>Rock Wall Bomb</h1>
	<% 	if (userHealth==0){%>
	<h2>Game Over</h2>
	<%} else if (compHealth==0){%>
		<h2>Victory!</h2>
	<%} else{
		%><h2>Well done!</h2>
	<%
	}
	
	if ((userAction.equals("detonate")) && (compAction.equals("detonate"))){
		%><p>Great explosions from both sides. All that remains of the world is ashes.</p><%
	}
	else if (userHealth==0 && compHealth==0){
		%><p>Both sides fought valiantly, and in the end, both died.</p><%
	}
	else if (compHealth==0){
		%><p>The enemy has been vanquished!</p><%
	}
	else if (userHealth==0){
		%><p>A sad day. The enemy has triumphed!</p><%
	}
	else {
		%><p>A truce has been struck. There shall be peace!</p><%
	}

	master.endGame(session.getId());
	session.invalidate();

	%>
	
	<FORM METHOD="POST" ACTION="start.jsp">
		<input type="hidden" name="name" value="<%=name%>">
		<button type="submit" class="input">Play again?</button>
	</FORM>
	
</div>
</body>
</html>