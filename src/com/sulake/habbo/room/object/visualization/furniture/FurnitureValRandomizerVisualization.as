package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1106:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
      
      private static const const_814:int = 20;
      
      private static const const_528:int = 10;
       
      
      private var var_663:Boolean = false;
      
      private var var_253:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_253 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_663)
            {
               this.var_663 = true;
               this.var_253 = new Array();
               this.var_253.push(const_1106);
               this.var_253.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_528)
         {
            if(this.var_663)
            {
               this.var_663 = false;
               this.var_253 = new Array();
               if(_direction == 2)
               {
                  this.var_253.push(const_814 + 5 - param1);
                  this.var_253.push(const_528 + 5 - param1);
               }
               else
               {
                  this.var_253.push(const_814 + param1);
                  this.var_253.push(const_528 + param1);
               }
               this.var_253.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
         {
            if(this.var_253.length > 0)
            {
               super.setAnimation(this.var_253.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
