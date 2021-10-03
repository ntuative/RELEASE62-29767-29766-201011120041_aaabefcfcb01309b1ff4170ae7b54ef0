package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class UseFurnitureMessageComposer implements IMessageComposer
   {
       
      
      private var _param:int = 0;
      
      private var _roomId:int;
      
      private var _roomCategory:int = 0;
      
      private var var_287:int;
      
      public function UseFurnitureMessageComposer(param1:int, param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.var_287 = param1;
         this._param = param2;
         this._roomId = param3;
         this._roomCategory = param4;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_287,this._param];
      }
   }
}
