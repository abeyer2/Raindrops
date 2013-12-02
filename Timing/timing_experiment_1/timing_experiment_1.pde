//THIS DOESN'T REALLY WORK!

color c = color(0);
int waitTime = 2000;
void setup(){
  size(200,200);
  textSize(50);
  textAlign(CENTER);
  
}

void draw(){
  background(c);
  if(millis()/1000%waitTime == 0){
   c = color(random(255),random(255),random(255)); 
  }
  text(millis()/1000.0,width/2,height*.75);
}

 
