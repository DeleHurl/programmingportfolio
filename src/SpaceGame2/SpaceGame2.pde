//Adele Hurley | 27/ Nov 3023 | SpaceGame2
//SoundFile;
SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowUp> powups = new ArrayList<PowUp>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rockTimer, puTimer;
int score;
boolean play;
int level;
int rTime;
int rocksPassed;

void setup() {
  size(1000, 1000);
  //laser = new soundFile(this,"laser2.wav");
  //fullScreen();
  score = 0;
  level = 1;
  rTime= 1000;
  s1 = new SpaceShip(width/2, height/2);
  rockTimer =new Timer(rTime);
  rockTimer.start();
  puTimer =new Timer(5000);
  puTimer.start();
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    noCursor();
    background(#79A3F5);
    if(frameCount % 500 == 10 ){  
    level ++;
  }
    
    
    // add and display stars
    stars.add (new Star(int(random(width)), -10));
    for (int i = 0; i< stars.size(); i++) {
      Star s = stars.get(i);
      if (s.reachedBottom()) {
        stars.remove(s);
      } else {
        s.display();
        s.move();
      }
    }

    //add Power ups
    if (puTimer.isFinished()) {
      powups.add(new PowUp(int(random(width)), -100));
      puTimer.start();
    }

    //render Power Ups
    for (int i = 0; i<powups.size(); i++) {
      PowUp pu = powups.get(i);
      if (s1.intersectPU(pu)) {
        if (pu.type == 'a') {
          s1.ammo +=pu.val;
        } else if (pu.type == 'h') {
          s1.health +=pu.val;
        } else if (pu.type == 't') {
          if (s1.turretCount < 10) {
            s1.turretCount += pu.val;
          }
        }
        //s1.health-=pu.diam;
        //score +=  pu.diam;
        powups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powups.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
    }

    //add rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -100));
      rockTimer.start();
    }

    //render rocks
    for (int i = 0; i<rocks.size(); i++) {
      rocksPassed++;
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        score +=  r.diam;
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        score =score -1;
      } else {
        r.display();
        r.move();
      }
    }

    //render lasers
    for (int i = 0; i<lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j= 0; j<rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          lasers.remove(l);
          score += r.diam;
          r.diam-= 20;
          if (r.diam<20) {
            rocks.remove(r);
          }
        }
      }
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);

    infoPanel();
    if (s1.health<1 ) {
      //|| rocksPassed>9
      gameOver();
    }
  }
}

void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(15);
  text("Score:" + score, 50, 40);
  text("Health" + s1.health, 150, 40);
  text("Ammo:" + s1.ammo, 240, 40);
  text("Level:" + level, 340, 40);
  text("rocks Passed:" + rocksPassed, 450, 40);

  println("Rocks:" + rocks.size());
  println("Lasers:" + lasers.size());
}

void startScreen() {
  background(150, 150, 205);
  fill(0);
  textAlign(CENTER);
  textSize(44);
  text("Welcome to SpaceGame!", width/2, 300);
  text("By Adele Hurley | 2023", width/2, 350);
  text("click the mouse to begin...", width/2, 400);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(90, 90, 255);
  fill(0);
  textAlign(CENTER);
  textSize(44);
  text("Game Over", width/2, 300);
  text("Score:" + score, width/2, 350);
  text("Level:" + level, width/2, 400);
  noLoop();
}

void ticker() {
}

void mousePressed() {

  if (s1.fire()) {
    //laser.play();
    if (s1.turretCount == 1) {
      lasers.add(new Laser(s1.x, s1.y));
      s1.ammo -= 1;
    } else if (s1.turretCount == 2) {
      lasers.add(new Laser(s1.x-15, s1.y));
      lasers.add(new Laser(s1.x+15, s1.y));
      s1.ammo -= 2;
    } else if (s1.turretCount == 3) {
      lasers.add(new Laser(s1.x, s1.y));
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      s1.ammo -= 3;
    } else if (s1.turretCount == 4) {
      lasers.add(new Laser(s1.x - 15, s1.y));
      lasers.add(new Laser(s1.x + 15, s1.y));
      lasers.add(new Laser(s1.x - 30, s1.y));
      lasers.add(new Laser(s1.x + 30, s1.y));
      s1.ammo -= 4;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    if (s1.fire()) {
      if (s1.turretCount == 1) {
        lasers.add(new Laser(s1.x, s1.y));
        s1.ammo -= 1;
      } else if (s1.turretCount == 2) {
        lasers.add(new Laser(s1.x-15, s1.y));
        lasers.add(new Laser(s1.x+15, s1.y));
        s1.ammo -= 2;
      } else if (s1.turretCount == 3) {
        lasers.add(new Laser(s1.x, s1.y));
        lasers.add(new Laser(s1.x-20, s1.y));
        lasers.add(new Laser(s1.x+20, s1.y));
        s1.ammo -= 3;
      } else if (s1.turretCount == 4) {
        lasers.add(new Laser(s1.x - 15, s1.y));
        lasers.add(new Laser(s1.x + 15, s1.y));
        lasers.add(new Laser(s1.x - 30, s1.y));
        lasers.add(new Laser(s1.x + 30, s1.y));
        s1.ammo -= 4;
      }
    }
  }
}
