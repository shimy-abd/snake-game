class Snake{
 int scale;
 int boardSize;
 PVector head;
 PVector dir;
 ArrayList<PVector> points;
 
 Snake(int boardSize, int scale, int len){
   this.boardSize = boardSize;
   this.scale = scale;
   head = new PVector(boardSize/2, boardSize/2);
   dir = new PVector(1, 0);
   points = new ArrayList<>();
   for (int i = 0; i < len; i++){
     points.add(head.copy().add(dir.copy().mult(-i*scale)));
   }
 }
 
 void draw(){
   for(PVector point: points){
     fill(#FFFFFF);
     square(point.x, point.y, scale);
   }
 }
 
 /**
 newDir(Optional) : new direction for the snake to move in. If null defaults to the previous direction.
 */
 int moveAndEat(PVector newDir, Food food){
   if (newDir != null && dir.equals(newDir.copy().mult(-1))){
     println("Back move not allowed");
     return 1;
   }
   if (newDir != null)
     dir = newDir;
   head.add(dir.copy().mult(scale));
   points.add(0, head.copy());
   if (canEat(food)){
     food.place();
   } else {
     points.remove(points.size()-1);
   }
   if (isCollision()){
     println("Game Over...");
     return -1;
   }
   return 0;
 }
 
 boolean canEat(Food food){
   return food != null && head.equals(food.pos);
 }
 
 boolean isCollision(){
   return head.x < 0 || head.x >= boardSize
     || head.y < 0 || head.y >= boardSize
     || points.lastIndexOf(head) > 0;
 }
 
 int getLen(){
   return points.size();
 }
}
