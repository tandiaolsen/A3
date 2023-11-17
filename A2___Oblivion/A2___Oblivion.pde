import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

int dim;
float radiusChange = 0;
float radiusDirection = 1;
float radiusSpeed = 15;

void setup() {
  size(640, 360);
  dim = width/2;
  background(255);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(4);
  
  minim = new Minim(this);
  song = minim.loadFile("data/Grimes - Oblivion.mp3");
  song.play();
  
  beat = new BeatDetect();
}

void draw() {
    drawGradient(width /2, height/2); 
    updateRadius();
}

void drawGradient(float x, float y) {
  int radius = dim/2;
  float h = random(0, 360);
  for (int r = radius; r > 0; --r) {
    fill(h, 40, 90);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
}

void updateRadius() {
  radiusChange += radiusDirection * radiusSpeed;
  if (radiusChange > dim/4 || radiusChange < 0) {
    radiusDirection *= -5;
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}
