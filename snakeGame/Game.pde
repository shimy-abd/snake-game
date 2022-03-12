import java.io.File;

Snake snake;
Food food;

void setup(){
  size(500, 500);
  snake = new Snake();
  food = new Food();
}

void draw(){
    background(100);
    snake.draw();
    food.draw();
}

void keyPressed(){
  PVector dir = null;
  if (key == 'w'){
    dir = new PVector(0, -1);
  } else if (key == 'a'){
     dir = new PVector(-1, 0);
  } else if (key == 's'){
     dir = new PVector(0, 1);
  } else if (key =='d'){
     dir = new PVector(1, 0);
  }
  if (dir != null){
    snake.moveAndEat(dir, food);
  }
}
