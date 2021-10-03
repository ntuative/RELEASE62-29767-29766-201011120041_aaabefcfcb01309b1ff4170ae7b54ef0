package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PresentOpenedMessageParser implements IMessageParser
   {
       
      
      private var var_1208:String;
      
      private var var_1530:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function PresentOpenedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1208 = param1.readString();
         this.var_1530 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1208 = "";
         this.var_1530 = 0;
         return true;
      }
      
      public function get itemType() : String
      {
         return this.var_1208;
      }
      
      public function get classId() : int
      {
         return this.var_1530;
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
