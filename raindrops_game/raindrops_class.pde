class raindrops {

  PVector loc;
  PVector vel;
  PVector acc;
  int d; 
  float size;
  PImage raindrop;

  raindrops() {
     d = 10;
    loc = new PVector(random(0, width), -d);
    vel = new PVector(0, random(1, 2));
    acc = new PVector(0, .0001);
   raindrop = loadImage("raindrop3.png");

  }
//displays a raindrop at a random spot above the screen
  void display() {
    imageMode(CENTER);
//    ellipse(loc.x,loc.y,d,d);
      image(raindrop,loc.x,loc.y,15,15);
  }
//Causes the raindrop to fall
  void move() {
    loc.add(vel); 
    vel.add(acc);
    }
//raindrop will go back to the top of the screen   
    void reset(){
      loc.set(random(width), 0);
      vel.set(0,random(0,2));
    }
//Removes the raindrop to a point off of the screen
    void goAway(){
     loc.set(height*2,0);
     vel.set(0,0);
     acc.set(0,0); 
    }
 
   void die(){
   if(loc.y >= height){
    die--;
    goAway();
   } 
   }   
 
}
