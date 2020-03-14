class Zombie extends PhysicsObject{
  private final float MAX_CHAR = 15,
                    MIN_CHAR = 2,
                    MAX_VELOCITY = -2.5,
                    MIN_VELOCITY = -5.5;
  private String word;
  private boolean isDone;
  private PImage img;
  
  public Zombie(String word){
    this.word = word;
    xSize = 137;
    ySize = 215;
    float xVelocity = map(word.length(),MIN_CHAR, MAX_CHAR, MIN_VELOCITY, MAX_VELOCITY);
    velocity = new PVector(xVelocity, 0);
    position = new PVector(
                width - xSize, 
                height - ySize);
    this.isDone = false;
    img = loadImage("zombie.png");
    img.resize(xSize, ySize);
  }
  public void draw(){
    image(img, position.x, position.y);
    textSize(16);
    text(word, position.x+(xSize/2), position.y-10);
  }
  public void update(){
    if(!isDone){
      position.x += velocity.x;
    }
  }
  public void wordMatch(String inputWord){
    String checkWord = word.replaceAll("\\s+","");
    inputWord = inputWord.replaceAll("\\s+","");
    if (checkWord.equals(inputWord)){
      isDone = true;
    }
  }
  public boolean isDone(){
    return isDone;
  }
}
