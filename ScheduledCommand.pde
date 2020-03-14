abstract class ScheduledCommand implements Command{
  private ElapsedTime commandTime;
  private boolean firstRun;
  private float duration, startTime;
  
  ScheduledCommand(float duration, float startTime){
    this.duration = duration;
    this.startTime = startTime;
    firstRun = false;
  }
  
  public void updateCommandState(){
    if(!firstRun){
      commandTime = new ElapsedTime();
      firstRun = true;
    }
  }
  public float getTimestamp(){
    return startTime;
  }
  public boolean isDone(){
    try{
      return commandTime.getRuntime() >= duration;
    }
    catch(NullPointerException e){
      return false;
    }
  }
  public boolean canRun(double runTime){
    return runTime >= getTimestamp()
            && !isDone();
  }
  abstract void run();
 
}
