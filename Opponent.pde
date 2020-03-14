public class Opponent{
  Score score;
  Server server;
  Client client;
  public Opponent(Server server){
    this.server = server;
    this.score = new Score();
  }
  public boolean client(){
    client = server.available();
    if(client != null){
      try{
        score.setScore(client.read());
      }
      catch(NullPointerException e){
        
      }
      score.draw(width/2, height/2-450, "Opponent");
      return true;
    }
    else{
      fill(0);
      textAlign(CENTER);
      textSize(35);
      text("Waiting on Client to connect", width/2, (height/2)-450);    
      return false;
    }
  }
  
}
