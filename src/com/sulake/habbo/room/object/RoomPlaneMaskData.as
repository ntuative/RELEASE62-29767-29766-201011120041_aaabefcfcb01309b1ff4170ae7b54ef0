package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2045:Number = 0.0;
      
      private var var_2003:Number = 0.0;
      
      private var var_2002:Number = 0.0;
      
      private var var_2044:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2003 = param1;
         this.var_2002 = param2;
         this.var_2045 = param3;
         this.var_2044 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2003;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2045;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2002;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2044;
      }
   }
}
