package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PlacePetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var _x:int;
      
      private var var_162:int;
      
      private var var_1467:int;
      
      public function PlacePetMessageComposer(param1:int, param2:int, param3:int, param4:int = 0, param5:int = 0)
      {
         super();
         this.var_1467 = param1;
         this._x = param2;
         this.var_162 = param3;
         this._roomId = param4;
         this._roomCategory = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1467,this._x,this.var_162];
      }
      
      public function dispose() : void
      {
      }
   }
}
