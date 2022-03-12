class Food{
  PVector pos;
  int boardSize;
  int scale;
  
  Food(int boardSize, int scale){
    this.boardSize = int(boardSize/scale);
    this.scale = scale;
    place();
  }
  
  void draw(){
    fill(200, 100, 0);
    square(pos.x, pos.y, scale);
  }
  
  void place(){
    pos = new PVector(int(random(boardSize-1))*scale, int(random(boardSize-1))*scale);
  }
}
