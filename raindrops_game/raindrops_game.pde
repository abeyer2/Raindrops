//Create array of raindrops
raindrops[] raindrops = new raindrops[250];
Catcher catcher;
int index = 1;
int oldTime = 0;
int currentTime = 0;
int timeChange;
int score = 0;
PImage stopGame;
boolean gameOver = false;
boolean start = true;
int die;
int rx,ry,rw,rh;
PImage rainFall;
int threshold = 3000;
PImage winner;

void setup() {
  rainFall = loadImage("scene.png");
  size(rainFall.width,rainFall.height); 
  //assigning values to the PVectors raindrops and catcher
  for (int i = 0; i < raindrops.length; i++) {
    raindrops[i] = new raindrops();
  }
  catcher = new Catcher();
  stopGame = loadImage("game_over2.jpg");
  die = 3;
  textSize(35);
  textAlign(CENTER);
  rx = 65;
  ry = 200;
  rw = 165;
  rh = 35;
  winner = loadImage("winner.jpg");
 

}

void draw() {
  //Start Screen
  if (start == true) {
    background(128, 128, 255);
    textAlign(CENTER);
    textSize(35);
    text("Click to Play", width/2, height/2);
  }
  else {
    background(rainFall);
    textAlign(CORNER);
    text("SCORE", 10, 35);
    text(score, 10,75);
    //displays raindrop and causes it to move
    for (int i = 0; i < index; i++) {
      raindrops[i].display();
      raindrops[i].move();
      //if the raindrop hits the ground, it goes back to the top
     raindrops[i].die();
      if (die == 0) {
        gameOver = true;
        
      }
      //When the game is over, a restart button will appear
      if (gameOver == true) { 
        imageMode(CORNER);
        image(stopGame, 0, 0, width, height);
        raindrops[i].goAway();
        catcher.catcherGoAway();
        fill(128,128,255);
        rect(rx,ry,rw,rh);
        fill(255);
        textAlign(CORNER);
        textSize(15);
        text("CLICK TO PLAY AGAIN",rx+5,ry+20);
      }
      //when the raindrop and catcher intersect, the 1 will be added to the score and the raindrop will disappear from the screen
      if (catcher.checkCatcher(raindrops[i]) == true) {
        raindrops[i].goAway();
        score++;
        //When the score increases, the time between falling raindrops will be decreased and they will start to fall faster
        threshold -= 15;
      }
    }
    //displays the catcher
    catcher.display();
    catcher.update();
    //set the variable currentTime to equal milliseconds
    currentTime = millis();
    //A raindrop falls when 3 seconds have passed and the "time" is set back to zero and a new raindrop will fall
    
    timeChange = currentTime - oldTime;
    if (timeChange >= threshold) { 
      oldTime = currentTime;
      index++;
       }
       textAlign(CENTER);
       text("LIVES",255,35);
       text(die,290,75);
  }
  if(gameOver == true){
  //Restart Button
  //When pressed, the game will go to the start screen and the score will be set back to 0
  if(mousePressed == true && mouseX>rx && mouseX<rx+rw && mouseY>ry && mouseY<ry+rh){
    for (int i = 0; i < index; i++){
     raindrops[i].reset(); 
    }
    die = 3;
    start = true;
    gameOver = false;
    index = 1;
    score = 0;
  }
  }
  //Congratulations Screen
  //When the player reaches a score of 25, they win the game
  if(score == 5){
    for (int i = 0; i < index; i++){
     raindrops[i].goAway(); 
    }
    imageMode(CORNER);
    image(winner,0,0,width,height);
  }
}

//Changes the variable start to false so the game can begin
void mousePressed() {
  start = false;
}


