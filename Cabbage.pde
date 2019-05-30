class Cabbage extends Item{
  
   Cabbage(float x, float y){
     super(x, y);
   }
  
   void display(){
     if(isAlive){
      image(cabbage,x ,y);
     }
   }
   void checkCollision(Player player){
     if(isHit( x, y, w, h, player.x, player.y, player.w, player.h) &&
        player.health < player.PLAYER_MAX_HEALTH &&
        isAlive == true ){
        player.health++;
        isAlive = false;
      }
   }
}
