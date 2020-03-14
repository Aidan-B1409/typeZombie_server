abstract class PhysicsObject{
  PVector position, velocity;
  int xSize, ySize;
  color colour;

  abstract void draw();
  abstract void update();
  abstract boolean isDone();
  
  color getRandomColor(){
     return color( random(0, 255),
                   random(0, 255),
                   random(0,255));
  }
  boolean isOffScreen(){
    return ((position.x >= width) ||
            (position.x <= 0) ||
            (position.y >= height) ||
            (position.y <= 0));
  }
  public PVector getPosition(){
    return position;
  }
}
