package com.sulake.habbo.communication.messages.outgoing.room.chat
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class WhisperMessageComposer implements IMessageComposer
   {
       
      
      private var var_2213:String;
      
      private var _roomCategory:int = 0;
      
      private var _text:String;
      
      private var _roomId:int = 0;
      
      public function WhisperMessageComposer(param1:String, param2:String, param3:int = 0, param4:int = 0)
      {
         super();
         this.var_2213 = param1;
         this._text = param2;
         this._roomId = param3;
         this._roomCategory = param4;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:String = this.var_2213 + " " + this._text;
         return [_loc1_];
      }
      
      public function dispose() : void
      {
      }
   }
}
