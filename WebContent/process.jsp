<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String action = request.getParameter( "action" );
	if (action==null){
		%><jsp:forward page="inaction.html"/><%
	}
	
	com.game.GameMaster master = com.game.GameMaster.getInstance();
	com.game.Game game = master.getGame(session.getId());
	game.update(action);
	
	System.out.println("Action was:" +game.getUser().getAction());


%>	<jsp:forward page="play.jsp"/>