interface Command{
  abstract void updateCommandState();
  abstract void run(); 
  abstract boolean canRun(double runTime);
  abstract boolean isDone();
}
