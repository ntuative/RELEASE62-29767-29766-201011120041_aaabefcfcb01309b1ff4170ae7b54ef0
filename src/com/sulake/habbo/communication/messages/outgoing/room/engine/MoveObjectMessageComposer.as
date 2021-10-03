package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class MoveObjectMessageComposer implements IMessageComposer
   {
       
      
      private var _direction:int;
      
      private var _x:int;
      
      private var _roomId:int;
      
      private var _roomCategory:int = 0;
      
      private var var_287:int;
      
      private var var_162:int;
      
      public function MoveObjectMessageComposer(param1:int, param2:int, param3:int, param4:int, param5:int = 0, param6:int = 0)
      {
         super();
         this.var_287 = param1;
         this._x = param2;
         this.var_162 = param3;
         this._direction = param4;
         this._roomId = param5;
         this._roomCategory = param6;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_287,this._x,this.var_162,this._direction];
      }
      
      public function dispose() : void
      {
      }
   }
}
