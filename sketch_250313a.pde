PFont font;
import ddf.minim.*;
Minim minim;
AudioPlayer[] tracks = new AudioPlayer[3];
void setup() {
  minim = new Minim(this);
  noStroke();
  strokeWeight(0);
  tracks[0] = minim.loadFile("data/music/calm3.mp3");
  tracks[1] = minim.loadFile("data/music/piano.mp3");
  tracks[2] = minim.loadFile("data/music/theme.mp3");
  surface.setTitle("Recubeim");
  noSmooth();
  size(800, 600,P2D);
  font = createFont("minecraft.ttf",30);
  textFont(font);
  playerX = width/2;
  playerY = -1000;
  buttonController();
  plr = new PImage[3];
  plr[0] = loadImage("images/playerS0.png");
  plr[1] = loadImage("images/playerW0.png");  
  plr[2] = loadImage("images/playerW1.png"); 
  spriteSheet = loadImage("images/terrain.png");
  inv = loadImage("images/gui1.jpg");
  Logo = loadImage("data/images/IMG.PNG");
  for (int i = 0; i < SPRITESHEET_ROWS; i++) {
    for (int j = 0; j < SPRITESHEET_COLS; j++) {
      int index = i * SPRITESHEET_COLS + j;
      blockSprites[index] = spriteSheet.get(j * 8, i * 8,8,8);
    }
  }

  spriteSheet.loadPixels();
if (g instanceof PGraphicsOpenGL) {

    PGraphicsOpenGL gl = (PGraphicsOpenGL)g;

    gl.textureSampling(2); // 2 = NEAREST

  }
  generateWorld();
  initInventory();
  updateVisibility();

}

void draw() {

 if (!tracks[currentTrack].isPlaying()) {
    currentTrack = (currentTrack + 1) % tracks.length;
    tracks[currentTrack].play();
  }else if(currentTrack==3){
   currentTrack=0;
  }
  background(135, 206, 235);
   
  textSize(32);
  sceneController();
  textSize(20);
  textAlign(LEFT,CORNER);
  text("FPS: " + (int)frameRate, 640, 20);
  text("Layer: " + layer, 640, 40);
  text("x: " + (int)playerX, 640, 60);
  text("y: " + (int)playerY, 640, 80);
  
}

void LoaderScene(){
  
}
