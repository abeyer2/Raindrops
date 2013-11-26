raindrops[] raindrops = new raindrops[1];
Catcher catcher;
void setup(){
  size(300,300); 
  for(int i = 0; i < raindrops.length; i++){
   raindrops[i] = new raindrops(); 
  }
  catcher = new Catcher();
}
    
void draw(){
  background(0,100,200);
  for(int i = 0; i < raindrops.length; i++){
   raindrops[i].display();
   raindrops[i].move();
  }
  catcher.display();
  catcher.update();
}


 
