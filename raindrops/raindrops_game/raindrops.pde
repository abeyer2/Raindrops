class raindrops {

  PVector loc;
  PVector vel;
  PVector acc;
  int d; 
//  PImage snowflake;
  float size;


  raindrops() {
    loc = new PVector(random(0, width), 0);
    vel = new PVector(0, random(0, 2));
    acc = new PVector(0, .0001);
    d = 10; 
    //   snowflake = loadImage("snowflake3.png");
//    size = random(50, 100);
//    int r = int(random(3, 12));
//    snowflake = loadImage("snowflake"+r+".png");
  }

  void display() {
//    imageMode(CENTER);
//    image(snowflake, loc.x, loc.y, size, size);
    ellipse(loc.x,loc.y,d,d);
  }

  void move() {

    loc.add(vel); 
    vel.add(acc);

    if (loc.x>width) {
      //   loc.x = -d/2;
      loc.x = 0;
    }
    if (loc.y>height) {
      //  loc.x = width + d/2; 
      loc.y = 0;
    }
    // if(loc.y-d/2>height){
    //  loc.y = -d/2; 
    // }
    // if(loc.y+d/2<0){
    //  loc.y = height + d/2; 
    // }
  }
}
