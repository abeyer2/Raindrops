class raindrops {

  PVector loc;
  PVector vel;
  PVector acc;
  int d; 
  float size;


  raindrops() {
    loc = new PVector(random(0, width), 0);
    vel = new PVector(0, random(0, 2));
    acc = new PVector(0, .0001);
    d = 10; 

  }

  void display() {

    ellipse(loc.x,loc.y,d,d);
  }

  void move() {

    loc.add(vel); 
    vel.add(acc);
    }
    
    void reset(){
      loc.set(random(width), 0);
      vel.set(0,random(0,2));
    }
    
 
}
