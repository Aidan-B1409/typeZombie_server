class ParticleSystem{
  ArrayList<Particle> particles = new ArrayList<Particle>();
  
  public ParticleSystem(int particleNumber, float x, float y){
    for(int i = 0; i < particleNumber; i++){
      particles.add(new Particle(x, y));
    }
  }
  
  public void update(){
    for(Particle p : particles){
      p.update();
    }
  }
  
  public void draw(){
    for(Particle p : particles){
      p.draw();
    }
  }
  
  public boolean isClear(){
    for(Particle p : particles){
      if(!p.isDone()){
        return false;
      }
    }
    return true;
  }
}
