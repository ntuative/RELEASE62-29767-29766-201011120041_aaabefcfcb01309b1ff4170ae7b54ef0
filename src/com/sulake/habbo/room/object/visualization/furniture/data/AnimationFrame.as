package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_656:int = -1;
      
      public static const const_1004:int = -1;
       
      
      private var var_2367:int = 0;
      
      private var var_2368:int = -1;
      
      private var var_162:int = 0;
      
      private var var_2366:int = 1;
      
      private var var_1685:int = 1;
      
      private var var_862:int = 1;
      
      private var var_2369:Boolean = false;
      
      private var _x:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int = -1, param8:int = 0)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_162 = param3;
         this.var_2369 = param6;
         if(param4 < 1)
         {
            param4 = 1;
         }
         this.var_2366 = param4;
         if(param5 < 0)
         {
            param5 = const_656;
         }
         this.var_862 = param5;
         this.var_1685 = param5;
         if(param7 >= 0)
         {
            this.var_2368 = param7;
            this.var_2367 = param8;
         }
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.var_862 > 0 && param1 > this.var_862)
         {
            param1 = this.var_862;
         }
         this.var_1685 = param1;
      }
      
      public function get y() : int
      {
         return this.var_162;
      }
      
      public function get frameRepeats() : int
      {
         return this.var_862;
      }
      
      public function get activeSequenceOffset() : int
      {
         return this.var_2367;
      }
      
      public function get id() : int
      {
         if(this._id >= 0)
         {
            return this._id;
         }
         return -this._id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(this.var_862 < 0)
         {
            return const_656;
         }
         return this.var_1685;
      }
      
      public function get activeSequence() : int
      {
         return this.var_2368;
      }
      
      public function get isLastFrame() : Boolean
      {
         return this.var_2369;
      }
      
      public function get repeats() : int
      {
         return this.var_2366;
      }
      
      public function get x() : int
      {
         return this._x;
      }
   }
}
