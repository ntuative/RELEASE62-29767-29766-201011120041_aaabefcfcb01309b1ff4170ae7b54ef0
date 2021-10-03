package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SetClothingChangeDataMessageComposer implements IMessageComposer
   {
       
      
      private var var_898:String;
      
      private var var_287:int;
      
      private var var_2267:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function SetClothingChangeDataMessageComposer(param1:int, param2:String, param3:String = "", param4:int = 0, param5:int = 0)
      {
         super();
         this.var_287 = param1;
         this.var_898 = param2;
         this.var_2267 = param3;
         this._roomId = param4;
         this._roomCategory = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_287,this.var_898,this.var_2267];
      }
      
      public function dispose() : void
      {
      }
   }
}
