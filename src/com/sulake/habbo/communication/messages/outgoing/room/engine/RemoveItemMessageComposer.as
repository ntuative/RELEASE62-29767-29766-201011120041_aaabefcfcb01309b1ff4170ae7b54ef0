package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RemoveItemMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_287:int;
      
      public function RemoveItemMessageComposer(param1:int, param2:int = 0, param3:int = 0)
      {
         super();
         this.var_287 = param1;
         this._roomId = param2;
         this._roomCategory = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_287];
      }
      
      public function dispose() : void
      {
      }
   }
}
