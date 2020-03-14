class Player{
  PImage player;
  
  public Player(){
    player = loadImage("player.jpg");
  }
  
  public void draw(){
    image(player, 0, height - player.height/2, player.width/2, player.height/2);
  }
  
  public int getThreshold(){
    return player.width/2;
  }
}
