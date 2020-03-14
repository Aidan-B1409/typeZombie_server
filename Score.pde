class Score{
  private PFont headerFont;
  private int score;
  
  public Score(){
    score = 0;
    headerFont = createFont("GameCube.ttf", 32);
  }
  
  public void draw(){
    textFont(headerFont);
    fill(0);
    textAlign(CENTER);
    textSize(35);
    text("SCORE: " + score, width/2, (height/2)-350);    
  }
  
  public void draw(int xCoord, int yCoord, String name){
    textFont(headerFont);
    fill(0);
    textAlign(CENTER);
    textSize(35);
    name = name.toUpperCase();
    text(name + "SCORE: " + score, xCoord, yCoord);  
  }
  public int getScore(){
    return score;
  }
  public void addScore(){
    score++;
  }
  public void setScore(int score){
    this.score = score;
  }
}
