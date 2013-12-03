raindrops[] raindrops = new raindrops[100];
int index = 0;
void setup(){
  size(200,200);
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
}
 
void mousePressed(){
 index++;
} 
