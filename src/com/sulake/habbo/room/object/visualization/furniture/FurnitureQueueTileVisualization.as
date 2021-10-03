package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1208:int = 1;
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1209:int = 2;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_1106:int;
      
      private var var_253:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_253 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1209)
         {
            this.var_253 = new Array();
            this.var_253.push(const_1208);
            this.var_1106 = ANIMATION_DURATION;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_1106 > 0)
         {
            --this.var_1106;
         }
         if(this.var_1106 == 0)
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
