 raindrops[] raindrops = new raindrops[100];
Catcher catcher;
int index = 1;
int oldTime = 0;
int currentTime = 0;
int timeChange;
int score = 0;
void setup(){
  size(300,300); 
  for(int i = 0; i < raindrops.length; i++){
   raindrops[i] = new raindrops(); 
  }
  catcher = new Catcher();
  textSize(35);
}
    
void draw(){
  background(0,100,200);
  text(score,25,35);
  for(int i = 0; i < index; i++){
   raindrops[i].display();
   raindrops[i].move();
   if(raindrops[i].loc.y > height + raindrops[i].d){
   raindrops[i].reset();
  }
  if(catcher.checkCatcher(raindrops[i]) == true){
    raindrops[i].goAway();
    score++;
  }
  }
  catcher.display();
  catcher.update();
  currentTime = millis();
  timeChange = currentTime - oldTime;
  if (timeChange >= 3000) { 
    oldTime = currentTime;
    index++;
  }
}


 
