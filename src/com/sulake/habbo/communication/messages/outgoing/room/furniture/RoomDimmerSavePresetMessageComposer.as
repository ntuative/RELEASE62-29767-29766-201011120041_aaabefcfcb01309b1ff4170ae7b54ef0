package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_2048:int;
      
      private var var_2049:int;
      
      private var var_2050:Boolean;
      
      private var var_2047:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2046:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2049 = param1;
         this.var_2048 = param2;
         this.var_2047 = param3;
         this.var_2046 = param4;
         this.var_2050 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2049,this.var_2048,this.var_2047,this.var_2046,int(this.var_2050)];
      }
      
      public function dispose() : void
      {
      }
   }
}
