<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String name = request.getParameter( "username" );
	session.setAttribute("token", name);
	
	com.game.GameMaster master = com.game.GameMaster.getInstance();
	com.game.Game game = master.setGame(session.getId());
	
	if (name!=null && !name.isEmpty()){
		game.getUser().setName(name);
	}
%>

<jsp:forward page="play.jsp"/>