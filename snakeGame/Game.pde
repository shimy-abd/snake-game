import java.io.File;

Snake snake;
Food food;
int count = 0;
int inverseGameSpeed = 10;

void setup(){
  size(500, 500);
  snake = new Snake();
  food = new Food();
}

void draw(){
  if (count++ == inverseGameSpeed){
    count = 0;
    snake.moveAndEat(null, food);
  }
  background(100);
  snake.draw();
  food.draw();
}

void keyPressed(){
  PVector dir = null;
  if (key == 'w' || keyCode == UP){
    dir = new PVector(0, -1);
  } else if (key == 'a' || keyCode == LEFT){
     dir = new PVector(-1, 0);
  } else if (key == 's' || keyCode == DOWN){
     dir = new PVector(0, 1);
  } else if (key =='d' || keyCode == RIGHT){
     dir = new PVector(1, 0);
  }
  if (dir != null){
    snake.moveAndEat(dir, food);
  }
}
