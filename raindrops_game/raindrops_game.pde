//Create array of raindrops
 raindrops[] raindrops = new raindrops[100];
Catcher catcher;
int index = 1;
int oldTime = 0;
int currentTime = 0;
int timeChange;
int score = 0;
PImage stopGame;
boolean gameOver = false;
boolean start = true;

void setup(){
  size(300,300); 
  //assigning values to the PVectors raindrops and catcher
  for(int i = 0; i < raindrops.length; i++){
   raindrops[i] = new raindrops(); 
  }
  catcher = new Catcher();
  stopGame = loadImage("game_over2.jpg");

  textSize(35);
  textAlign(CENTER);
}
    
void draw(){
  //Start Screen
  if(start == true){
   background(128,128,255);
   textAlign(CENTER);
   text("Click to Play",width/2,height/2); 
  }
  else{
  background(0,100,200);
  text(score,25,35);
  //displays raindrop and causes it to move
  for(int i = 0; i < index; i++){
   raindrops[i].display();
   raindrops[i].move();
   //if the raindrop hits the ground, it goes back to the top
  
   if(raindrops[i].loc.y > height + raindrops[i].d){
      gameOver = true;
   }
   if(gameOver == true){
      imageMode(CORNER);
     image(stopGame,0,0,width,height);
     raindrops[i].goAway();
  }
  //when the raindrop and catcher intersect, the 1 will be added to the score and the raindrop will disappear from the screen
  if(catcher.checkCatcher(raindrops[i]) == true){
    raindrops[i].goAway();
    score++;
  }
  }
  //displays the catcher
  catcher.display();
  catcher.update();
  //set the variable currentTime to equal milliseconds
  currentTime = millis();
  //A raindrop falls when 3 seconds have passed and the "time" is set back to zero and a new raindrop will fall
  timeChange = currentTime - oldTime;
  if (timeChange >= 3000) { 
    oldTime = currentTime;
    index++;
  }
  }
}
 
 
void mousePressed(){
 start = false; 
}

 
