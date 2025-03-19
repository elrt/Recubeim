void saveGame(String filename) {
 
  String[] data = new String[7 + blocks.size()]; 
  
  data[0] = str(playerX);
  data[1] = str(playerY);
  data[2] = str(velocityX);
  data[3] = str(velocityY);
  data[4] = str(selectedSlot);
  data[5] = str(layer);
  

  for(int y = 0; y < 5; y++) {

 
  int index = 7;
  for(Block b : blocks) {
    data[index++] = b.x + "," + b.y + "," + b.type + "," + b.isBackground;
  }
  saveStrings(dataPath("UserSaves/") + "/" + filename + ".txt", data);
  println("Игра сохранена в " + filename + ".txt");
}}
void loadGame(String filename) {
  String[] data = loadStrings(dataPath("UserSaves/") + "/" + filename + ".txt");
  if(data == null || data.length < 7) {
    println("Ошибка: Неверный формат файла сохранения");
    return;
  }

  try {

    playerX = float(data[0]);
    playerY = float(data[1]);
    velocityX = float(data[2]);
    velocityY = float(data[3]);
    selectedSlot = int(data[4]);
    layer = boolean(data[5]);

    // Загрузка блоков
    blocks.clear();
    for(int i = 7; i < data.length; i++) {
      String[] blockData = split(data[i], ",");
      if(blockData.length >= 4) {
        int x = int(blockData[0]);
        int y = int(blockData[1]);
        int type = int(blockData[2]);
        boolean bg = boolean(blockData[3]);
        blocks.add(new Block(x, y, type, bg));
      }
    }
    
    println("Успешно загружено из " + filename + ".txt");
    updateCamera();
    
  } catch (Exception e) {
    println("Критическая ошибка при загрузке: " + e);
    generateWorld(); 
    initInventory();
  }
}

void drawTextInput() {
  fill(0, 150);
  rect(0, 0, width, height);
  
  fill(255);
  textAlign(CENTER);
  textSize(32);
  text(inputLabel, width/2, height/2 - 20);
  text(fileName, width/2, height/2 + 20);
}

void handleTextInput(char key, int keyCode) {
  if(keyCode == BACKSPACE && fileName.length() > 0) {
    fileName = fileName.substring(0, fileName.length() - 1);
  } else if(keyCode == ENTER) {
    if(isSaving) {
      saveGame(fileName);
      isSaving = false;
    } else if(isLoading) {
      loadGame(fileName);
      isLoading = false;
    }
    fileName = "";
  } else if(key >= ' ' && key <= '~') {
    fileName += key;
  }
}



void loadIsland() {
  String[] data = loadStrings(dataPath("GameSaves/") + "/" + "ISLANDMAP" + ".txt");
  if(data == null || data.length < 7) {
    println("Ошибка: Неверный формат файла сохранения");
    return;
  }

  try {

    playerX = float(data[0]);
    playerY = float(data[1]);
    velocityX = float(data[2]);
    velocityY = float(data[3]);
    selectedSlot = int(data[4]);
    layer = boolean(data[5]);

    // Загрузка блоков
    blocks.clear();
    for(int i = 7; i < data.length; i++) {
      String[] blockData = split(data[i], ",");
      if(blockData.length >= 4) {
        int x = int(blockData[0]);
        int y = int(blockData[1]);
        int type = int(blockData[2]);
        boolean bg = boolean(blockData[3]);
        blocks.add(new Block(x, y, type, bg));
      }
    }
    
    println("Успешно загружено из " + "ISLANDMAP" + ".txt");
    updateCamera();
    
  } catch (Exception e) {
    println("Критическая ошибка при загрузке: " + e);
    generateWorld(); 
    initInventory();
  }
}
