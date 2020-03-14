class ElapsedTime{
  private double startTime;
  ElapsedTime(){
    startTime = System.nanoTime();
  }
  
  private double getDeltaTime(){
    return System.nanoTime() - startTime;
  }
  
  public double getRuntime(){ 
    return getDeltaTime() / 1000000000;
  }
  
  public boolean isLessThan(double threshold){
    return getRuntime() < threshold;
  }
  public boolean isGreaterThan(double threshold){
      return getRuntime() > threshold;
  }
  
  public void reset(){
    startTime = System.nanoTime();
  }
  
}
