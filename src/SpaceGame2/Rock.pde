class Rock {
  int x, y, diam, speed;
  PImage rock;

  Rock(int x, int y) {
    this.x= x;
    this.y = y;
    diam = int(random(20, 120));
    speed = int(random(1, 10));
    int rand =int(random(5));
    if (rand == 0) {
      rock = loadImage("staw.png");
    } else if (rand== 1) {
      rock =loadImage("bana.png");
    } else if (rand ==2) {
      rock =loadImage("kiwi.png");
    } else if (rand== 3) {
      rock =loadImage("dran.png");
    } else if (rand== 4) {
      rock =loadImage("grap.png");
    }
  }
  //rock =loadImage("bana.png");


  void display() {
    imageMode(CENTER);
    rock.resize(diam, diam);
    image(rock, x, y);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
}
