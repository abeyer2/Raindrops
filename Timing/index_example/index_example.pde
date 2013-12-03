raindrops[] raindrops = new raindrops[100];
int index = 0;
int oldTime = 0;
int currentTime = 0;
int timeChange;
void setup(){
  size(500,500);
  for(int i=0;i < raindrops.length; i++){
   raindrops[i] = new raindrops(); 
  }
  
}

void draw(){
  background(0,100,255);
  for(int i=0;i<= index;i++){
   raindrops[i].display();
   raindrops[i].move(); 
  if(raindrops[i].loc.y > height + raindrops[i].d){
   raindrops[i].reset(); 
  }
  }
  currentTime = millis();
  timeChange = currentTime - oldTime;
  if (timeChange >= 3000) {
    fill(0, random(255), random(255));
    ellipse(random(width), random(height), 10, 10); 
    oldTime = currentTime;
    index++;
  }
}
 
//void mousePressed(){
// index++;
//} 

 
