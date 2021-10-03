package com.sulake.habbo.communication.messages.parser.room.action
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SleepMessageParser implements IMessageParser
   {
       
      
      private var _userId:int = 0;
      
      private var var_2304:Boolean = false;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function SleepMessageParser()
      {
         super();
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         this._userId = 0;
         return true;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get sleeping() : Boolean
      {
         return this.var_2304;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this._userId = param1.readInteger();
         this.var_2304 = param1.readBoolean();
         return true;
      }
   }
}
