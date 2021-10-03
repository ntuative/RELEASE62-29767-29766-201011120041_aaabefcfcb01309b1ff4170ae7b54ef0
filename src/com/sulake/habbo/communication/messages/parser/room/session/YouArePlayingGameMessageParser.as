package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class YouArePlayingGameMessageParser implements IMessageParser
   {
       
      
      private var var_873:Boolean = false;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function YouArePlayingGameMessageParser()
      {
         super();
      }
      
      public function get isPlaying() : Boolean
      {
         return this.var_873;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_873 = param1.readBoolean();
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         this.var_873 = false;
         return true;
      }
   }
}
