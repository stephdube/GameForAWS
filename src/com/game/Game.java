package com.game;

import java.util.Random;

public class Game {
	
	private Player user;
	private Player computer;
	String[] actions = {"develop", "peace", "barricade","throw","detonate"};
	Random rand;
	private Boolean gameOver;
	
	public Game(){
		user = new Player("Us");
		computer = new Player("Them");
		rand = new Random();
		gameOver = false;
	}
	
	public Player getUser(){
		return user;
	}

	public Player getComputer(){
		return computer;
	}
	
	public void update(String playerAction){
		
		/* Player states before actions are performed */
		int userWall = user.getWall();
		int compWall = computer.getWall();
		int compBomb = computer.getResources();
		
		user.setAction(playerAction);
		setCompAction(compBomb,compWall);
		
		playerMove(compWall, userWall);
		computerMove(userWall, compWall);
		updateGameStatus();
	}
	
	private void setCompAction(int bomb, int wall){
		if (bomb == 5 && rand.nextInt(100)<74)
			computer.setAction("detonate"); // 75% bomb will be used if one exists
		else if (wall == 0 && rand.nextInt(2)==0)
			computer.setAction("barricade"); // 1 in 3 chance wall will be built if no wall
		else if (bomb > 1 && rand.nextBoolean())
			computer.setAction("develop"); // 50% chance bomb building continues
		else
			computer.setAction(actions[rand.nextInt(4)]);
		
		if (bomb < 5 && computer.getAction().equals("detonate"))
			computer.setAction("throw"); // can't detonate if no bomb
		
		if (bomb == 5){ // don't keep developing bomb once built
			while (computer.getAction().equals("develop"))
				computer.setAction(actions[rand.nextInt(4)]);
		}
	}
	
	private void playerMove(int compWall, int userWall){
		switch (user.getAction()){
		case "barricade":
			user.build(userWall);
			user.setMessage("Our mighty walls will protect us.");
			break;
			
		case "develop":
			user.research();
			user.setMessage("Soon we will be unstoppable.");
			// Increased chance of computer developing bomb
			if (rand.nextBoolean())
				computer.setAction("develop");
			break;
			
		case "throw":
			if (rand.nextBoolean()){
				user.setMessage("We missed! :(");
				break;
			}
			if (computer.takeHit(compWall))
				user.setMessage("We hit 'em!");
			else
				user.setMessage("We'll bring down their walls!");
			break;
			
		case "peace":
			// Second chance of computer offering peace
			if (rand.nextInt(4)==1)
				computer.setAction("peace");
			if (computer.getAction().equals("detonate"))
				computer.setAction(actions[rand.nextInt(4)]);
			user.setMessage("Is there a possibility for peace?");
			break;
			
		case "detonate":
			user.useBomb();
			if (!computer.blowUp(compWall))
				user.setMessage("We've toppled their walls!");
			break;
		}
	}
	
	private void computerMove(int userWall, int compWall){
		switch (computer.getAction()){
		case "barricade":
			computer.build(compWall);
			computer.setMessage("The enemy is building a wall.");
			break;
			
		case "develop":
			computer.research();
			computer.setMessage("The enemy is awfully quiet...");
			break;
			
		case "throw":
			if (rand.nextBoolean()){
				computer.setMessage("That rock just missed us!");
				break;
			}
			if (user.takeHit(userWall))
				computer.setMessage("We've been hit!");
			else
				computer.setMessage("Our wall has been hit!");
			break;
			
		case "peace":
			computer.setMessage("The enemy has waved a flag of truce...");
			break;
			
		case "detonate":
			computer.useBomb();
			if (!user.blowUp(userWall))
				computer.setMessage("Bomb! They've devastated our defenses... But we're still alive.");
			break;
		}
	}
	
	private void updateGameStatus(){
		if (user.getAction().equals("peace") && computer.getAction().equals("peace"))
			gameOver = true;
		else if (user.getHealth()==0 || computer.getHealth()==0)
			gameOver = true;
	}
	
	public Boolean isGameOver(){
		return gameOver;
	}
}
