int rows, cols;
int total = 0;
int x, y;
Dice dice = new Dice(x, y);
void setup() {
  size(600, 600);
  rows = height/100 - 1;
  cols = width/100 ;
  noLoop();
}

void draw() {
  background(255); // Clear the screen
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      dice.roll();
     dice.show(x * 100, y * 100);// Call the show method on the die variable giving it x and y coordinates
     total += dice.face;
  }
  }
 // total += dice.Dots();
    // Display the total of all dice
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("Total: " + total, width / 2, height - 50);
}

void mousePressed() {
  redraw();
  total = 0;
}
class Dice {
  int face;
   
  Dice(int meow, int mew) {
    x = meow;
    y = mew;
    roll();
  }
 
  void roll() {
    face = (int)(Math.random() * 6) + 1;
  }

  void show(int inputX, int inputY) {
    // Draw the dice cube
    fill(200);
    rect(inputX, inputY, 100, 100);

    // Draw dots based on the face value
    fill(0);
    float dotSize = 20; 
    float dotX = inputX + 50;
    float dotY = inputY + 50;

    // Display dots based on the face value
    if (face == 1 || face == 3 || face == 5 || face == 6) {
      ellipse(dotX, dotY, dotSize, dotSize); // Center 
    }
    if (face >= 2 || face == 6) {
      ellipse(dotX - 30, dotY - 30, dotSize, dotSize); // Top-left 
      ellipse(dotX + 30, dotY + 30, dotSize, dotSize); // Bottom-right 
    }
    if (face >= 4 || face == 6) {
      ellipse(dotX - 30, dotY + 30, dotSize, dotSize); // Bottom-left 
      ellipse(dotX + 30, dotY - 30, dotSize, dotSize); // Top-right 
    }
  }
}
