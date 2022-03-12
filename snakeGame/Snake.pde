class Snake{
 int scale = 10;
 int boardSize = 500;
 PVector head;
 PVector dir;
 ArrayList<PVector> points;
 
 Snake(){
   int len= 5;
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
 
 void moveAndEat(PVector dir, Food food){
   if(this.dir.equals(dir.copy().mult(-1))){
     println("Back move not allowed");
     return;
   }
   this.dir = dir;
   head.add(dir.copy().mult(scale));
   points.add(0, head.copy());
   if (canEat(food)){
     food.place();
   } else {
     points.remove(points.size()-1);
   }
 }
 
 boolean canEat(Food food){
   return head.equals(food.pos);
 }
  
}
