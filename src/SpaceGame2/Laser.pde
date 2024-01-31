class Laser {
  int x, y, w, h, speed;

  Laser(int x, int y) {
    this.x= x;
    this.y = y;
    w = 6;
    h = 10;
    speed = 10;
  }

  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y -=speed;
  }

  boolean reachedTop() {
    if (y < -10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d= dist(x, y, r.x, r.y);
    if (d<r.diam) {
      return true;
    } else {
      return false;
    }
  }
}
