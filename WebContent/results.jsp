<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%	
	com.game.GameMaster master = com.game.GameMaster.getInstance();
	com.game.Game game = master.getGame(session.getId());
	com.game.Player user = game.getUser();
	com.game.Player comp = game.getComputer();
	%><p><%=comp.getMessage() %></p><% 
	
	String userLast = user.getAction();
	if (userLast.equals("barricade")){
			int bricks = user.getWall();
			switch (bricks){
				case 1:
					%><img src="images/wallbuild.gif">
					<%break;
				case 2:
					%><img src="images/wallbuild2.gif">
					<%break;
				case 3:
					%><img src="images/wallbuild3.gif">
					<%break;
				case 4:
					%><img src="images/wallbuild4.gif">
					<%break;
				default:
					%><img src="images/wallbuild5loop.gif">
					<%break;
			}
	} 	else if (userLast.equals("throw"))
			%><img src="images/rocks1.gif"><%
		else if (userLast.equals("peace"))
			%><img src="images/wave.gif"><%
		else if (userLast.equals("develop"))
			%><img src="images/science.gif"><%
	%>

	<p><%=user.getMessage() %></p>