public class Scheduler{
  private ArrayList<Command> commands = new ArrayList<Command>();
  private ElapsedTime gameTime;
  private GameScreen gameScreen;
  
  private Scheduler(ElapsedTime gameTime, GameScreen gameScreen){
    //Get the runtime from main
    this.gameTime = gameTime;
    this.gameScreen = gameScreen;
    //Default intro sequence commands
    commands.add(gameScreen.new IntroCard(1.5, 0));
    commands.add(gameScreen.new StartCard(1.5, 1.5));
  }
  
  public void run(){
    for(Command c : commands){
      if((c.canRun(gameTime.getRuntime()))){
        if(!c.isDone()){
          c.updateCommandState();
          c.run();
          break;
        }
      }
    }
    //garbage collection
    for(int i = commands.size() - 1; i >= 0; i--){
      Command c = commands.get(i);
      if(c.isDone()){
        commands.remove(c);
      }
    }
  }
  public void addCommand(Command c){
    commands.add(c);
  }
  
}
