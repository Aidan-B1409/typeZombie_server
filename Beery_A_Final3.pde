/*------------------------------------------------------
**Project - Type Zombies
**Single Player Variant
**A project by Aidan Beery, 2020
**For OSU-Cascades CS-161 Final Project
**----------------------------------------------------*/
import processing.net.*;

Client client;
Server server;
Scheduler scheduler;
ElapsedTime gameTime;
GameScreen gameScreen;
UserInput userInput;
ObjectHandler objectHandler;
Score score;
Opponent opponent;
GameWait gameWait;

private final String URL = "127.0.0.1";
private final int PORT = 8025;
private final color BACKGROUND_COLOR = 255;

void setup(){
  size(1820, 980, P3D);
  gameTime = new ElapsedTime();
  userInput = new UserInput();
  score = new Score();
  gameScreen = new GameScreen(score, userInput);
  scheduler = new Scheduler(gameTime, gameScreen);
  objectHandler = new ObjectHandler(this, scheduler, gameScreen, gameTime, score);
  
  server = new Server(this, PORT);
  opponent = new Opponent(server);
  gameWait = new GameWait();
  scheduler.addCommand(gameWait);
}

void draw(){
  background(BACKGROUND_COLOR);
  gameScreen.draw();
  objectHandler.run();
  scheduler.run();
  gameWait.updateCommandState(
    opponent.client()
  );
  server.write(score.getScore());
}

void keyPressed(){
  if(keyCode == ENTER){
    scheduler.addCommand(userInput.new CheckWord(objectHandler));
  }
  else{
    if(key != CODED){
      userInput.addChar(key);
    }
  }
}
