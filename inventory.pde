
final int SLOT_SIZE = 40;
final int SLOT_MARGIN = 10;
final int INVENTORY_COLS = 9;
final int INVENTORY_ROWS = 8;
final int HOTBAR_ROWS = 1; 
final int INVENTORY_WIDTH = INVENTORY_COLS * (SLOT_SIZE + SLOT_MARGIN) + SLOT_MARGIN;
final int INVENTORY_HEIGHT = (INVENTORY_ROWS + HOTBAR_ROWS) * (SLOT_SIZE + SLOT_MARGIN) + SLOT_MARGIN + 80;

int[] blockIDs = {1, 2, 3, 4, 5, 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,225,226,227,229,230,231,232,233,234,235,236,237,238,239,240,52,53,55,56}; // Массив уникальных ID блоков
int[][] inventory = new int[INVENTORY_COLS][INVENTORY_ROWS + 1];
int selectedSlot = 0;

void drawInventory() {
    fill(0, 100);
    rect(0, 0, width, height);
    int startX = width/2 - INVENTORY_WIDTH/2;
    int startY = height/2 - INVENTORY_HEIGHT/2;

    fill(139, 69, 19);
    image(inv,startX, startY, INVENTORY_WIDTH, INVENTORY_HEIGHT-50);
    
    for (int col = 0; col < INVENTORY_COLS; col++) {
        for (int row = 1; row < INVENTORY_ROWS + 1; row++) { 
            int x = startX + SLOT_MARGIN + col * (SLOT_SIZE + SLOT_MARGIN);
            int y = startY + SLOT_MARGIN + (row-1) * (SLOT_SIZE + SLOT_MARGIN);
            fill(200);
            rect(x, y, SLOT_SIZE, SLOT_SIZE);
            int blockId = inventory[col][row]; 
            if (blockId > 0 && blockId <= blockSprites.length) {
                image(blockSprites[blockId-1], x + 2, y + 2, SLOT_SIZE - 4, SLOT_SIZE - 4);
            }
        }
    }
}

void handleInventoryClick() {
    int startX = width/2 - INVENTORY_WIDTH/2;
    int startY = height/2 - INVENTORY_HEIGHT/2;
    if (mouseX > startX && mouseX < startX + INVENTORY_WIDTH &&
        mouseY > startY && mouseY < startY + INVENTORY_HEIGHT) {
        int clickedCol = (mouseX - startX - SLOT_MARGIN) / (SLOT_SIZE + SLOT_MARGIN);
        int clickedRow = (mouseY - startY - SLOT_MARGIN) / (SLOT_SIZE + SLOT_MARGIN) + 1;
        if (clickedCol >= 0 && clickedCol < INVENTORY_COLS &&
            clickedRow >= 1 && clickedRow < INVENTORY_ROWS + 1) {
            int itemID = inventory[clickedCol][clickedRow];
            if (itemID > 0) {
               
                inventory[selectedSlot][0] = itemID; 
            }
        }
   }
}
void initInventory() {
    int totalSlots = INVENTORY_COLS * INVENTORY_ROWS;
    int blockIndex = 0; 
    for (int row = 1; row < INVENTORY_ROWS + 1; row++) {
        for (int col = 0; col < INVENTORY_COLS; col++) {
            if (blockIndex < blockIDs.length) {
                inventory[col][row] = blockIDs[blockIndex];
                blockIndex++;
            } else {
                inventory[col][row] = 0;
            }
        }
    }
    for (int col = 0; col < INVENTORY_COLS; col++) {
       inventory[col][0] = 0;
    }
}
