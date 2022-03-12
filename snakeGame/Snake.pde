class Snake{
 int len = 5;
 int scale = 10;
 int boardSize = 500;
 PVector head;
 PVector dir;
 ArrayList<PVector> points;
 
 Snake(){
   len= 5;
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
 
 void move(PVector dir){
 }
 
  
}
