package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1106:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const const_814:int = 10;
      
      private static const const_528:int = 20;
       
      
      private var var_663:Boolean = false;
      
      private var var_253:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_253 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
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
         if(param1 > 0 && param1 <= const_814)
         {
            if(this.var_663)
            {
               this.var_663 = false;
               this.var_253 = new Array();
               this.var_253.push(const_814 + param1);
               this.var_253.push(const_528 + param1);
               this.var_253.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
