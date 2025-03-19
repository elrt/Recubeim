class Block {
  int x, y, type;
  boolean isBackground;
  
  Block(int x, int y, int type, boolean bg) {
    this.x = x;
    this.y = y;
    this.type = type;
    this.isBackground = bg;
  }
  
void display() {
    if (type < 1 || type > blockSprites.length) return;
    
    PImage tex = blockSprites[type - 1];

      if (isBackground) tint(150);
      image(tex, x, y, BLOCK_SIZE, BLOCK_SIZE);
      noTint();
    }
    
  
  boolean isPassable() {
    return isBackground || type == 5 || type == 40 || type== 14 || type== 17 || type== 19 || type== 20 || type== 17 || type== 28 || type== 30 || type== 40 || type== 41 || type== 42 || type== 43 || type== 44 || type== 45 || type== 46 || type== 47 || type== 48;
  }
}

class Button {

  float x, y, w, h; 

  String label;

  color bgColor; 

  color textColor;




  Button(float x, float y, float w, float h, String label) {

    this.x = x;

    this.y = y;

    this.w = w;

    this.h = h;

    this.label = label;

    this.bgColor = color(100, 150, 250); 

    this.textColor = color(255); 
  }




  void display() {

    fill(bgColor);

    rect(x, y, w, h, 10); 

    fill(textColor);

    textAlign(CENTER, CENTER);

    text(label, x + w / 2, y + h / 2); 

  }




  boolean isPressed() {

    return (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && mousePressed);

  }

}
class Cloud {
  float x, y;
  float speed;
  float baseSize;
  ArrayList<PVector> parts;
  
  Cloud(float startX, float startY, float size, float spd) {
    x = startX;
    y = startY;
    baseSize = size;
    speed = spd;
    createParts();
  }
  
  void createParts() {
    parts = new ArrayList<PVector>();
    int numCircles = (int)random(3, 5); 
    for (int i = 0; i < numCircles; i++) {
      parts.add(new PVector(
        random(-baseSize*0.4, baseSize*0.4),
        random(-baseSize*0.2, baseSize*0.2),
        random(baseSize*0.4, baseSize*0.8) 
      ));
    }
  }
  
  void update() {
    x += speed;
  }
  
  void display() {
    fill(255, map(baseSize, 60, 150, 80, 120)); 
    for (PVector p : parts) {
      ellipse(x + p.x, y + p.y, p.z, p.z * 0.7);
    }
  }
  
  float getWidth() {
    float maxWidth = 0;
    for (PVector p : parts) {
      maxWidth = max(maxWidth, p.x + p.z);
    }
    return maxWidth;
  }
}
