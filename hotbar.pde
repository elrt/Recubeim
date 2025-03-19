void drawHotbar() {
  int size = SLOT_SIZE;
  int padding = SLOT_MARGIN;
  int startX = width/2 - (INVENTORY_COLS * (size + padding))/2;
  int y = height - size - 10;
  for(int i = 0; i < INVENTORY_COLS; i++) {
    int x = startX + i * (size + padding);

    fill(i == selectedSlot ? color(0,100) : 0,150);
    rect(x, y, size, size);
    if(inventory[i][0] > 0) {
      image(blockSprites[inventory[i][0]-1], x+8, y+8, size-16, size-16);
    }
  }
}
