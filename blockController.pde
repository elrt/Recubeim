void handleBlockAction(boolean pressed) {
  if(pressed) {
    if(mouseButton == LEFT) isBreakingBlock = true;
    else if(mouseButton == RIGHT) isPlacingBlock = true;
  } else {
    isBreakingBlock = false;
    isPlacingBlock = false;
  }
}

void handleContinuousEditing() {
  if(isBreakingBlock) breakBlocks();
  if(isPlacingBlock) placeBlocks();
}

void breakBlocks() {
  PVector mousePos = screenToWorld(mouseX, mouseY);
  PVector gridPos = new PVector(
    floor(mousePos.x / BLOCK_SIZE) * BLOCK_SIZE,
    floor(mousePos.y / BLOCK_SIZE) * BLOCK_SIZE
  );
  
  for(int i = blocks.size()-1; i >= 0; i--) {
    Block b = blocks.get(i);
    if(b.x == gridPos.x && b.y == gridPos.y) {
      
      blocks.remove(i);
      break;
    }
  }
}
void placeBlocks() {
  PVector mousePos = screenToWorld(mouseX, mouseY);

  PVector gridPos = new PVector(
    floor(mousePos.x / BLOCK_SIZE) * BLOCK_SIZE,
    floor(mousePos.y / BLOCK_SIZE) * BLOCK_SIZE
  );

  boolean hasNormalBlock = false;
  boolean hasBackgroundBlock = false;

  for (Block b : blocks) {
    if (b.x == gridPos.x && b.y == gridPos.y) {
      if (b.isBackground) {
        hasBackgroundBlock = true; 
      } else {
        hasNormalBlock = true; 
        break;
      }
    }
  }


  if (!hasNormalBlock) {
    blocks.add(new Block((int)gridPos.x, (int)gridPos.y, 
                        inventory[selectedSlot][0], layer));
  }
}
