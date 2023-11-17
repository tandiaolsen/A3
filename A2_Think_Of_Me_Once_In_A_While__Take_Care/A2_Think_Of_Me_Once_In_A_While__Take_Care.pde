import ddf.minim.*;

PImage spriteSheet;      
PImage[] frames;         
int frameCount = 35;     
int frameWidth = 1200;    
int frameHeight = 967;   
int num_columns = 5;     
int num_rows = 7;        
int currentFrame = 0;    

Minim minim;
AudioPlayer player;

void setup() {
  size(800, 600);        
  spriteSheet = loadImage("Crying_SpriteSheet.png"); 
  
    frames = new PImage[frameCount];
  int frameIndex = 0;
  for (int row = 0; row < num_rows; row++) {
    for (int col = 0; col < num_columns; col++) {
      frames[frameIndex] = spriteSheet.get(col * frameWidth, row * frameHeight, frameWidth, frameHeight);
      frameIndex++;
      if (frameIndex >= frameCount) {
        break;
      }
    }
  }
  
  minim = new Minim(this);
  player = minim.loadFile("Think Of Me Once In A While, Take Care.mp3");
  player.cue(19000);
  player.play();
}

void draw() {
  background(255);
  float scaleFactor = 0.8; 
  float displayWidth = frameWidth * scaleFactor;
  float displayHeight = frameHeight * scaleFactor;
  image(frames[currentFrame], (width - displayWidth) / 2, (height - displayHeight) / 2, displayWidth, displayHeight); 
  currentFrame = (currentFrame + 1) % frameCount;
  delay(100);
}
