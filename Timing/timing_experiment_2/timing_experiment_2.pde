int oldTime = 0;
int currentTime = 0;
int timeChange;

void setup(){
  size(200,200);
}

void draw(){
  currentTime = millis();
  timeChange = currentTime-oldTime;
  if(timeChange >= 2000){
   fill(0,random(255),random(255));
  ellipse(random(width),random(height),10,10);
   oldTime = currentTime; 
  }
}
