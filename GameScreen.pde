class GameScreen{
  private PFont headerFont;
  private Score score;
  private UserInput userInput;
  GameScreen(Score score, UserInput userInput){
    headerFont = createFont("GameCube.ttf", 32);
    this.score = score;
    this.userInput = userInput;
  }
  
  public void draw(){
    textFont(headerFont);
    fill(0);
    textAlign(CENTER);
    textSize(55);
    text("TYPE ZOMBIES", width/2, (height/2)-250);
    score.draw();
    userInput.draw();
  }
     
  public class IntroCard extends ScheduledCommand{
    public IntroCard(float duration, float startTime){
      super(duration, startTime);
    }
    public void run(){
      background(0);
      textFont(headerFont);
      fill(255);
      textAlign(CENTER);
      textSize(55);
      text("THE ZOMBIES ARE COMING...", width/2, height/2);
    }
  }
  
  public class StartCard extends ScheduledCommand{
    public StartCard(float duration, float startTime){
      super(duration, startTime);
    }
    public void run(){
      background(0);
      textFont(headerFont);
      fill(color(200, 0, 0));
      textAlign(CENTER);
      textSize(55);
      text("TYPE THEM AWAY!", width/2, height/2);
    }
  }
  public class EndGame extends ScheduledCommand implements Command{
    public EndGame(double startTime){
      super(0f,(float)startTime);
    }
    public void run(){
      background(0);
      textFont(headerFont);
      fill(255);
      textAlign(CENTER);
      textSize(55);
      text("GAME OVER", width/2, height/2);
    }
    public boolean isDone(){
      return false;
    }
    
  }
}
