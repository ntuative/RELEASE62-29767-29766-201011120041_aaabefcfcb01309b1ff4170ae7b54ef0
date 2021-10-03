package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneBitmapMask
   {
       
      
      private var var_2003:Number = 0.0;
      
      private var _type:String = null;
      
      private var var_2002:Number = 0.0;
      
      public function RoomPlaneBitmapMask(param1:String, param2:Number, param3:Number)
      {
         super();
         this._type = param1;
         this.var_2003 = param2;
         this.var_2002 = param3;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2003;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2002;
      }
   }
}
