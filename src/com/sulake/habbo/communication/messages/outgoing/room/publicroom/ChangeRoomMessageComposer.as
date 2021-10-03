package com.sulake.habbo.communication.messages.outgoing.room.publicroom
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class ChangeRoomMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1862:int = 0;
      
      public function ChangeRoomMessageComposer(param1:int, param2:int = 0, param3:int = 0)
      {
         super();
         this._roomId = param2;
         this._roomCategory = param3;
         this.var_1862 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1862];
      }
      
      public function dispose() : void
      {
      }
   }
}
