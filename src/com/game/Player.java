package com.game;

public class Player {
    private String name;
    private int health;
    private int resources;
    private int wall;
    private String action;
    String message;
    
    public Player(String value){
    	name = value;
    	health = 3;
    	resources = 0;
    	wall = 0;
    }
    
    public void setName( String value ) {
    	name = value;
    }

    public Boolean takeHit(int wallBeforeAction){
    	if (wallBeforeAction > 0){
    		wall -= 1;
    		return false;
    	}
    	else{
    		health -= 1;
    		return true;
    	}
    }
    
    public Boolean blowUp(int wallBeforeAction){
    	if (wallBeforeAction >= 5){
    		wall = 0;
    		return false;
    	}
    	else{
    		health = 0;
    		return true;
    	}
    }
    
    public void useBomb(){
    	resources = 0;
    }

    public void research(){
        resources += 1;
    }
    
    public void build(int wallBeforeAction){
    	wall = wallBeforeAction + 1;
    }
    
    public void setAction(String value) {
    	action = value;
    }
    
    public void setMessage(String value) {
    	message = value;
    }

    public String getName() { 
    	return name; 
    }

    public int getHealth() { 
    	return health; 
    }

    public int getResources() { 
    	return resources; 
    }
    
    public int getWall() {
    	return wall;
    }
    
    public String getAction() {
    	return action;
    }
    
    public String getMessage(){
    	return message;
    }
}