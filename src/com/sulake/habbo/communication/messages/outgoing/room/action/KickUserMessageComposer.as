package com.sulake.habbo.communication.messages.outgoing.room.action
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class KickUserMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _userId:int;
      
      public function KickUserMessageComposer(param1:int, param2:int = 0, param3:int = 0)
      {
         super();
         this._userId = param1;
         this._roomId = param2;
         this._roomCategory = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this._userId];
      }
      
      public function dispose() : void
      {
      }
   }
}
