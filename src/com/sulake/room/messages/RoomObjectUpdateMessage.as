package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_74:IVector3d;
      
      protected var var_243:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         this.var_74 = param1;
         this.var_243 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return this.var_74;
      }
      
      public function get dir() : IVector3d
      {
         return this.var_243;
      }
   }
}
