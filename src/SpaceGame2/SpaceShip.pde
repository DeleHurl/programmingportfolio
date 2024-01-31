class SpaceShip {
  int x, y, w, health, ammo, turretCount;
  PImage ship;

  SpaceShip(int x, int y) {
    this.x = x;
    this.y = y;
    w = 50;
    health= 1000;
    ammo= 5000;
    turretCount=1;
    ship = loadImage("");
  }

  void display() {
    rectMode(CENTER);
    fill(#F52F0C);
    rect(mouseX-20, mouseY+30, 2, 20);
    rect(mouseX-10, mouseY+30, 2, 20);
    rect(mouseX+20, mouseY+30, 2, 20);
    rect(mouseX+10, mouseY+30, 2, 20);
    rect(mouseX, mouseY+30, 2, 20);
    fill(#0CF550);
    rect(mouseX, mouseY, 40, 50, 15);
    fill(#0F0CF5);
    rect(mouseX, mouseY+20, 60, 15, 15);
  }

  // todo: copy and paste code from spaceship assignment


  void move(int x, int y) {
    this.x =x;
    this.y =y;
  }
  boolean fire() {
    if (ammo>0) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<r.diam/2) {
      return true;
    } else {
      return false;
    }
  }
   boolean intersectPU(PowUp pu) {
    float d = dist(x, y, pu.x, pu.y);
    if (d<pu.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
