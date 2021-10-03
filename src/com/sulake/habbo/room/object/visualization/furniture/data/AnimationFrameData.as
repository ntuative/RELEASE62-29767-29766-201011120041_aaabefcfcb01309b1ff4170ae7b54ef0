package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrameData
   {
       
      
      private var _x:int = 0;
      
      private var _id:int = 0;
      
      private var var_2405:int = 0;
      
      private var var_2404:int = 0;
      
      private var var_2366:int = 1;
      
      private var var_162:int = 0;
      
      public function AnimationFrameData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_162 = param3;
         this.var_2405 = param4;
         this.var_2404 = param5;
         this.var_2366 = param6;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get y() : int
      {
         return this.var_162;
      }
      
      public function get randomX() : int
      {
         return this.var_2405;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get randomY() : int
      {
         return this.var_2404;
      }
      
      public function get repeats() : int
      {
         return this.var_2366;
      }
   }
}
