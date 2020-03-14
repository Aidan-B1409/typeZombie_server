public class GameWait implements Command{
  boolean isDone;
  public GameWait(){
    isDone = false;
  }
  
  public void run(){
    
  }
  public void updateCommandState(){
    
  }
  public void updateCommandState(boolean flag){
    isDone = flag;
    print(isDone);
  }
  public boolean canRun(double runTime){
    return !isDone;
  }
  public boolean isDone(){
    return isDone;
  }
  
}
