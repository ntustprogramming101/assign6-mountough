class Clock extends Item{
  
   Clock(float x, float y){
     super(x, y);
   }
  
   void display(){
     if(isAlive){
      image(clock,x ,y);
     }
   }
   
   void checkCollision(Player player){
     if(isHit( x, y, w, h, player.x, player.y, player.w, player.h) && isAlive == true ){
        addTime(CLOCK_BONUS_SECONDS);
        isAlive = false;
      }
   }
}
