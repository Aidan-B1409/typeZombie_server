abstract class InstantCommand implements Command{
  private float runCount;
  private boolean isRan;
  
  public InstantCommand(){
    isRan = false;
    runCount = 0;
  }
    
  public void updateCommandState(){
    if(!isRan){
      isRan = true;
    }
  }
  
  public boolean canRun(double runTime){
    return !isRan;
  }
  public boolean isDone(){
    runCount++;
    return isRan && (runCount >= 1);
  }
  
  abstract void run();
}
