package com.sulake.habbo.communication.messages.incoming.room.furniture
{
   public class RoomDimmerPresetsMessageData
   {
       
      
      private var _color:uint = 0;
      
      private var var_172:Boolean = false;
      
      private var var_1456:uint = 0;
      
      private var _type:int = 0;
      
      private var _id:int = 0;
      
      public function RoomDimmerPresetsMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_172)
         {
            this._type = param1;
         }
      }
      
      public function set color(param1:uint) : void
      {
         if(!this.var_172)
         {
            this._color = param1;
         }
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set light(param1:int) : void
      {
         if(!this.var_172)
         {
            this.var_1456 = param1;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function setReadOnly() : void
      {
         this.var_172 = true;
      }
      
      public function get light() : int
      {
         return this.var_1456;
      }
   }
}
