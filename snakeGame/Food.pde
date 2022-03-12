class Food{
  PVector pos;
  int boardSize = 50;
  int scale = 10;
  
  Food(){
    place();
  }
  
  void draw(){
    fill(200, 100, 0);
    square(pos.x, pos.y, scale);
  }
  
  void place(){
    pos = new PVector(int(random(boardSize-scale))*scale, int(random(boardSize-scale))*scale);
  }
}
