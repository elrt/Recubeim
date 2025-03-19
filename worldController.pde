void handleMovement() {
  if(moveLeft) velocityX -= MOVE_SPEED ;
  if(moveRight) velocityX += MOVE_SPEED ;
}

void updateCamera() {
    float targetX = playerX - width / 2;
    float targetY = playerY - height / 2;
    camX = lerp(camX, targetX, 0.15);
    camY = lerp(camY, targetY, 0.15);
    camX = constrain(camX, 0, WORLD_WIDTH);
    camY = constrain(camY, -10000, WORLD_HEIGHT);

}

void updateVisibility() {
    visLeft = camX - 10;
    visRight = camX + 1200;
    visTop = camY - height - 500;
    visBottom = camY + height + 500;
}
void generateWorld() {
    int currentHeight = 1;
    int segmentLength = 0;
    int currentSegment = 0;


    float noiseScale = 0.0003; 
    float noiseOffset = 0; 

    for (int x = 0; x < WORLD_WIDTH; x += BLOCK_SIZE) {
     
        float noiseValue = noise(noiseOffset + x * noiseScale);
        currentHeight = (int)map(noiseValue, 0, 1, -1, 1);

        int groundY = height - (currentHeight * BLOCK_SIZE);

        for (int y = groundY; y < height; y += BLOCK_SIZE) {
            int type;
            if (y == groundY) {
                type = 3; 
                blocks.add(new Block(x, y, type, false));

                if (random(1) < 0.15) {
                    blocks.add(new Block(x, y - BLOCK_SIZE, 5, false));
                }

                if (random(1) < TREE_CHANCE) {
                    generateTree(x, groundY - BLOCK_SIZE);
                }
            } else if (y <= groundY + BLOCK_SIZE * 2) {
                blocks.add(new Block(x, y, 4, false));
            } else {
                blocks.add(new Block(x, y, 6, false));
            }
        }
    }
}

void generateTree(int x, int groundY) {
  for(int i = 0; i < TRUNK_HEIGHT; i++) {
    blocks.add(new Block(x, groundY - i*BLOCK_SIZE, TRUNK_ID, true));
  }
  int startY = groundY - (TRUNK_HEIGHT + LEAVES_SIZE - 1)*BLOCK_SIZE;
  int offset = (LEAVES_SIZE - 1)/2 * BLOCK_SIZE;
  for(int dx = -offset; dx <= offset; dx += BLOCK_SIZE) {
    for(int dy = 0; dy < LEAVES_SIZE*BLOCK_SIZE; dy += BLOCK_SIZE) {
      for(int dz = -offset; dz <= offset; dz += BLOCK_SIZE) {
    blocks.add(new Block(
          x + dx, 
          startY + dy, 
          LEAVES_ID, 
          true
        ));
      }
    }
  }
}
PVector screenToWorld(float x, float y) {
  return new PVector(x + camX, y + camY);
}

void drawWorld() {
  pushMatrix();
  
  translate(-camX, -camY);
  for(Block b : blocks) {
    if(b.x + BLOCK_SIZE < visLeft || b.x > visRight || 
       b.y + BLOCK_SIZE < visTop || b.y > visBottom) continue;
    b.display();
  }
  popMatrix();
}

void drawPlayer() {
  pushMatrix();
  translate(-camX, -camY);
  fill(255, 200, 0);
   image(plr[currentFrame],playerX, playerY, PLAYER_W, PLAYER_H);
   
  popMatrix();
}
   /*
    настройке генерации
    
    */
    
