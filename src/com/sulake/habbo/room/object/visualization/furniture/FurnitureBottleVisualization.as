package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = -1;
      
      private static const const_814:int = 20;
      
      private static const const_528:int = 9;
       
      
      private var var_663:Boolean = false;
      
      private var var_253:Array;
      
      public function FurnitureBottleVisualization()
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
               this.var_253.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_663)
            {
               this.var_663 = false;
               this.var_253 = new Array();
               this.var_253.push(const_814);
               this.var_253.push(const_528 + param1);
               this.var_253.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(0))
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
