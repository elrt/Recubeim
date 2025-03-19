void keyPressed() {
  if (isSaving || isLoading) {
    handleTextInput(key, keyCode);
    return;
  }
  if (key >= '1' && key <= '9') {
    selectedBlockIndex = key - '1'; 
  }
  if(key == 'E' || key == 'e') inventoryOpen = !inventoryOpen;
  if(inventoryOpen) return;
  
  if(key == 'K' || key == 'k') {
    isSaving = true;
    inputLabel = "Save name:";
    fileName = "";
  }
  if(key == 'L' || key == 'l') {
    isLoading = true;
    inputLabel = "Load name:";
    fileName = "";
  }
  
  if(key >= '1' && key <= '9') selectedSlot = key - '1';
  if(key == 'A' || key == 'a') moveLeft = true;
  if(key == 'D' || key == 'd') moveRight = true;
  if(key == ' ' && isGrounded) velocityY = JUMP_FORCE;
  if(key == 'Z' || key == 'z') layer = true;
  if(key == 'X' || key == 'x') layer = false;
  if(key == 'M' || key == 'm') scenes=0;
}

void keyReleased() {
  if(key == 'A' || key == 'a') moveLeft = false;
  if(key == 'D' || key == 'd') moveRight = false;
}
