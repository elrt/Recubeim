void mousePressed() {
  if(inventoryOpen) handleInventoryClick();
  else handleBlockAction(true);
}

void mouseReleased() {
  handleBlockAction(false);
}
