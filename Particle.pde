class Particle extends PhysicsObject{
  private final float SIZE_FLOOR = 10,
                    SIZE_ROOF = 35,
                    VELOCITY_X_FLOOR = -5,
                    VELOCITY_X_ROOF = 5,
                    VELOCITY_Y_FLOOR = -5,
                    VELOCITY_Y_ROOF = 5,
                    ACCELERATION = 0.3;
 
 public Particle(float x, float y){
   position = new PVector(x, y);
   buildParticle();
 }
 
 private void buildParticle(){
   velocity = new PVector(random(VELOCITY_X_FLOOR, VELOCITY_X_ROOF),
                          random(VELOCITY_Y_FLOOR, VELOCITY_Y_ROOF));
   xSize = (int)random(SIZE_FLOOR, SIZE_ROOF);
   ySize = xSize;
   colour = getRandomColor();
 }
   
 public void draw(){
   fill(colour);
   ellipse(position.x, position.y, xSize, ySize);
 }
 
 public void update(){
   position.x += velocity.x;
   position.y += velocity.y;
   velocity.y += ACCELERATION;
 }
 public boolean isDone(){
   return isOffScreen();
 }
}
