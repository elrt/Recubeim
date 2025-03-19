void cloud(){
  noStroke();
  for (int i = clouds.size()-1; i >= 0; i--) {
    Cloud c = clouds.get(i);
    c.update();
    c.display();
    
    if (c.x > width + c.getWidth()*2) {
      clouds.remove(i);
    }
  }
  

  if (millis() > nextSpawnTime) {
    spawnCloud();
    nextSpawnTime = millis() + random(4000, 8000); 
  }
}
void spawnCloud() {
  float yPos = random(height * 0.2, height * 0.5);
  float baseSize = random(60, 150);
  float speed = map(baseSize, 60, 150, 0.5, 0.2); 
  clouds.add(new Cloud(-random(200, 300), yPos, baseSize, speed));
}
