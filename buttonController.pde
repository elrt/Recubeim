Button playButton;
Button Controls;
Button Menu;
Button Back;
Button load;
Button loadmap;
Button returN;

void buttonSetup(){
  if(scenes==0){
  playButton.display();
  Controls.display();
  }else if(scenes==2 || scenes==1){

  Menu.display();
  
  }else if(scenes==1){
  Back.display();
  }else if(scenes==3){
  Menu.display();
  load.display();
  loadmap.display();
  returN.display();
  }
  
}
void buttonController(){

  
    playButton = new Button(0,550, 200, 50, "Play");
    Controls = new Button(600,550, 200, 50, "Controls");
    Menu = new Button(10,40, 100, 50, "Menu");
    Back = new Button(10,490, 100, 50, "Spawn");
    load = new Button(0,400, 200, 50, "Island");
    loadmap = new Button(0,200, 200, 50, "Load");
    returN = new Button(0,300, 200, 50, "Return");
}
