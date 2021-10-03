package com.sulake.habbo.communication.messages.parser.room.chat
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserTypingMessageParser implements IMessageParser
   {
       
      
      private var var_782:Boolean = false;
      
      private var _userId:int = 0;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function UserTypingMessageParser()
      {
         super();
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_782;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         this._userId = 0;
         this.var_782 = false;
         return true;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this._userId = param1.readInteger();
         this.var_782 = param1.readInteger() == 1;
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
   }
}
