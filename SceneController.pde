void sceneController(){
  
  stroke(0);
  if(scenes==0){
    buttonSetup();
    imageMode(CENTER);
    image(Logo,400,300,300,300);
    imageMode(CORNER);
    stroke(0);
    
    if (playButton.isPressed()) {
     scenes=3;
  }
   if(Controls.isPressed()){
    scenes=2;
  } 
  }
  if(scenes==1){
  updateCamera();
  updateVisibility();
  if(!inventoryOpen && !isSaving && !isLoading) {
    applyPhysics();
    checkCollisions();
    handleMovement();
    
  }
  
  drawWorld();
  drawPlayer();
  
  drawHotbar();
  if(inventoryOpen) drawInventory();
  if(isSaving || isLoading) drawTextInput();
  handleContinuousEditing();
  buttonSetup();
  if(Menu.isPressed()){
    scenes=0;
  }else if(Back.isPressed()){
     
   }
  }
  if(scenes==2){
    buttonSetup();
    text("1-9 inventory \n W A S D - move; Space - jump\n Z - 2Layer; X - 1Layer \n K - Save; L - load",width/2,height/2);
    if(Menu.isPressed()){
    scenes=0;
  }
  }
  if(scenes==3){
    buttonSetup();
    if(Menu.isPressed()){
    scenes=0;
    }
    if(load.isPressed()){
      loadIsland();
      scenes=1;
  }
  if(loadmap.isPressed()){
    isLoading = true;
    inputLabel = "Load name:";
    fileName = "";
      scenes=1;
  }
  if(returN.isPressed()){
      
      scenes=1;
  }
}
}
