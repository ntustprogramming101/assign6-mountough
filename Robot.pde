class Robot extends Enemy{

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;

  float speed = 2f;
  int CD = LASER_COOLDOWN;
  Laser laser;
  
  Robot(float x, float y){
    super(x,y);
    laser = new Laser();
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
      image(robot, 0,0,w,h);
    }else{
     scale(-1,1);
     image(robot,-w,0,w,h);
     }
    popMatrix();
    laser.display();
  }
  
  void update(){
    
    boolean checkX = (speed > 0 && player.x + w/2 > x + HAND_OFFSET_X_FORWARD )
                   ||( speed < 0 && player.x + w/2 < x - HAND_OFFSET_X_BACKWARD );  
    boolean checkY = (abs(y/SOIL_SIZE - player.row)) <= PLAYER_DETECT_RANGE_ROW; 
    float currentSpeed = speed;
  
    if(checkX && checkY){
      if(CD < LASER_COOLDOWN){ CD ++; }
      if(CD == LASER_COOLDOWN){
        if(currentSpeed>0){laser.fire(x+HAND_OFFSET_X_FORWARD, y+HAND_OFFSET_Y, player.x+w/2, player.y+h/2);}
        if(currentSpeed<0){laser.fire(x+HAND_OFFSET_X_BACKWARD, y+HAND_OFFSET_Y, player.x+w/2, player.y+h/2);}
        CD = 0;
      }
    }else{
     x += currentSpeed ;
     if(x<0 || x > width-w){ speed *= -1; }
     }
    laser.update();
  }
  void checkCollision(Player player){
   laser.checkCollision(player);
  }
}
