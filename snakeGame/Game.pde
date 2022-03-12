import java.io.File;

static int STARTING_SPEED_CONST = 21;
static int GAME_BOARD_SIZE = 500;
static int SCALE = 10;
static int STARTING_SNAKE_LEN = 5;

Snake snake;
Food food;
int count = 0;
int inverseGameSpeed = 20;

void setup(){
  size(500, 500); // cannot pass a variable to size for some reason
  snake = new Snake(GAME_BOARD_SIZE, SCALE, STARTING_SNAKE_LEN);
  food = new Food(GAME_BOARD_SIZE, SCALE);
}

void draw(){
  if (count++ == inverseGameSpeed){
    count = 0;
    int status = snake.moveAndEat(null, food);
    if (status < 0) {
      endGame();
      return;
    }
    if (inverseGameSpeed > 1)
      inverseGameSpeed = STARTING_SPEED_CONST - (snake.getLen()/5);
  }
  background(100);
  snake.draw();
  food.draw();
  textSize(15);
  text("Score: " + getScore(), 40, 480);
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
    int status = snake.moveAndEat(dir, food);
    if (status < 0)
      endGame();
  }
}
  
  void endGame(){
    background(40);
    textSize(30);
    text("Game Over", 180, 250);
    textSize(15);
    text("Score: " + getScore(), 180, 275);
    noLoop();
  }
  
  int getScore(){
    return snake.getLen() - STARTING_SNAKE_LEN;
  }
