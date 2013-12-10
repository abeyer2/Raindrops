class Catcher{
  PVector loc;
  int d;
  PImage umbrella;
 Catcher(){
 loc = new PVector(mouseX,height-d);
 d = 30;
umbrella = loadImage("umbrella3.png");
 } 
 //
 void display(){
//  ellipse(loc.x,loc.y,d,d);
image(umbrella,loc.x,loc.y,50,50);
 } 
 void update(){
  loc.set(mouseX,height-d);
 } 
 //when the distance between the catcher and the raindrop is 0, the raindrop will be removed from the screen
  boolean checkCatcher(raindrops drop){
  if(loc.dist(drop.loc) < d/2 + drop.d/2){
   drop.reset();
   return true;
  } 
  else{
  return false;
  }
  }
}
