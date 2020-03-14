import processing.sound.SoundFile;

public class ObjectHandler{
  private ArrayList<Zombie> zombies;
  private ArrayList<ParticleSystem> particleSystems;
  private final int PARTICLE_NUMBER = 100;
  private final String namesFile = "names.txt";
  private String[] names;
  private ElapsedTime spawnTimer;
  private int spawnRate = 5;
  private Scheduler scheduler;
  private Player player;
  private GameScreen gameScreen;
  private ElapsedTime gameTime;
  private Score score;
  private SoundFile pop;
  
  public ObjectHandler(PApplet app, Scheduler scheduler, GameScreen gameScreen, ElapsedTime gameTime, Score score){
    names = loadStrings(namesFile);
    spawnTimer = new ElapsedTime();
    zombies = new ArrayList<Zombie>();
    particleSystems = new ArrayList<ParticleSystem>();
    this.scheduler = scheduler;
    this.player = new Player();
    this.gameScreen = gameScreen;
    this.gameTime = gameTime;
    this.score = score;
    pop = new SoundFile(app, "pop.mp3");
  }
  
  public void run(){
    spawnCheck();
    player.draw();
    
    
    for(Zombie z : zombies){
      z.update();
      z.draw();
      if(z.position.x < player.getThreshold()){
        dumpStack();
        scheduler.addCommand(gameScreen.new EndGame(gameTime.getRuntime()));
        return;
      }
    }
    if(zombies.size() > 0){
      for(int i = (zombies.size()-1); i >= 0; --i){
        Zombie z = zombies.get(i);
        if (z.isDone()){
          scheduler.addCommand(new PopZombie(z));
        }
      }
    }
    
    
    
    for(ParticleSystem p : particleSystems){
      p.update();
      p.draw();
    }
    //garbage collection
    if(particleSystems.size() > 0){
      for(int i = particleSystems.size() -1; i >= 0; i--){
        if(particleSystems.get(i).isClear()){
          particleSystems.remove(i);
        }
      }
    }
    
    
  }
  public void dumpStack(){
    for(int i = particleSystems.size() -1; i >=0; --i){
      particleSystems.remove(i);
    }
    for(int i = zombies.size() -1; i >=0; --i){
      zombies.remove(i);
    }
  }
  
  public void checkZombies(String inputWord){
    for(Zombie z : zombies){
      z.wordMatch(inputWord);
    }
  }
  
  
  private String getRandomName(){
    int i = (int)random(0, (names.length));
    return names[i];
  }
  
  private void spawnCheck(){
    if(spawnTimer.isGreaterThan(spawnRate)){
      scheduler.addCommand(new SpawnZombie());
      spawnTimer.reset();
    }
  }
  
  public class SpawnZombie extends InstantCommand{
    public SpawnZombie(){
      super();
    }
    public void run(){
        zombies.add(new Zombie(getRandomName()));
    }
  }
  
  public class PopZombie extends InstantCommand{
    private Zombie z;
    private PVector position;
    public PopZombie(Zombie z){
      super();
      this.z = z;
      this.position = z.getPosition();
    }
    public void run(){
        particleSystems.add(new ParticleSystem(PARTICLE_NUMBER, position.x, position.y));
        particleSystems.add(new ParticleSystem(PARTICLE_NUMBER, width/2, height/2));
        score.addScore();
        pop.play();
        zombies.remove(z);
    }
    
  }
  
}
