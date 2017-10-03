package com.game;

import java.util.Hashtable;

public class GameMaster {

	public static GameMaster gameMaster = new GameMaster();
	private Hashtable<String, Game> gamesTable;
	
	private GameMaster(){
		gamesTable = new Hashtable<String, Game>();
	};
	
	public static GameMaster getInstance(){
		return gameMaster;
	}
	
	public Game getGame(String gameID){
		Game theGame = gamesTable.get(gameID);
		if (theGame==null)
			theGame = setGame(gameID);
		return theGame;
	}
	
	public Game setGame(String gameID){
		Game theGame = new Game();
		gamesTable.put(gameID, theGame);
		return theGame;
	}
	
	public void endGame(String gameID){
		gamesTable.remove(gameID);
	}
}
