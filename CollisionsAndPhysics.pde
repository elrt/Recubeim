void applyPhysics() {
  if(!isGrounded) velocityY += GRAVITY;
  playerY += velocityY ;
  velocityX *= FRICTION;
  playerX += velocityX;
}

void checkCollisions() {
  isGrounded = false;
  for(Block b : blocks) {
    if(b.isPassable()) continue;
    if(b.x + BLOCK_SIZE < visLeft || b.x > visRight) continue;
    
    if(collide(playerX, playerY, PLAYER_W, PLAYER_H, 
              b.x, b.y, BLOCK_SIZE, BLOCK_SIZE)) {
      float overlapTop = b.y - (playerY + PLAYER_H);
      float overlapBottom = (b.y + BLOCK_SIZE) - playerY;
      float overlapLeft = (b.x + BLOCK_SIZE) - playerX;
      float overlapRight = b.x - (playerX + PLAYER_W);
      
      boolean fromTop = abs(overlapTop) < abs(overlapBottom);
      boolean fromLeft = abs(overlapLeft) < abs(overlapRight);
      
      float minOverlapX = min(abs(overlapLeft), abs(overlapRight));
      float minOverlapY = min(abs(overlapTop), abs(overlapBottom));
      
      if(minOverlapY < minOverlapX) {
        if(fromTop) {
          playerY = b.y+0.0001 - PLAYER_H;
          velocityY = 0;
          isGrounded = true;
        } else {
          playerY = b.y + BLOCK_SIZE;
          velocityY = 0;
        }
      } else {
        if(fromLeft) playerX = b.x + BLOCK_SIZE;
        else playerX = b.x - PLAYER_W;
        velocityX = 0-0.0001;
      }
    }
  }
}

boolean collide(float x1, float y1, float w1, float h1, 
                float x2, float y2, float w2, float h2) {
  return x1 < x2 + w2 && 
         x1 + w1 > x2 && 
         y1 < y2 + h2 && 
         y1 + h1 > y2;
}
