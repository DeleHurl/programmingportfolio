class PowUp {
  int x, y, diam, speed, val;
  PImage powup;
  char type;

  PowUp(int x, int y) {
    this.x= x;
    this.y = y;
    diam = 80;
    speed = 3;
    int rand =int(random(3));
    if (rand == 0) {
      powup = loadImage("Ammo.png");
      type = 'a';
      val =1000;
    } else if (rand== 1) {
      powup =loadImage("health.png");
      type= 'h';
      val =100;
    } else if (rand ==2) {
      powup =loadImage("Turret.png");
      type = 't';
      val =1;
    }
  }
  //rock =loadImage("bana.png");


  void display() {
    imageMode(CENTER);
    powup.resize(diam, diam);
    image(powup, x, y);
    //ellipse(x, y, diam, diam);
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
  boolean intersectPU(PowUp pu) {
    float d= dist(x, y, pu.x, pu.y);
    if (d<pu.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
