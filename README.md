# simplegame
A simple turn-based browser game, created for the purpose of demonstrating how to use the AWS Elastic Beanstalk tool in conjunction with a Java web app.

# Links
Tutorial is located here: https://github.com/stephdube/GameForAWS/blob/master/TutorialForElasticBeanstalk.pdf.

A short overview in video form is located here: https://youtu.be/-awq5G42WO4 and a longer version of the video here: https://youtu.be/p4P_XoRFfwQ.

The app itself is no longer hosted live.

# Description
The application consists of a handful of jsp files which interact with server-side classes to dynamically render html and images (animated gifs made for the game) according to game events and client requests. Each EC2 server running the application will have a Singleton Java object called GameMaster which contains a hashmap of Game objects. A new Game object is created when a user sends a POST request to the server to start the game; the Game is stored in the GameMaster hashmap with the user’s session ID as the key. The jsp files are then able to use the session ID to retrieve and update the game state, responding to user input and game object methods. Each Game includes two Players, a user and a “computer,” instantiated upon the start of a Game, which contain each player’s game data. When a game ends, the game object is removed from the GameMaster hashmap (to be destroyed by Java’s garbage collection).

The game’s working title is “Rock Wall Bomb” because of its resemblance to the classic “Rock Paper Scissors” (although it is actually much closer to a similar children’s hand-game called “Shotgun”). The rules are as follows. A player starts a game against a computer. Both start with health at level 3, walls at 0, and bombing power at 0. The player has 4 actions to choose from: “Throw a rock,” “Build a wall,” “Develop a bomb,” or “Offer a truce.” If a player throws a rock, their opponent’s health is decreased, unless the opponent has a wall, in which case the wall’s power is decreased. Bombs do more damage, reducing walls of any strength to 0 and instantly defeating an opponent with insufficiently strong walls. Bomb require multiple turns of development. The game ends when a player’s health reaches 0. If both players use a bomb on the same turn and neither has a wall large enough to withstand a bomb, the game is over and both players lose. If both players offer a truce at the same time, the game is over and both players win. 
