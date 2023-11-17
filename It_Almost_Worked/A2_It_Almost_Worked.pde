import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
float eyeX, eyeY, eyeSize;
float pupilX, pupilY;

int SIZE = 45;
float clock;
float seed;

void setup() {
  size(640, 360);
  minim = new Minim(this);
  song = minim.loadFile("TV Girl - It Almost Worked.mp3");
  song.play();
  beat = new BeatDetect();
  
  randomSeed(123789);

  noStroke();
}

void draw() {
  background(255);
  
  beat.detect(song.mix);
  if (beat.isOnset()) {
    
    pupilX =  pupilX = eyeX + random(-eyeSize/4, eyeSize/4);
    pupilY = eyeY + random(-eyeSize/4, eyeSize/4);
  }
    
  clock++;
  
  for(int y = 0; y < 360 + SIZE; y+=SIZE)
  {
    
    for(int x = 0; x < 640 + SIZE; x+=SIZE)
    {

fill(random(75,255), random(25), random(67,255));

rect(x,y,SIZE/2,SIZE);

fill(random(75,255),random(25),random(67,255));

rect(x + SIZE/2,y,SIZE/2,SIZE);

fill(random(100,255),random(100,255),random(100,255));

ellipse(x - SIZE/2, y - SIZE/2, SIZE/1.3, SIZE/1.3);

fill(255);

ellipse(x - SIZE/2, y - SIZE/2, SIZE/1.5, SIZE/3);

fill(0);

ellipse((x - SIZE/2) + pupilX * 5, (y - SIZE/2) + pupilY * 7, SIZE/4, SIZE/4);
    }
  }

}
  
  
  
