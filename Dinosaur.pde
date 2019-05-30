class Dinosaur extends Enemy {

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed = 1f;
  
  Dinosaur(float x, float y){
    super(x,y);
  }
  
  void display(){
    int direction;
    if(speed > 0){direction = RIGHT;
    }else{direction = LEFT;
     }
    
    pushMatrix();
    translate(x,y);
    if(direction == RIGHT){
      scale(1,1);
      image(dinosaur, 0,0,w,h);
    }else{
     scale(-1,1);
     image(dinosaur,-w,0,w,h);
     }
    popMatrix();
  }
  
  void update(){
    float currentSpeed = speed; 
    if(player.y == y){
      if( (player.x > x && speed>0) || (player.x < x && speed<0)){
        currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
      } 
    }
    x += currentSpeed;
    if(x<0 || x > width-w){speed *= -1; }
  }
}
